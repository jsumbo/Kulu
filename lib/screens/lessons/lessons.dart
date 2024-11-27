import 'package:flutter/material.dart';
import 'zulu_lesson.dart';
import 'swahili_lesson.dart';
import 'fulani_lesson.dart';
import 'koloqua_lesson.dart'; // Import lesson screens here

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Adjust to give some space from the top

            // Title Text
            const Text(
              "Explore African\nLanguages, One Lesson\nat a Time!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // Image (Replace with the correct asset)
            Center(
              child: Image.asset(
                'assets/books.jpg', // Placeholder for the books image
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            // Subheading "Pick from ..."
            const Text(
              "Pick from ...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),

            const SizedBox(height: 20),

            // Language Buttons
            Expanded(
              child: Column(
                children: [
                  LanguageButton(
                    title: "Koloqua",
                    destination: const KoloquaLessonsScreen(),
                  ),
                  LanguageButton(
                    title: "Zulu",
                    destination: const ZuluLessonsScreen(),
                  ),
                  LanguageButton(
                    title: "Swahili",
                    destination: const SwahiliLessonsScreen(),
                  ),
                  LanguageButton(
                    title: "Fulani",
                    destination: const FulaniLessonsScreen(),
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

class LanguageButton extends StatelessWidget {
  final String title;
  final Widget destination;

  const LanguageButton({
    Key? key,
    required this.title,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 2, color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
