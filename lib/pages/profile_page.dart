import 'package:biztrack/widgets/app_bar_logo.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(height: 30),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {
            Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 60), // Placeholder profile icon
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'User Name', // Replace with actual user name
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text('user@example.com'), // Replace with actual user email
            ),
            const SizedBox(height: 30),
            const Text('Account Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile Details'),
              onTap: () {
                // TODO: Implement Edit Profile Details functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // TODO: Implement Change Password functionality
              },
            ),
            const SizedBox(height: 20),
            const Text('App Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: const Text('Currency Setting'),
              onTap: () {
                Navigator.pushNamed(context, '/settings'); // Navigate to settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text('Notification Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings'); // Navigate to settings page
              },
            ),
            const SizedBox(height: 20),
            const Text('Support & About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help/FAQ'),
              onTap: () {
                // TODO: Implement Help/FAQ functionality
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About BizTrack'),
              onTap: () {
                // TODO: Implement About BizTrack functionality
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Logout Logic - Clear user session, navigate to login page
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page after logout
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, -1), // -1 or another index if profile is in bottom nav
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