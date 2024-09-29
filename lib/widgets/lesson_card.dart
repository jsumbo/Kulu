import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({Key? key, required this.lesson, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(lesson.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lesson.language),
            LinearProgressIndicator(value: lesson.progress),
          ],
        ),
        trailing: lesson.isPremium ? Icon(Icons.star, color: Colors.amber) : null,
        onTap: onTap,
      ),
    );
  }
}
