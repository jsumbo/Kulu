import 'package:flutter/material.dart';
import '/provider/auth_provider.dart';
import '/screens/login_screen.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  CreateAccountScreenState createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _termsAccepted = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _createAccount() async {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms and conditions')),
      );
      return;
    }

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        actions: const [
          Icon(Icons.star, color: Colors.black), // Two-armed star
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomInputField(
                'Username', 'Your Username', _usernameController),
            const SizedBox(height: 10),
            _buildCustomInputField('Email', 'Your Email', _emailController),
            const SizedBox(height: 10),
            _buildPasswordField(authProvider),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  shape: const CircleBorder(), // Circular checkbox
                  value: _termsAccepted,
                  onChanged: (newValue) {
                    setState(() {
                      _termsAccepted = newValue ?? false;
                    });
                  },
                ),
                const Text('Accept Terms and Privacy Policy'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _termsAccepted ? _createAccount : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(
                    200, 50), // Rectangular button with smooth corners
                backgroundColor: Colors.black,
              ),
              child: const Text('Create Account'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildPasswordField(AuthProvider authProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
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
        ),
      ],
    );
  }
}
