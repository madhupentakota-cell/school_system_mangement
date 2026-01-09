import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/service/parent_service.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = ParentService().weeklyTimetable;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Table"),
        centerTitle: true,
      ),
      body: PageView(
        children: timetable.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day Header
                Center(
                  child: Text(
                    entry.key,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 16),

                // Periods
                Expanded(
                  child: ListView.builder(
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      final item = entry.value[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.book),
                          title: Text(item.subject),
                          subtitle: Text(item.teacher),
                          trailing: Text(item.time),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
