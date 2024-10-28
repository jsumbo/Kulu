import 'package:flutter/material.dart';
import 'package:kulu_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
import '/provider/auth_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/login_screen.dart';
import 'screens/lessons.dart';
import 'screens/art_screen.dart';
import 'screens/settings_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/proverbs_poetry_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Add AuthProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kulu Language App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/signup": (context) => CreateAccountScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
        "/lessons": (context) => LanguageSelectionScreen(),
        "/art": (context) => ArtScreen(),
        "/settings": (context) => SettingsPage(),
        "/edit_profile": (context) => EditProfilePage(),
        "/proverbs_poetry": (context) => ProverbsPoetryScreen(),
      },
    );
  }
}
