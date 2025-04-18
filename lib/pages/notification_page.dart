import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {
            Navigator.pop(context); // Go back to previous page (e.g., Dashboard)
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example number of notifications
                itemBuilder: (context, index) {
                  return _buildNotificationItem('Notification ${index + 1}', 'This is a sample notification message.'); // Replace with actual notification data
                },
              ),
            ),
            // Optional: Clear All Notifications button
            // ElevatedButton(onPressed: () { /* TODO: Implement Clear All Notifications */ }, child: const Text('Clear All Notifications')),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, -1), // Notifications is likely not in bottom nav
    );
  }

  Widget _buildNotificationItem(String title, String message) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.notifications_active),
        title: Text(title),
        subtitle: Text(message),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Implement action when notification is tapped (e.g., navigate to related transaction/budget)
        },
      ),
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