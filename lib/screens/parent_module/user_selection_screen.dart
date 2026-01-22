import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../models/user_model.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  final int pinLength = 4;

  final TextEditingController _pinController = TextEditingController();

  late List<FocusNode> focusNodes;
  String pin = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pinController.text = '';
    _pinController.dispose();
    super.dispose();
  }


  void onPinChanged(String value, int index) {
    print("pin: $value");
    if (value.isNotEmpty && index < pinLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void submitPin() {
    final pin = _pinController.text;
    if (pin.length != pinLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter complete PIN")),
      );
      return;
    } else {
      switch (pin) {
        case "1234":
          Navigator.pushNamed(context, "/teacher");
        case "1111":
          Navigator.pushNamed(context, "/parent");
        case "2222":
          Navigator.pushNamed(context, "/teacher");
        default:
          Navigator.pushNamed(context, "/parent");
      }
    }

    print("Entered PIN: $pin");

    // TODO: Verify PIN / Navigate
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          const Text(
            "Enter your PIN code",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Center(
            child: Pinput(
              controller: _pinController,
              obscureText: true,
              obscuringCharacter: "*",
            ),
          ),
          SizedBox(height: 21),
          const Text(
            "for teacher dashboard \n 1111",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: ElevatedButton(
            onPressed: submitPin,
            child: const Text("Verify"),
          ),
        ),
      ),
    );
  }
}
