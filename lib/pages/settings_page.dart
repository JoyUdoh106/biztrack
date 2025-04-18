import 'package:biztrack/widgets/app_bar_logo.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _budgetAlertsEnabled = true; // Example setting, load from saved preferences

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
            Navigator.pop(context); // Go back to profile page (assuming settings is accessed from profile)
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: const Text('Currency'),
              trailing: const Text('USD'), // Example current currency - load from preferences
              onTap: () {
                // TODO: Implement Currency Selection functionality (e.g., show a dialog or new page)
              },
            ),
            // Add more general settings like Language, Theme if needed
            const SizedBox(height: 20),
            const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Budget Alerts'),
              value: _budgetAlertsEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _budgetAlertsEnabled = newValue;
                  // TODO: Save budget alert setting to preferences
                });
              },
            ),
            // Add more notification settings like Transaction Reminders if needed
            const SizedBox(height: 20),
            const Text('About & Support', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, -1), // Settings is likely not in bottom nav
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