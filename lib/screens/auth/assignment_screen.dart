import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/service/parent_service.dart';

import '../../models/assignment_model.dart';
import '../../models/user_model.dart';


class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {

  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 220,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: assignmentList.length,
            itemBuilder: (context, index) {
              return AssignmentCard(
                assignment: assignmentList[index],
              );
            },
          ),
        ),

        UserModel.userType == "Parent"
            ? const SizedBox()
            : Container(
          margin: const EdgeInsets.only(right: 8),
          width: 160,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Assignment"),
            onPressed: () async {
              final bool? isSubmitted =
              await showAssignmentForm(context);

              if (isSubmitted == true) {
                _refreshList();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                    Text("Assignment submitted successfully"),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
/* ------------------ Assignment Card ------------------ */

class AssignmentCard extends StatefulWidget {
  final AssignmentModel assignment;

  const AssignmentCard({super.key, required this.assignment});

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.edit_note_sharp,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.assignment.subject,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Due: ${widget.assignment.dueDate}"),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 18),
              const SizedBox(width: 8),
              Text("Teacher: ${widget.assignment.teacher}"),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            widget.assignment.description,
            style: const TextStyle(color: Colors.black87),
          ),

          const SizedBox(height: 16),


        ],
      ),
    );
  }
}


Future<bool?> showAssignmentForm(BuildContext context) async {
  final formKey = GlobalKey<FormState>();

  final subjectController = TextEditingController();
  final teacherController = TextEditingController();
  final descriptionController = TextEditingController();

  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Submit Assignment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: "Subject",
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (v) =>
                v!.isEmpty ? "Subject required" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: teacherController,
                decoration: const InputDecoration(
                  labelText: "Teacher",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) =>
                v!.isEmpty ? "Teacher required" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Assignment Description",
                  prefixIcon: Icon(Icons.description),
                ),
                validator: (v) =>
                v!.isEmpty ? "Description required" : null,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await ParentService().createAssignment(
                        subject: subjectController.text,
                        teacher: teacherController.text,
                        description: descriptionController.text,
                      );

                      Navigator.pop(context, true); // ✅ RETURN SUCCESS
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  return result; // ✅ returns true or null
}

