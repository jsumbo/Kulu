import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwahiliScreen extends StatefulWidget {
  const SwahiliScreen({super.key});

  @override
  SwahiliScreenState createState() => SwahiliScreenState();
}

class SwahiliScreenState extends State<SwahiliScreen> {
  final TextEditingController _controller = TextEditingController();
  String feedback = '';
  String correctAnswer = '';
  String question = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchLesson();
  }

  void fetchLesson() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('lessons')
        .doc('lesson1')
        .get();
    setState(() {
      question = snapshot['question'];
      correctAnswer = snapshot['correctAnswer'];
      imageUrl = snapshot['image'];
    });
  }

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
            Image.network(
              imageUrl,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Text(
              question,
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
