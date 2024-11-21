import 'package:cloud_firestore/cloud_firestore.dart';

class LessonService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createLesson(String userId, Map<String, dynamic> lessonData) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('lessons')
          .add(lessonData);
      print("Lesson added successfully!");
    } catch (e) {
      print("Error adding lesson: $e");
    }
  }
}
