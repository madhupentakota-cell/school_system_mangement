import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/theme/custome_appbar.dart';

class PickupRequestScreen extends StatefulWidget {
  const PickupRequestScreen({super.key});

  @override
  State<PickupRequestScreen> createState() => _PickupRequestScreenState();
}

class _PickupRequestScreenState extends State<PickupRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(title: "Pick up request"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: 'Respobile Person',
                hintText: 'Enter full name',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: 'Reason',
                hintText: 'Tell us the reason',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
