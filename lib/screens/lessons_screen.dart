import 'package:flutter/material.dart';
import 'swahili.dart';
import 'zulu.dart';
import 'koloqua.dart';
import 'fulani.dart';

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
            leading:
                Text(languages[index]['flag']!, style: TextStyle(fontSize: 24)),
            title: Text(languages[index]['name']!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the appropriate screen based on the language
              switch (languages[index]['name']) {
                case 'Swahili':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SwahiliScreen()),
                  );
                  break;
                case 'Zulu':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ZuluScreen()),
                  );
                  break;
                case 'Koloqua':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KoloquaScreen()),
                  );
                  break;
                case 'Fulani':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FulaniScreen()),
                  );
                  break;
                default:
                  break;
              }
            },
          ),
        );
      },
    );
  }
}
