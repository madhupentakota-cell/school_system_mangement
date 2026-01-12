import 'package:flutter/material.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final _reasonController = TextEditingController();

  String leaveType = "Full day";
  DateTime? fromDate;
  DateTime? toDate;

  final List<Map<String, dynamic>> leaveHistory = [
    {
      "type": "Sick Leave",
      "from": "10 Jan 2026",
      "to": "12 Jan 2026",
      "reason": "Fever",
      "status": "Approved",
    },
    {
      "type": "Casual Leave",
      "from": "02 Jan 2026",
      "to": "02 Jan 2026",
      "reason": "Family Function",
      "status": "Pending",
    },
    {
      "type": "Emergency Leave",
      "from": "28 Dec 2025",
      "to": "28 Dec 2025",
      "reason": "Personal",
      "status": "Rejected",
    },
  ];

  Future<void> pickDate(bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leave Request")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Apply for Leave",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Leave Type
            DropdownButtonFormField<String>(
              value: leaveType,
              items: [
                "Full day",
                "Half day",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => leaveType = v!),
              decoration: const InputDecoration(labelText: "Full day"),
            ),

            const SizedBox(height: 12),

            // From Date
            ListTile(
              onTap: () => pickDate(true),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tileColor: Colors.grey.shade100,
              title: Text(
                fromDate == null
                    ? "Select From Date"
                    : "From: ${fromDate!.day}-${fromDate!.month}-${fromDate!.year}",
              ),
              trailing: const Icon(Icons.calendar_today),
            ),

            const SizedBox(height: 10),

            // To Date
            ListTile(
              onTap: () => pickDate(false),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tileColor: Colors.grey.shade100,
              title: Text(
                toDate == null
                    ? "Select To Date"
                    : "To: ${toDate!.day}-${toDate!.month}-${toDate!.year}",
              ),
              trailing: const Icon(Icons.calendar_today),
            ),

            const SizedBox(height: 12),

            // Reason
            TextField(
              controller: _reasonController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Reason",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (fromDate == null || toDate == null) return;

                  setState(() {
                    leaveHistory.insert(0, {
                      "type": leaveType,
                      "from":
                          "${fromDate!.day}-${fromDate!.month}-${fromDate!.year}",
                      "to":
                          "${toDate!.day}-${toDate!.month}-${toDate!.month}-${toDate!.year}",
                      "reason": _reasonController.text,
                      "status": "Pending",
                    });
                  });

                  _reasonController.clear();
                  fromDate = null;
                  toDate = null;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Leave request submitted")),
                  );
                },
                child: const Text("Submit Leave Request"),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Leave History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ListView.builder(
              itemCount: leaveHistory.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = leaveHistory[index];

                Color statusColor = item["status"] == "Approved"
                    ? Colors.green
                    : item["status"] == "Rejected"
                    ? Colors.red
                    : Colors.orange;

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(item["type"]),
                    subtitle: Text(
                      "${item["from"]} to ${item["to"]}\n${item["reason"]}",
                    ),
                    trailing: Text(
                      item["status"],
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
