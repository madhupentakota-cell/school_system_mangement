import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select User Type"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Who are you?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // User Type Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _UserTypeCard(
                    title: "Teacher",
                    icon: Icons.school,
                    onTap: () {
                      // Navigate to teacher dashboard
                      UserModel.userType = "Teacher";
                      // Navigator.pushNamed(context, '/teacher');
                    },
                  ),
                  _UserTypeCard(
                    title: "Parent",
                    icon: Icons.person,
                    onTap: () {
                      // Navigate to parent dashboard
                      UserModel.userType = "Parent";
                      // Navigator.pushNamed(context, '/parent');
                    },
                  ),
                  _UserTypeCard(
                    title: "Incharge",
                    icon: Icons.manage_accounts,
                    onTap: () {
                      UserModel.userType = "Incharge";
                      // Navigate to incharge dashboard
                    },
                  ),
                  _UserTypeCard(
                    title: "Admin",
                    icon: Icons.admin_panel_settings,
                    onTap: () {
                      UserModel.userType = "Admin";
                      // Navigate to admin dashboard
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                switch (UserModel.userType) {
                  case "Admin":
                    Navigator.pushNamed(context, '/admin');
                    break;

                  case "Incharge":
                    Navigator.pushNamed(context, '/incharge');
                    break;

                  case "Parent":
                    Navigator.pushNamed(context, '/parent');
                    break;

                  case "Teacher":
                    Navigator.pushNamed(context, '/teacher');
                    break;

                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid user type")),
                    );
                }
              },
              child: Icon(Icons.subdirectory_arrow_left_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _UserTypeCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
