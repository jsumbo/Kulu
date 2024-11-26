import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kulu_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
import '/provider/auth_provider.dart' as local;
import 'screens/welcome_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/login_screen.dart';
import 'screens/lessons/lessons.dart';
import 'screens/art_screen.dart';
import 'screens/settings_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/proverbs_poetry_screen/proverbs_poetry_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA7nkztXr54TPnnkqx_udMG8weNfHNX-50",
            authDomain: "kulu-f495f.firebaseapp.com",
            projectId: "kulu-f495f",
            storageBucket: "kulu-f495f.firebasestorage.app",
            messagingSenderId: "345848029681",
            appId: "1:345848029681:web:fe818b87e2d2933d692450",
            measurementId: "G-ZPYWWQP8VM"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => local.KuluAuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kulu Language App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthWrapper(),
      routes: {
        "/signup": (context) => const CreateAccountScreen(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/lessons": (context) => const LanguageSelectionScreen(),
        "/art": (context) => const ArtScreen(),
        "/settings": (context) => const SettingsPage(),
        "/edit_profile": (context) => const EditProfilePage(),
        "/proverbs_poetry": (context) => const ProverbsPoetryScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user == null) {
            return const WelcomeScreen();
          } else {
            return const HomeScreen();
          }
        }

        // Show loading indicator while checking authentication state
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
