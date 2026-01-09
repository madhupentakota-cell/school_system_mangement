import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/service/parent_service.dart';

import '../../models/student_details.dart';

class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentDetails student = ParentService().student;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // LEFT: Profile Image
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 45),
                    ),

                    const SizedBox(width: 16),

                    // RIGHT: Student Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Class ${student.className} - ${student.section}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Roll No: ${student.rollNo}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Information Section
            _InfoTile("Roll No", student.rollNo),
            _InfoTile("Admission No", student.admissionNo),
            _InfoTile("Session", student.session),
            _InfoTile("Blood Group", student.bloodGroup),

            const SizedBox(height: 16),

            // Parent Info
            Container(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.family_restroom),
                    title: Text("Parent Information"),
                  ),
                  const Divider(height: 1),
                  _InfoTile("Parent Name", student.parentName),
                  _InfoTile("Contact", student.parentPhone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const _InfoTile(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
