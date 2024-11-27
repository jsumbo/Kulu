import 'package:flutter/material.dart';
import 'swahili_quiz.dart';

class SwahiliLessonsScreen extends StatelessWidget {
  const SwahiliLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swahili Lessons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildLessonSection("Basic Greetings", [
            {"phrase": "Hello", "translation": "Habari"},
            {"phrase": "How are you?", "translation": "Habari yako?"},
            {"phrase": "I am fine", "translation": "Niko sawa"},
            {"phrase": "Goodbye", "translation": "Kwa heri"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Basic Vocabulary", [
            {"phrase": "Yes", "translation": "Ndiyo"},
            {"phrase": "No", "translation": "Hapana"},
            {"phrase": "Thank you", "translation": "Asante"},
            {"phrase": "Water", "translation": "Maji"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Common Phrases", [
            {"phrase": "Where is the bathroom?", "translation": "Choo kiko wapi?"},
            {"phrase": "How much does it cost?", "translation": "Inagharimu kiasi gani?"},
            {"phrase": "I don’t understand", "translation": "Sielewi"},
          ]),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SwahiliQuizScreen()),
                );
              },
              child: const Text('Take the Quiz'),
            ),
          )
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
