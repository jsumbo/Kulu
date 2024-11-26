import 'package:flutter/material.dart';
import '/provider/auth_provider.dart' as local;
import '/screens/create_account_screen.dart';
import '/screens/homescreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    final authProvider = context.read<local.KuluAuthProvider>();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final user = await authProvider.signInWithEmailAndPassword(email, password);

    if (user != null) {
      _showSuccessSnackBar('Login Successful!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      _showErrorSnackBar('Invalid login credentials');
    }
  }

  void _loginWithGoogle() async {
    final authProvider = context.read<local.KuluAuthProvider>();

    final user = await authProvider.signInWithGoogle();

    if (user != null) {
      _showSuccessSnackBar('Google Login Successful!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      _showErrorSnackBar('Google Sign-In Failed');
    }
  }

  void _forgotPassword() async {
    final authProvider = context.read<local.KuluAuthProvider>();
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showErrorSnackBar('Please enter your email');
      return;
    }

    final success = await authProvider.resetPassword(email);

    if (success) {
      _showSuccessSnackBar('Password reset link sent to $email');
    } else {
      _showErrorSnackBar('Failed to send password reset link');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: const [
          Icon(Icons.star, color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomInputField(
                'Email', 'helloworld@gmail.com', _emailController),
            const SizedBox(height: 10),
            _buildPasswordField(local.KuluAuthProvider()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(200, 50),
                backgroundColor: Colors.black,
              ),
              child: const Text('Log in'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Image.asset('assets/google_logo.png', height: 24),
              label: const Text('Sign in with Google'),
              onPressed: _loginWithGoogle,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(200, 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
            TextButton(
              onPressed: _forgotPassword,
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen()),
                );
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }

  // Existing input field methods remain the same
  Widget _buildCustomInputField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(local.KuluAuthProvider authProvider) {
    return TextField(
      controller: _passwordController,
      obscureText: !authProvider.isPasswordVisible,
      decoration: InputDecoration(
        hintText: '••••••••',
        suffixIcon: IconButton(
          icon: Icon(authProvider.isPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off),
          onPressed: authProvider.togglePasswordVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
