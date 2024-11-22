import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// This is the main widget for the Zulu lesson screen.
class ZuluScreen extends StatefulWidget {
  const ZuluScreen({super.key});

  @override
  ZuluScreenState createState() => ZuluScreenState();
}

// This is the state class for the Zulu lesson screen.
class ZuluScreenState extends State<ZuluScreen> {
  // Controller for the text field where the user enters their answer.
  final TextEditingController _controller = TextEditingController();
  
  // Variables to hold the feedback message, correct answer, and questions.
  String feedback = '';
  String correctAnswer = '';
  String questionZulu = '';
  String questionEnglish = '';

  // This method is called when the widget is first created.
  @override
  void initState() {
    super.initState();
    // Fetch the lesson data from Firestore when the widget is initialized.
    fetchLesson();
  }

  // Method to fetch the lesson data from Firestore.
  void fetchLesson() async {
    try {
      // Get the document from the 'lessons' collection with ID 'lesson4'.
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('lessons')
          .doc('lesson4')
          .get();
      
      // Check if the document exists.
      if (snapshot.exists) {
        // Update the state with the fetched data.
        setState(() {
          questionZulu = snapshot['questionZulu'];
          questionEnglish = snapshot['questionEnglish'];
          correctAnswer = snapshot['correctAnswer'];
        });
        // Print the fetched data to the console for debugging.
        print('Question Zulu: $questionZulu');
        print('Question English: $questionEnglish');
        print('Correct Answer: $correctAnswer');
      } else {
        // Print a message if the document does not exist.
        print('Document does not exist');
      }
    } catch (e) {
      // Print any errors that occur during the fetch.
      print('Error fetching lesson: $e');
    }
  }

  // Method to check if the user's answer is correct.
  void checkAnswer() {
    setState(() {
      // Compare the user's answer with the correct answer (case-insensitive and trimmed).
      if (_controller.text.trim().toLowerCase() ==
          correctAnswer.trim().toLowerCase()) {
        feedback = 'Correct!';
      } else {
        feedback = 'Incorrect, try again.';
      }
    });
  }

  // This method builds the UI for the Zulu lesson screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zulu Lesson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the image for the lesson.
            Image.asset(
              'assets/book.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            // Display the Zulu question.
            Text(
              questionZulu.isNotEmpty ? questionZulu : 'Loading question...',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Display the English translation of the question in a smaller, italic font.
            Text(
              questionEnglish.isNotEmpty ? questionEnglish : '',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Text field for the user to enter their answer.
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Your Answer',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Button to submit the answer.
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text('Submit Answer'),
            ),
            const SizedBox(height: 20),
            // Display feedback based on the user's answer.
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
