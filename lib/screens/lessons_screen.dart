import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {'name': 'Swahili', 'flag': '🇹🇿'},
    {'name': 'Zulu', 'flag': '🇿🇦'},
    {'name': 'Koloqua', 'flag': '🇱🇷'},
    {'name': 'Fulani', 'flag': '🇳🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            leading: Text(languages[index]['flag']!, style: TextStyle(fontSize: 24)),
            title: Text(languages[index]['name']!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to specific language lessons
              print('Tapped on ${languages[index]['name']}');
            },
          ),
        );
      },
    );
  }
}
