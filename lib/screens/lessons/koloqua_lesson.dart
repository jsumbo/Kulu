import 'package:flutter/material.dart';
import 'koloqua_quiz.dart';

class KoloquaLessonsScreen extends StatelessWidget {
  const KoloquaLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koloqua Lessons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildLessonSection("Basic Greetings", [
            {"phrase": "Hello", "translation": "Hello"},
            {"phrase": "How are you?", "translation": "How you deh?"},
            {"phrase": "I am fine", "translation": "Ah doing fine"},
            {"phrase": "Goodbye", "translation": "Bye-bye"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Basic Vocabulary", [
            {"phrase": "Yes", "translation": "Yes"},
            {"phrase": "No", "translation": "No"},
            {"phrase": "Thank you", "translation": "Tenk you"},
            {"phrase": "Water", "translation": "Wata"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Common Phrases", [
            {"phrase": "Where is the bathroom?", "translation": "Weh de baffroom?"},
            {"phrase": "How much does it cost?", "translation": "Ow much e cost?"},
            {"phrase": "I don’t understand", "translation": "Ah no understand"},
          ]),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KoloquaQuizScreen()),
                );
              },
              child: const Text('Start Quiz'),
          ))
        ],
      ),
    );
  }

  Widget buildLessonSection(String title, List<Map<String, String>> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...content.map((item) => Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: Text(
              item['phrase'] ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item['translation'] ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        )),
      ],
    );
  }
}
