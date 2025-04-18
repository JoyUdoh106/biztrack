import 'package:biztrack/widgets/app_bar_logo.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _reportType = 'Monthly'; // Default report type

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
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Report Type'),
              value: _reportType,
              items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly', 'Custom']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _reportType = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Generate Report Logic based on _reportType and date range (if applicable)
                // For now, just show a placeholder report
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('$_reportType Financial Statement'),
                      content: const Text('Report content will be displayed here. (e.g., tables, charts)'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Generate Report'),
            ),
            const SizedBox(height: 20),
            // TODO: Display the actual Financial Report here (Tables, Charts, etc.)
            const Text(
              'Report Preview (Placeholder)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Report content will appear here after generation.'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 4), // 4 for Reports active
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