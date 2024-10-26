import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// The root widget MyApp which is stateless

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp which is the base that provides material design and manages navigation.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // The first screen that is displayed.
    );
  }
}

// This is the main welcome screen of the app.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),

        // Column is used to arrange widgets vertically.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First row: 'Welcome to'
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Second Row: 'Kulu!'
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Kulu!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adds vertical space between text and image.

            // Image Widget: Displays an image from assets.
            Image.asset(
              'assets/reading_character.jpg',
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 30), // Adds space between the image and the buttons.

            // Expanded widget to make the button area take up the remaining space.
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // First Row of buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FeatureButton(title: "Lessons"), // Button for Lessons.
                      FeatureButton(title: "Proverbs & Poetry"), // Button for Proverbs & Poetry.
                    ],
                  ),

                  const SizedBox(height: 16), // Adds space between rows of buttons.

                  // Second Row of buttons.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FeatureButton(title: "Culture"), // Button for Culture.
                      FeatureButton(title: "... More!"), // Button for additional options.
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A reusable button widget for the feature buttons on the welcome screen.
class FeatureButton extends StatelessWidget {
  final String title; // The title displayed on the button.

  const FeatureButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Button width.
      height: 60, // Button height.

      // ElevatedButton is used to create the button.
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        // Text inside the button.
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
