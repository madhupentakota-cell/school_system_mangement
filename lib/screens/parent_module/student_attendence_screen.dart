import 'package:flutter/material.dart';

import '../../models/attendence_model.dart';

class AttendanceCalendarScreen extends StatelessWidget {
  AttendanceCalendarScreen({super.key});
  final List<AttendanceDay> monthlyAttendance = List.generate(
    30,
    (index) => AttendanceDay(
      day: index + 1,
      isPresent: index % 6 != 0, // every 6th day absent (sample)
    ),
  );

  @override
  Widget build(BuildContext context) {
    final presentCount = monthlyAttendance.where((e) => e.isPresent).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance - March"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Summary("Present", presentCount, Colors.green),
                    _Summary("Absent", 30 - presentCount, Colors.red),
                    _Summary(
                      "%",
                      ((presentCount / 30) * 100).round(),
                      Colors.blue,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "August",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(),
            // Week Days Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _WeekDay("Mon"),
                _WeekDay("Tue"),
                _WeekDay("Wed"),
                _WeekDay("Thu"),
                _WeekDay("Fri"),
                _WeekDay("Sat"),
                _WeekDay("Sun"),
              ],
            ),

            const SizedBox(height: 10),

            // Calendar Grid
            Expanded(
              child: GridView.builder(
                itemCount: monthlyAttendance.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final day = monthlyAttendance[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: day.isPresent
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: day.isPresent ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekDay extends StatelessWidget {
  final String title;
  const _WeekDay(this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _Summary(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label),
      ],
    );
  }
}
