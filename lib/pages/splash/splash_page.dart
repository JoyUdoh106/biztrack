import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate loading time or initial setup (replace with actual logic)
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the Sign Up/Login page after the splash screen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login'); // Assuming '/login' is your login page route
    });

    return Scaffold(
      backgroundColor: Colors.blue.shade700, // Example background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BizTrack Logo - Replace with your actual logo widget
            Image.asset(
              'assets/images/biztrack_logo.jpg',

                width: 120, // Adjust width as needed
                height: 120, // Adjust height as needed
            ), // Placeholder logo
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