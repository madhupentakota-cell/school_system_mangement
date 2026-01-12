import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagementsystem/models/user_model.dart';
import 'package:schoolmanagementsystem/screens/auth/student_attendence_screen.dart';
import 'package:schoolmanagementsystem/screens/auth/student_details_screen.dart';
import 'package:schoolmanagementsystem/screens/auth/time_table_screen.dart';

import '../../theme/custome_appbar.dart';
import '../../theme/custome_drawers.dart';
import 'assignment_screen.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

final List<String> imageList = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-9zI6lpu3OfVFfM5bvLdyLBS2snpGGSwPRA&s",
  "https://t4.ftcdn.net/jpg/01/42/56/05/360_F_142560595_Dnqf88DfPx6d2BQd4YXTRCZiY3CyRRVU.jpg",
];

class _ParentDashboardState extends State<ParentDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const ParentDrawer(),

      appBar: CustomAppBar(
        title: "Parent Dashboard",
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onProfileTap: () {},
      ),

      body: _currentIndex == 1
          ? AssignmentScreen()
          : SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.82,
                child: Column(
                  children: [
                    // 🔹 Carousel
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: imageList.map((image) {
                        return Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 134, 150, 230),
                                blurRadius: 10,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Image.network(image, fit: BoxFit.cover),
                        );
                      }).toList(),
                    ),

                    ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Text(
                          "Today quote",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Don’t study to pass exams. Study to build a future.",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontFamily: 'italian'),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // 🔹 Dashboard Grid
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.1,
                          children: [
                            _DashboardOption(
                              title: "Exam Results",
                              icon: Icons.bar_chart,
                              ontap: () {
                                Navigator.pushNamed(context, '/result');
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
                              title: "Student Details",
                              icon: Icons.person,
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const StudentDetailsScreen(),
                                  ),
                                );
                              },
                            ),

                            // 🔹 Attendance Card
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          AttendanceCalendarScreen(),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: CircularProgressIndicator(
                                            value: 0.7,
                                            strokeWidth: 8,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                        Text(
                                          "70%",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "Attendance",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
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
