import 'package:flutter/material.dart';
import 'zulu_quiz.dart';

class ZuluLessonsScreen extends StatelessWidget {
  const ZuluLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zulu Lessons'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildLessonSection("Basic Greetings", [
            {"phrase": "Hello", "translation": "Sawubona"},
            {"phrase": "How are you?", "translation": "Unjani?"},
            {"phrase": "I am fine", "translation": "Ngiyaphila"},
            {"phrase": "Goodbye", "translation": "Sala kahle"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Basic Vocabulary", [
            {"phrase": "Yes", "translation": "Yebo"},
            {"phrase": "No", "translation": "Cha"},
            {"phrase": "Thank you", "translation": "Ngiyabonga"},
            {"phrase": "Water", "translation": "Amanzi"},
          ]),
          const SizedBox(height: 16),
          buildLessonSection("Common Phrases", [
            {"phrase": "Where is the bathroom?", "translation": "Ikuphi indlu yangasese?"},
            {"phrase": "How much does it cost?", "translation": "Kubiza malini?"},
            {"phrase": "I don’t understand", "translation": "Angiqondi"},
          ]),

          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZuluQuizScreen()),
                );
              },
              child: const Text('Start Quiz'),
            )
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
