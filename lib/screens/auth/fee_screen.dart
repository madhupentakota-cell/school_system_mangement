import 'package:flutter/material.dart';

class FeeScreen extends StatefulWidget {
  const FeeScreen({super.key});

  @override
  State<FeeScreen> createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  final List<Map<String, dynamic>> feeHistory = [
    {
      "receipt": "RCPT-1001",
      "date": "05 Jan 2026",
      "type": "Tuition Fee",
      "term": "Term 1",
      "amount": 5000,
      "mode": "Online",
      "status": "Paid",
    },
    {
      "receipt": "RCPT-1023",
      "date": "10 Jan 2026",
      "type": "Transport Fee",
      "term": "Term 1",
      "amount": 1500,
      "mode": "Cash",
      "status": "Paid",
    },
    {
      "receipt": "RCPT-1054",
      "date": "15 Feb 2026",
      "type": "Exam Fee",
      "term": "Term 1",
      "amount": 800,
      "mode": "UPI",
      "status": "Paid",
    },
    {
      "receipt": "RCPT-1102",
      "date": "05 Mar 2026",
      "type": "Library Fee",
      "term": "Term 1",
      "amount": 500,
      "mode": "Online",
      "status": "Paid",
    },
    {
      "receipt": "RCPT-1201",
      "date": "05 Apr 2026",
      "type": "Tuition Fee",
      "term": "Term 2",
      "amount": 4500,
      "mode": "Card",
      "status": "Paid",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Fees History")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: feeHistory.length,
        itemBuilder: (context, index) {
          final item = feeHistory[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["type"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        label: Text(item["status"]),
                        backgroundColor: Colors.green.shade100,
                        labelStyle: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Text("Receipt: ${item["receipt"]}"),
                  Text("Term: ${item["term"]}"),
                  Text("Date: ${item["date"]}"),

                  const Divider(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ ${item["amount"]}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        item["mode"],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
