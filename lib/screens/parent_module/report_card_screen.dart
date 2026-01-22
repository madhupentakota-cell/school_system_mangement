import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/theme/text_styles.dart';

class ProgressReportScreen extends StatelessWidget {
  const ProgressReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exams = [
      {
        "exam": "Unit Test 1",
        "grade": "A",
        "rank": 6,
        "subjects": [
          {"name": "Maths", "marks": 82},
          {"name": "Science", "marks": 76},
          {"name": "English", "marks": 70},
        ],
      },
      {
        "exam": "Mid Term Exam",
        "grade": "A+",
        "rank": 3,
        "subjects": [
          {"name": "Maths", "marks": 90},
          {"name": "Science", "marks": 85},
          {"name": "English", "marks": 78},
          {"name": "Computer", "marks": 88},
        ],
      },
      {
        "exam": "Final Exam",
        "grade": "A",
        "rank": 4,
        "subjects": [
          {"name": "Maths", "marks": 86},
          {"name": "Science", "marks": 80},
          {"name": "English", "marks": 75},
          {"name": "Social", "marks": 72},
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Report"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          OverallScoreCard(totalMarks: 400, maxMarks: 500, grade: "A"),
          SizedBox(
            height: MediaQuery.of(context).size.height-300,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.vertical,
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final subjects = exam["subjects"] as List;

                final int total = subjects.fold(
                  0,
                      (sum, e) => sum + (e["marks"] as int),
                );

                final int maxMarks = subjects.length * 100;
                final double percentage = total / maxMarks;

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      exam["exam"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Grade: ${exam["grade"]} | Rank: ${exam["rank"]}",
                    ),
                    childrenPadding: const EdgeInsets.all(16),
                    children: [
                      /// 🔹 Summary
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _ExamInfo(label: "Total", value: "$total/$maxMarks"),
                          _ExamInfo(
                            label: "Percent",
                            value: "${(percentage * 100).toInt()}%",
                          ),
                          _ExamInfo(
                            label: "Grade",
                            value: exam["grade"],
                            color: Colors.indigo,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// 🔹 Subject-wise
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: subjects.length,
                        itemBuilder: (context, i) {
                          final subject = subjects[i];
                          final int marks = subject["marks"];

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: marks >= 80
                                  ? Colors.green
                                  : marks >= 60
                                  ? Colors.orange
                                  : Colors.red,
                              child: Text(
                                marks.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(subject["name"]),
                            trailing: Text(
                              marks >= 35 ? "Pass" : "Fail",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                marks >= 35 ? Colors.green : Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Exam Info Widget
class _ExamInfo extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _ExamInfo({
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: color ?? Colors.black),
        ),
      ],
    );
  }
}


class OverallScoreCard extends StatelessWidget {
  final int totalMarks;
  final int maxMarks;
  final String grade;

  const OverallScoreCard({
    super.key,
    required this.totalMarks,
    required this.maxMarks,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = totalMarks / maxMarks;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            /// 🔵 Overall Percentage
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 8,
                  ),
                ),
                Text(
                  "${(percentage * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            /// 📊 Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Overall Grade"),
                Text(
                  grade,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: grade == "F"
                        ? Colors.red
                        : Colors.indigo,
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Total Score"),
                Text(
                  "$totalMarks / $maxMarks",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/agrade.png')),
              Text("Pass",style: TextStylesCustome().passTextStyle,)
            ],)
          ],
        ),
      ),
    );
  }
}
