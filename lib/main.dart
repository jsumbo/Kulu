import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Import your welcome screen
import 'screens/create_account_screen.dart';  // Import your sign-in screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kulu Language App',
      theme: ThemeData(
        fontFamily: 'Poppins',  // Set Poppins as the default font
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
