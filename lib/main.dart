import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lessons_screen.dart';
import 'screens/proverbs_poetry_screen.dart';
import 'screens/culture_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(KuluApp());
}

class KuluApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kulu',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.orangeAccent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
        '/lessons': (context) => LessonsScreen(),
        '/proverbs_poetry': (context) => ProverbsPoetryScreen(),
        '/culture': (context) => CultureScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
