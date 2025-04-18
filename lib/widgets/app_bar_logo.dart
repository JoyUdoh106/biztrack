import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  final double height; // Optional: Allow setting height for different AppBar sizes

  const AppBarLogo({super.key, this.height = 40}); // Default height

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/biztrack_logo.jpg', // Path to your logo image
      height: height, // Use provided height or default
      fit: BoxFit.contain, // Ensure logo fits within the height
    );
  }
}