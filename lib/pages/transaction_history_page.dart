import 'package:biztrack/widgets/app_bar_logo.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: 'Daily', // Default value, change dynamically
                  items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly', 'Custom']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // TODO: Implement Date Range filtering logic
                  },
                ),
                DropdownButton<String>(
                  value: 'All', // Default value, change dynamically
                  items: <String>['All', 'Income', 'Expense', 'Withdrawal']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // TODO: Implement Transaction Type filtering logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example number of transactions
                itemBuilder: (context, index) {
                  return _buildTransactionItem('Transaction ${index + 1}', 'Income', '₹200'); // Replace with actual transaction data
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 1), // 1 for Transactions active
    );
  }

  Widget _buildTransactionItem(String description, String type, String amount) {
    return ListTile(
      leading: const Icon(Icons.arrow_upward, color: Colors.green), // Example icon for income
      title: Text(description),
      subtitle: Text(type),
      trailing: Text(amount),
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