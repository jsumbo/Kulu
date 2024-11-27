import 'package:flutter/material.dart';

class KoloquaQuizScreen extends StatefulWidget {
  const KoloquaQuizScreen({super.key});

  @override
  _KoloquaQuizScreenState createState() => _KoloquaQuizScreenState();
}

class _KoloquaQuizScreenState extends State<KoloquaQuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isQuizCompleted = false;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is "I am fine" in Koloqua?',
      'options': ['Sawubona', 'Unjani?', 'Ah doing fine', 'Mi yidi'],
      'answer': 'Ah doing fine'
    },
    {
      'question': 'How do you say "Where is the bathroom?" in Koloqua?',
      'options': ['Han be en ñari?', 'Hani kanji?', 'Weh de baffroom', 'I don’t understand'],
      'answer': 'Weh de baffroom?'
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= _questions.length) {
        _isQuizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koloqua Quiz'),
      ),
      body: _isQuizCompleted
          ? _buildResultScreen()
          : _buildQuizQuestion(),
    );
  }

  Widget _buildQuizQuestion() {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentQuestion['question'] as String,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...(currentQuestion['options'] as List<String>).map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(option),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(option),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $_score / ${_questions.length}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _isQuizCompleted = false;
                });
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
