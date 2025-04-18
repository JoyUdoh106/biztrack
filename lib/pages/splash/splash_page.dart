import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate loading time or initial setup (replace with actual logic)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the Sign Up/Login page after the splash screen
      Navigator.pushReplacementNamed(context, '/login'); // Assuming '/login' is your login page route
    });

    return Scaffold(
      backgroundColor: Colors.blue.shade700, // Example background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BizTrack Logo - Replace with your actual logo widget
            const FlutterLogo(size: 100), // Placeholder logo
            const SizedBox(height: 20),
            const Text(
              'BizTrack',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Simple Business Finance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ), // Loading indicator
          ],
        ),
      ),
    );
  }
}