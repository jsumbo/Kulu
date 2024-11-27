import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lessons_screen.dart'; // Import the LessonsScreen

class LessonOverviewScreen extends StatefulWidget {
  final String language;

  const LessonOverviewScreen({required this.language, super.key});

  @override
  LessonOverviewScreenState createState() => LessonOverviewScreenState();
}

class LessonOverviewScreenState extends State<LessonOverviewScreen> {
  List<Map<String, dynamic>> lessons = [];

  @override
  void initState() {
    super.initState();
    fetchLessons();
  }

  void fetchLessons() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('languages')
          .doc(widget.language)
          .collection('lessons')
          .get();
      setState(() {
        lessons = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    } catch (e) {
      print('Error fetching lessons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.language} Lessons'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lessons[index]['title']),
            subtitle: Text(lessons[index]['description']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonsScreen(
                    language: widget.language,
                    lesson: lessons[index]['id'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
