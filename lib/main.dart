import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/fire_base_config/fire_base_settings.dart';
import 'package:schoolmanagementsystem/screens/auth/exam_results_screen.dart';
import 'package:schoolmanagementsystem/screens/auth/fee_screen.dart';
import 'package:schoolmanagementsystem/screens/auth/parent_dashboard.dart';
import 'package:schoolmanagementsystem/screens/auth/user_selection_screen.dart';
import 'package:schoolmanagementsystem/screens/pickup_request_screen.dart';
import 'package:schoolmanagementsystem/screens/teacher/teacher_dashboard.dart';
import 'package:schoolmanagementsystem/theme/app_theme.dart';
import 'screens/auth/login_screen.dart';
// core Flutter primitives
import 'package:flutter/foundation.dart';
// core FlutterFire dependency
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

<<<<<<< HEAD
void main() {
  runApp(const MyApp());
=======
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await fireBaseSettings();
  runApp(MyApp());
>>>>>>> cb5803f (features implemented)
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
<<<<<<< HEAD
        '/pickup': (context) => PickupRequestScreen(),
=======
        '/fee': (context) => FeeScreen(),
>>>>>>> cb5803f (features implemented)
      },
    );
  }
}
