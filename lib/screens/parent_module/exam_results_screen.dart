import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:confetti/confetti.dart';
import 'package:schoolmanagementsystem/screens/parent_module/report_card_screen.dart';
import 'package:schoolmanagementsystem/utils/utils.dart';

class StudentResultScreen extends StatefulWidget {
  const StudentResultScreen({super.key});

  @override
  State<StudentResultScreen> createState() => _StudentResultScreenState();
}

class _StudentResultScreenState extends State<StudentResultScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    // 🎉 Auto play when screen opens (optional)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {"name": "Mathematics", "marks": 85},
      {"name": "Science", "marks": 78},
      {"name": "English", "marks": 75},
      {"name": "Social Studies", "marks": 74},
      {"name": "Computer", "marks": 98},
    ];

    final int totalMarks = subjects.fold(
      0,
      (sum, item) => sum + item["marks"] as int,
    );

    final int maxMarks = subjects.length * 100;
    final double percentage = totalMarks / maxMarks;

    /// Grade logic
    String grade;
    if (subjects.any((e) => e['marks'] < 35)) {
      grade = "F";
    } else if (percentage >= 0.9) {
      grade = "A+";
    } else if (percentage >= 0.8) {
      grade = "A";
    } else if (percentage >= 0.7) {
      grade = "B";
    } else {
      grade = "C";
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Exam Result"), centerTitle: true),
      body: Stack(
        children: [
          /// 📊 Result Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// 🔹 Summary Card
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    /// 🔹 Main Card
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.teal)],
                              ),
                              height: 100,
                              child: Image.network(
                                ImageUrl.person,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Row(
                              children: [
                                /// Circular Score
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 70,
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

                                /// Grade + Score
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Grade"),
                                    Text(
                                      grade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: grade == "F"
                                                ? Colors.red
                                                : Colors.indigo,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text("Total Score"),
                                    Text(
                                      "$totalMarks / $maxMarks",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// 🏅 Badge Image (Top Right)
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Image.asset(
                        grade == "A+" || grade == "A"
                            ? "assets/images/agrade.png"
                            : grade == "B"
                            ? "assets/images/bgrade.png"
                            : "assets/images/agrade.png",
                        width: 50,
                        height: 70,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// 🔹 Subject-wise Marks
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Final Exams ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: 12),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    final int marks = subject["marks"];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: marks >= 35 ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProgressReportScreen()));
                }, child: Text("Prograss report"))
              ],
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
