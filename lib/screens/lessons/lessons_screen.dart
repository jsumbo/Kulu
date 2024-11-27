import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonsScreen extends StatefulWidget {
  final String language; // Language (e.g., "zulu")
  final String lesson;   // Lesson type (e.g., "basicGreetings")

  const LessonsScreen({Key? key, required this.language, required this.lesson}) : super(key: key);

  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  Map<String, dynamic>? lessonData; // To store fetched lesson data
  bool isLoading = true; // Loading state
  String errorMessage = ''; // To store error messages

  @override
  void initState() {
    super.initState();
    fetchLessonData(); // Fetch lesson data on initialization
  }

  /// Fetch data from Firestore
  Future<void> fetchLessonData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('languages')
          .doc(widget.language)
          .collection('lessons')
          .doc(widget.lesson)
          .get();

      if (docSnapshot.exists) {
        setState(() {
          lessonData = docSnapshot.data();
          isLoading = false; // Stop loading
        });
      } else {
        setState(() {
          errorMessage = "Document does not exist";
          isLoading = false; // Stop loading even if no data found
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error fetching data: $e";
        isLoading = false; // Stop loading in case of error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.language.toUpperCase()} - ${widget.lesson}',
          style: const TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : lessonData == null
              ? Center(child: Text(errorMessage))
              : buildLessonContent(),
    );
  }

  /// Builds the lesson content UI
  Widget buildLessonContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLessonTitle(),
          const SizedBox(height: 8),
          buildLessonDescription(),
          const SizedBox(height: 16),
          const Text(
            "Content:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          buildContentList(),
        ],
      ),
    );
  }

  /// Builds the lesson title widget
  Widget buildLessonTitle() {
    return Text(
      lessonData?['title'] ?? 'No Title',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds the lesson description widget
  Widget buildLessonDescription() {
    return Text(
      lessonData?['description'] ?? 'No Description',
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  /// Builds the list of phrases and translations
  Widget buildContentList() {
    List<Widget> contentWidgets = [];
    for (int i = 1; i <= lessonData!.keys.where((key) => key.startsWith('phrase')).length; i++) {
      final phraseKey = 'phrase$i';
      final phraseData = lessonData?[phraseKey] as Map<String, dynamic>? ?? {};
      contentWidgets.add(
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: Text(
              phraseData['phrase'] ?? 'No Phrase',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              phraseData['translation'] ?? 'No Translation',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ),
      );
    }
    return Column(children: contentWidgets);
  }
}
