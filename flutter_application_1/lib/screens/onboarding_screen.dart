import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to Artbox',
          body: 'Discover and create stunning tattoo designs.',
          image: const Center(child: Icon(Icons.brush, size: 100)),
        ),
        PageViewModel(
          title: 'Generate Tattoos',
          body:
              'Use our AI generator to create unique tattoos based on your description.',
          image: const Center(child: Icon(Icons.autorenew, size: 100)),
        ),
        PageViewModel(
          title: 'View Tattoos',
          body: 'See how tattoos look on your body or a blank canvas.',
          image: const Center(child: Icon(Icons.remove_red_eye, size: 100)),
        ),
        PageViewModel(
          title: 'Save and Share',
          body: 'Save your favorite designs and share them with the community.',
          image: const Center(child: Icon(Icons.save, size: 100)),
        ),
      ],
      onDone: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onboarding_complete', true);
        Navigator.of(context).pushReplacementNamed('/home');
      },
      onSkip: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onboarding_complete', true);
        Navigator.of(context).pushReplacementNamed('/home');
      },
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: Colors.blue)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        activeColor: Colors.blue,
      ),
    );
  }
}
