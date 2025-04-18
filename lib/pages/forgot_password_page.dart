import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  String _message = ''; // To display success or error messages

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const FlutterLogo(size: 80),
              const SizedBox(height: 40),
              const Text(
                'Enter your email address and we will send you a password reset link.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Implement Forgot Password Logic - Send reset link to email
                  String email = _emailController.text.trim();
                  if (email.isEmpty || !email.contains('@')) {
                    setState(() {
                      _message = 'Please enter a valid email address.';
                    });
                    return;
                  }

                  // Simulate sending password reset email (replace with actual service call)
                  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
                  setState(() {
                    _message = 'Password reset link sent to $email. Please check your inbox.';
                  });
                  // Optionally, you might want to navigate back to the login page after success
                  // Future.delayed(const Duration(seconds: 3), () {
                  //   Navigator.pop(context); // Go back to login page
                  // });
                },
                child: const Text('Send Reset Link'),
              ),
              const SizedBox(height: 10),
              Text(
                _message, // Display success or error message here
                textAlign: TextAlign.center,
                style: TextStyle(color: _message.startsWith('Password') ? Colors.green : Colors.red),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to login page
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}