import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/screens/auth/exam_results_screen.dart';
import 'package:schoolmanagementsystem/screens/auth/parent_dashboard.dart';
import 'package:schoolmanagementsystem/screens/auth/user_selection_screen.dart';
import 'package:schoolmanagementsystem/screens/pickup_request_screen.dart';
import 'package:schoolmanagementsystem/screens/teacher/teacher_dashboard.dart';
import 'package:schoolmanagementsystem/theme/app_theme.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/parent': (context) => ParentDashboard(),
        '/userType': (context) => UserTypeScreen(),
        '/teacher': (context) => TeacherDashboard(),
        '/result': (context) => StudentResultScreen(),
        '/pickup': (context) => PickupRequestScreen(),
      },
    );
  }
}
