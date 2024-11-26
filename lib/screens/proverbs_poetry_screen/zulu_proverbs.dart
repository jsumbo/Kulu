import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProverbPoetryScreen(),
    );
  }
}

class ProverbPoetryScreen extends StatefulWidget {
  @override
  _ProverbPoetryScreenState createState() => _ProverbPoetryScreenState();
}

class _ProverbPoetryScreenState extends State<ProverbPoetryScreen> {
  // List of proverbs in Zulu with their English translations
  final List<Map<String, String>> proverbs = [
    {
      "zulu": "Umuntu ngumuntu ngabantu.",
      "english": "A person is a person through other persons."
    },
    {
      "zulu": "Isalakutshelwa sibona ngomopho.",
      "english": "The one who doesn’t listen learns by bloodshed."
    },
    {
      "zulu": "Inkunzi isematholeni.",
      "english": "The future leaders are the youth."
    },
    {
      "zulu": "Indlela ibuzwa kwabaphambili.",
      "english": "You learn the way from those ahead."
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
          "Zulu Proverbs",
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
                    proverbs[currentIndex]["zulu"]!,
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
              "Izaga Nezinkondlo",
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
