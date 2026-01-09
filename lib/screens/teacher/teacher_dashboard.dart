import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../theme/custome_drawers.dart';
import '../auth/assignment_screen.dart';
import '../auth/parent_dashboard.dart';
import '../auth/student_attendence_screen.dart';
import '../auth/time_table_screen.dart';

class TeacherDashboard extends StatefulWidget {
  TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // ✅ Add key here
      drawer: TeacherDrawer(),
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // // ✅ Use key to open drawer
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body:_currentIndex==1?AssignmentScreen():  Column(
        children: [
          // Carousel Slider for notices/announcements
          CarouselSlider(
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: imageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(i, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Grid Options
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _DashboardOption(
                    title: "Attendance",
                    icon: Icons.check_circle,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AttendanceCalendarScreen(),
                        ),
                      );
                    },
                  ),
                  _DashboardOption(
                    title: "Time Table",
                    icon: Icons.calendar_month,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TimetableScreen(),
                        ),
                      );
                    },
                  ),
                  _DashboardOption(
                    title: "Exam Results",
                    icon: Icons.bar_chart,
                    ontap: () {},
                  ),
                  _DashboardOption(
                    title: "Student Details",
                    icon: Icons.person,
                    ontap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "Assignments",
          ),
        ],
      ),
    );
  }
}

class _DashboardOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;

  const _DashboardOption({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
