import '../models/assignment_model.dart';
import '../models/student_details.dart';
import '../models/time_table_model.dart';

final List<AssignmentModel> assignmentList = [
  AssignmentModel(
    subject: "Mathematics",
    teacher: "Mr. Sharma",
    dueDate: "15 Sep 2025",
    description: "Complete exercise 5.1 and 5.2 from the textbook.",
    // false,
  ),
  AssignmentModel(
    subject: "Science",
    teacher: "Ms. Verma",
    dueDate: "12 Sep 2025",
    description: "Prepare a short note on Photosynthesis.",
    // true,
  ),
  AssignmentModel(
    subject: "English",
    teacher: "Mrs. Thomas",
    dueDate: "18 Sep 2025",
    description: "Write an essay on 'My Favorite Teacher'.",
    // false,
  ),
];

class ParentService {
  final Map<String, List<TimetableItem>> weeklyTimetable = {
    "Monday": [
      TimetableItem(subject: "Math", teacher: "Mr. Ali", time: "9:00 - 9:45"),
      TimetableItem(
        subject: "English",
        teacher: "Ms. Sara",
        time: "9:45 - 10:30",
      ),
      TimetableItem(
        subject: "Physics",
        teacher: "Mr. John",
        time: "10:45 - 11:30",
      ),
      TimetableItem(
        subject: "Computer",
        teacher: "Ms. Amina",
        time: "11:30 - 12:15",
      ),
      TimetableItem(
        subject: "Biology",
        teacher: "Mr. Hassan",
        time: "12:15 - 1:00",
      ),
    ],
    "Tuesday": [
      TimetableItem(
        subject: "Chemistry",
        teacher: "Ms. Ayesha",
        time: "9:00 - 9:45",
      ),
      TimetableItem(subject: "Math", teacher: "Mr. Ali", time: "9:45 - 10:30"),
      TimetableItem(
        subject: "English",
        teacher: "Ms. Sara",
        time: "10:45 - 11:30",
      ),
      TimetableItem(
        subject: "Physics",
        teacher: "Mr. John",
        time: "11:30 - 12:15",
      ),
      TimetableItem(
        subject: "Sports",
        teacher: "Coach Imran",
        time: "12:15 - 1:00",
      ),
    ],
    "Wednesday": [
      TimetableItem(
        subject: "Biology",
        teacher: "Mr. Hassan",
        time: "9:00 - 9:45",
      ),
      TimetableItem(subject: "Math", teacher: "Mr. Ali", time: "9:45 - 10:30"),
      TimetableItem(
        subject: "Chemistry",
        teacher: "Ms. Ayesha",
        time: "10:45 - 11:30",
      ),
      TimetableItem(
        subject: "English",
        teacher: "Ms. Sara",
        time: "11:30 - 12:15",
      ),
      TimetableItem(
        subject: "Computer",
        teacher: "Ms. Amina",
        time: "12:15 - 1:00",
      ),
    ],
    "Thursday": [
      TimetableItem(
        subject: "Physics",
        teacher: "Mr. John",
        time: "9:00 - 9:45",
      ),
      TimetableItem(subject: "Math", teacher: "Mr. Ali", time: "9:45 - 10:30"),
      TimetableItem(
        subject: "Biology",
        teacher: "Mr. Hassan",
        time: "10:45 - 11:30",
      ),
      TimetableItem(
        subject: "Chemistry",
        teacher: "Ms. Ayesha",
        time: "11:30 - 12:15",
      ),
      TimetableItem(subject: "Art", teacher: "Ms. Nida", time: "12:15 - 1:00"),
    ],
    "Friday": [
      TimetableItem(
        subject: "English",
        teacher: "Ms. Sara",
        time: "9:00 - 9:45",
      ),
      TimetableItem(subject: "Math", teacher: "Mr. Ali", time: "9:45 - 10:30"),
      TimetableItem(
        subject: "Computer",
        teacher: "Ms. Amina",
        time: "10:45 - 11:30",
      ),
      TimetableItem(
        subject: "Physics",
        teacher: "Mr. John",
        time: "11:30 - 12:15",
      ),
      TimetableItem(
        subject: "Social",
        teacher: "Mr. Kamran",
        time: "12:15 - 1:00",
      ),
    ],
  };

  final student = StudentDetails(
    name: "Ali Khan",
    className: "10",
    section: "A",
    rollNo: "23",
    admissionNo: "ADM-2021-045",
    parentName: "Mr. Ahmed Khan",
    parentPhone: "+92 300 1234567",
    bloodGroup: "O+",
    session: "2025 - 2026",
  );

  /* ------------------ Dummy Data ------------------ */

  Future createAssignment({
    required String subject,
    required String teacher,
    required String description,
  }) async {
    DateTime now = DateTime.now();
    String formattedDateA =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    assignmentList.add(
      AssignmentModel(
        subject: subject,
        teacher: teacher,
        dueDate: formattedDateA,
        description: description,
      ),
    );
  }
}
