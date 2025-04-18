// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool _verificationSent = false;
  bool _isVerifying = false;
  String _message = 'Please check your email inbox and click on the verification link we sent to activate your account.';

  @override
  void initState() {
    super.initState();
    // Simulate checking if email is already verified (replace with actual logic)
    _checkEmailVerificationStatus();
  }

  Future<void> _checkEmailVerificationStatus() async {
    setState(() {
      _isVerifying = true;
    });
    await Future.delayed(const Duration(seconds: 3)); // Simulate checking verification status

    // TODO: Replace this simulation with actual email verification status check
    bool isVerified = false; // Replace with actual check result
    if (isVerified) {
      // If already verified, navigate to dashboard or login
      Navigator.pushReplacementNamed(context, '/dashboard'); // Or '/login'
    } else {
      setState(() {
        _isVerifying = false;
        _message = 'Email not yet verified. Please check your inbox and click the verification link.';
      });
    }
  }

  Future<void> _resendVerificationEmail() async {
    setState(() {
      _verificationSent = true;
      _message = 'Resending verification email...';
    });
    await Future.delayed(const Duration(seconds: 2)); // Simulate resending email

    // TODO: Implement Resend Verification Email Logic - Call your service to resend email
    setState(() {
      _message = 'Verification email resent. Please check your inbox.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FlutterLogo(size: 80),
              const SizedBox(height: 40),
              if (_isVerifying)
                const CircularProgressIndicator() // Show loading indicator while checking verification
              else
                Column(
                  children: [
                    Text(
                      _message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _verificationSent ? null : _resendVerificationEmail, // Disable button if already sent
                      child: const Text('Resend Verification Email'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login'); // Go to login page
                      },
                      child: const Text('Go to Login'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}