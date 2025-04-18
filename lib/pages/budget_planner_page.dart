import 'package:biztrack/widgets/app_bar_logo.dart';
import 'package:flutter/material.dart';

class BudgetPlannerPage extends StatelessWidget {
  const BudgetPlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(height: 30),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {
            Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
          }),
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {
            Navigator.pushNamed(context, '/profile'); // Navigate to profile page
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Daily Budget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Current Daily Budget: ₹1,000'), // Replace with dynamic budget value
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
            const LinearProgressIndicator(value: 0.5), // Example progress - replace with dynamic value
            const Text('₹500 remaining today'), // Replace with dynamic remaining amount
            const SizedBox(height: 20),
            const Text(
              'Weekly Budget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Current Weekly Budget: ₹7,000'), // Replace with dynamic budget value
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
            const LinearProgressIndicator(value: 0.8), // Example progress - replace with dynamic value
            const Text('₹1,400 remaining this week'), // Replace with dynamic remaining amount
            const SizedBox(height: 20),
            const Text(
              'Budget History (Example)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Coming Soon: Charts and graphs to visualize your budgeting trends!'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 3), // 3 for Budget active
    );
  }
}

Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed, // To show labels even when more than 3 items
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.swap_vert),
        label: 'Transactions',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline, size: 36), // Larger icon for "Add" in the center
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.savings),
        label: 'Budget',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart),
        label: 'Reports',
      ),
    ],
    onTap: (int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/dashboard');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/transactions');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/add_transaction'); // Or maybe just show a dialog for quick add
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/budget');
          break;
        case 4:
          Navigator.pushReplacementNamed(context, '/reports');
          break;
      }
    },
  );
}