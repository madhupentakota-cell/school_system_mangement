import 'package:flutter/material.dart';

Drawer TeacherDrawer() {
  return Drawer(
    child: Column(
      children: [
        // Account Card
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.indigo,
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          accountName: const Text("Ali Khan"),
          accountEmail: const Text("English"),
          currentAccountPicture: const CircleAvatar(
            child: Icon(Icons.person, size: 40),
          ),
        ),

        const SizedBox(height: 8),

        // Leave Requests
        ListTile(
          leading: const Icon(Icons.assignment_turned_in, color: Colors.indigo),
          title: const Text("Leave Requests"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Navigate to leave requests screen
          },
        ),

        // Biometric
        ListTile(
          leading: const Icon(Icons.fingerprint, color: Colors.indigo),
          title: const Text("Biometric"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Navigate to biometric screen
          },
        ),

        const Divider(),

        // Logout
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text("Logout", style: TextStyle(color: Colors.red)),
          onTap: () {
            // Perform logout action
          },
        ),

        const Spacer(),

        // Optional Footer
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Version 1.0.0",
            // style: ,
          ),
        ),
      ],
    ),
  );
}

class ParentDrawer extends StatelessWidget {
  const ParentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Account Card / Profile
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            accountName: const Text("Mrs. Sana Khan"),
            accountEmail: const Text("Parent of Ali Khan"),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person, size: 40),
            ),
          ),

          const SizedBox(height: 8),

          // Personal Info
          ListTile(
            leading: const Icon(Icons.person, color: Colors.indigo),
            title: const Text("Personal Info"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to personal info screen
            },
          ),

          // Fee History
          ListTile(
            leading: const Icon(Icons.money, color: Colors.indigo),
            title: const Text("Fee History"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to fee history screen
            },
          ),

          // Leave Request
          ListTile(
            leading: const Icon(
              Icons.assignment_turned_in,
              color: Colors.indigo,
            ),
            title: const Text("Leave Request"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to leave request screen
            },
          ),

          // Report Card
          ListTile(
            leading: const Icon(Icons.bar_chart, color: Colors.indigo),
            title: const Text("Report Card"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to report card screen
            },
          ),

          // Complaint
          ListTile(
            leading: const Icon(Icons.report_problem, color: Colors.indigo),
            title: const Text("Complaint"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to complaint screen
            },
          ),

          // pickup request
          ListTile(
            leading: const Icon(
              Icons.directions_bike_sharp,
              color: Colors.indigo,
            ),
            title: const Text("Pickup request"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to complaint screen
              Navigator.pushNamed(context, '/pickup');
            },
          ),

          const Divider(),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              // Perform logout action
              Navigator.pushNamed(context, '/');
            },
          ),

          const Spacer(),

          // Optional Footer / Version
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Version 1.0.0",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
