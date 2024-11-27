import 'package:flutter/material.dart';
import 'fulani_quiz.dart';

class FulaniLessonsScreen extends StatelessWidget {
  const FulaniLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fulani Lessons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildLessonSection("Basic Greetings", [
            {"phrase": "Hello", "translation": "Jam"},
            {"phrase": "How are you?", "translation": "En nala??"},
            {"phrase": "I am fine", "translation": "Mi yidi"},
            {"phrase": "Goodbye", "translation": "Sokni"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Basic Vocabulary", [
            {"phrase": "Yes", "translation": "Eyo"},
            {"phrase": "No", "translation": "Ala"},
            {"phrase": "Thank you", "translation": "Jabbama"},
            {"phrase": "Water", "translation": "Ndiyam"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Common Phrases", [
            {"phrase": "Where is the bathroom?", "translation": "Han be en ñari?"},
            {"phrase": "How much does it cost?", "translation": "Hani kanji?"},
            {"phrase": "I don’t understand", "translation": "Mi yeyi"},
          ]),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FulaniQuizScreen()),
              );
            },
            child: const Text('Start Quiz'),
          ),)
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
