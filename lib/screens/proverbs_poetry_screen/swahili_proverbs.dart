import 'package:flutter/material.dart';

class SwahiliProverbsScreen extends StatefulWidget {
  @override
  _SwahiliProverbsScreenState createState() => _SwahiliProverbsScreenState();
}

class _SwahiliProverbsScreenState extends State<SwahiliProverbsScreen> {
  // List of proverbs in swahili with their English translations
  final List<Map<String, String>> proverbs = [
    {"swahili": "Haraka haraka haina baraka.", "english": "Haste makes waste."},
    {
      "swahili": "Asiyefunzwa na mamaye hufunzwa na ulimwengu.",
      "english":
          "If you're not taught by your mother, the world will teach you."
    },
    {
      "swahili": "Ulimi hauna mfupa lakini huumiza.",
      "english": "The tongue has no bone, yet it crushes."
    },
    {
      "swahili": "Baada ya dhiki faraja.",
      "english": "After hardship comes relief."
    },
  ];

  // Current index to track displayed proverb
  int currentIndex = 0;

  void showNextProverb() {
    setState(() {
      currentIndex = (currentIndex + 1) % proverbs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Swahili Proverbs",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                // Zulu Proverb Box
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    proverbs[currentIndex]["swahili"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // English Translation Box
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    proverbs[currentIndex]["english"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Georgia',
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Next Button
                ElevatedButton(
                  onPressed: showNextProverb,
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: Text(
              "Methali Za Kiswahili",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Color(0xFFFF5678),
                letterSpacing: 2.5,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 8,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
