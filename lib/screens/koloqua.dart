import 'package:flutter/material.dart';

class KoloquaScreen extends StatefulWidget {
  const KoloquaScreen({super.key});

  @override
  _KoloquaScreenState createState() => _KoloquaScreenState();
}

class _KoloquaScreenState extends State<KoloquaScreen> {
  final TextEditingController _controller = TextEditingController();
  String feedback = '';
  final String correctAnswer = 'book'; // Example answer for "book" in Koloqua

  void checkAnswer() {
    setState(() {
      if (_controller.text.trim().toLowerCase() ==
          correctAnswer.toLowerCase()) {
        feedback = 'Correct!';
      } else {
        feedback = 'Incorrect, try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swahili Lesson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/book.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'How you call lay?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const Text(
              '(English: What is this called?)',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text('Submit Answer'),
            ),
            const SizedBox(height: 20),
            Text(
              feedback,
              style: TextStyle(
                fontSize: 18,
                color: feedback == 'Correct!' ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
