import 'package:biztrack/pages/email_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:biztrack/pages/splash/splash_page.dart';
import 'package:biztrack/pages/auth/login_page.dart';
import 'package:biztrack/pages/forgot_password_page.dart';
import 'package:biztrack/pages/dashboard_page.dart';
import 'package:biztrack/pages/auth/signup_page.dart';
import 'package:biztrack/pages/transaction_history_page.dart';
import 'package:biztrack/pages/add_transaction_page.dart';
import 'package:biztrack/pages/budget_planner_page.dart';
import 'package:biztrack/pages/reports_page.dart';
import 'package:biztrack/pages/profile_page.dart';
import 'package:biztrack/pages/settings_page.dart';
import 'package:biztrack/pages/notification_page.dart';

// Import other pages as you create them
// e.g., import 'package:biztrack_app/pages/signup_page.dart';


class BizTrack extends StatelessWidget {
  const BizTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BizTrack', // Your app's name
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize your theme further
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Example AppBar color
          foregroundColor: Colors.white, // Example AppBar text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Example button color
            foregroundColor: Colors.white, // Example button text color
          ),
        ),
        // Define other theme properties as needed (text styles, etc.)
      ),
      initialRoute: '/', // Set the initial page to the splash page
      routes: {
        '/': (context) => const SplashPage(), // Splash/Welcome page
        '/login': (context) => const LoginPage(), // Login page
        '/signup': (context) => const SignupPage(), // Added route for SignupPage
        '/forgot_password': (context) => const ForgotPasswordPage(), // Added route for ForgotPasswordPage
        '/email_verification': (context) => const EmailVerificationPage(), // Added route for EmailVerificationPage
        '/dashboard': (context) => const DashboardPage(), // Dashboard page
        '/transactions': (context) => const TransactionHistoryPage(), // Transaction History page
        '/add_transaction': (context) => const AddTransactionPage(), // Add Transaction page
        '/budget': (context) => const BudgetPlannerPage(), // Budget Planner page
        '/reports': (context) => const ReportsPage(), // Reports/Financial Statement page
        '/profile': (context) => const ProfilePage(), // Profile page
        '/settings': (context) => const SettingsPage(), // Settings page
        '/notifications': (context) => const NotificationPage(), // Notification page
        // Add routes for other pages as you create them
      },
    );
  }
}