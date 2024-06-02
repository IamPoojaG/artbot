import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomButton displays text', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomButton(
          text: 'Click Me',
          onPressed: () {
            // Dummy onPressed function
          },
        ),
      ),
    ));

    // Verify that CustomButton displays the correct text.
    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('CustomButton onPressed is called', (WidgetTester tester) async {
    bool onPressedCalled = false;
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomButton(
          text: 'Click Me',
          onPressed: () {
            onPressedCalled = true;
          },
        ),
      ),
    ));

    // Tap the button.
    await tester.tap(find.text('Click Me'));

    // Wait for onPressed to be called.
    await tester.pump();

    // Verify that onPressed is called.
    expect(onPressedCalled, true);
  });
}
