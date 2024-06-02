import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _favoriteBodyPart = 'Arm';
  String _preferredStyle = 'Traditional';

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorite_body_part', _favoriteBodyPart);
    await prefs.setString('preferred_style', _preferredStyle);
    // You can add additional logic here if needed
    Navigator.of(context).pop(); // Navigate back to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favorite Body Part:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: _favoriteBodyPart,
              onChanged: (String? newValue) {
                setState(() {
                  _favoriteBodyPart = newValue!;
                });
              },
              items: <String>['Arm', 'Leg', 'Back', 'Chest']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Preferred Style:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: _preferredStyle,
              onChanged: (String? newValue) {
                setState(() {
                  _preferredStyle = newValue!;
                });
              },
              items: <String>['Traditional', 'Modern', 'Abstract', 'Minimalist']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePreferences,
              child: const Text('Save Preferences'),
            ),
          ],
        ),
      ),
    );
  }
}
