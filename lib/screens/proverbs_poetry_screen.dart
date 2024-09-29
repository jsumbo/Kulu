import 'package:flutter/material.dart';

class ProverbsPoetryScreen extends StatelessWidget {
  final List<Map<String, String>> content = [
    {
      'type': 'Proverb',
      'text': 'The patient man eats ripe fruit.',
      'language': 'Swahili',
    },
    {
      'type': 'Poetry',
      'text': 'O, Africa\nLand of my birth\nRich in culture\nAnd natural worth',
      'language': 'English',
    },
    // Add more proverbs and poetry
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content[index]['type']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  content[index]['text']!,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 5),
                Text(
                  'Language: ${content[index]['language']}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
