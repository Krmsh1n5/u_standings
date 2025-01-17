import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  // State variables
  String? selectedCohortSemester;
  double? calculatedAverage;

  // Cohort/Semester options
  final List<String> cohortsSemesters = [
    'L0 S1',
    'L0 S2',
    'L1 CS S1',
    'L1 CS S2',
    'L1 CE S1',
    'L1 CE S2',
    'L2',
    'L3',
    'L4',
  ];

  // Example mapping of cohort/semester to exam data
  final Map<String, List<Map<String, String>>> examData = {
    'L1 CS S1': [
      {'title': 'DSA 1 Written Exam', 'credits': '2.75'},
      {'title': 'DSA 1 Final Project and PWs', 'credits': '2.75'},
      {'title': 'Frontend Written Exam', 'credits': '1.3'},
    ],
    'L1 CE S1': [
      {'title': 'TOM 1 Midterm', 'credits': '1.5'},
      {'title': 'TOM 1 Final', 'credits': '2'},
    ],
    // Add other cohorts/semesters here
  };

  final Map<String, double> grades = {}; // Stores user inputs for grades

  // Fetch exams for the selected cohort/semester
  List<Map<String, String>> get currentExams {
    return examData[selectedCohortSemester] ?? [];
  }

  // Update selected cohort and/or semester
  void updateCohort(String cohortSemester) {
    selectedCohortSemester = cohortSemester;
    calculatedAverage = null;
    notifyListeners();
  }

  void updateGrade(String title, double grade) {
    grades[title] = grade;
    notifyListeners();
  }

  void calculateAverage() {
    if (grades.isNotEmpty) {
      double totalCredits = 0;
      double weightedSum = 0;

      for (var exam in currentExams) {
        final title = exam['title']!;
        final credits = double.parse(exam['credits']!);

        if (grades.containsKey(title)) {
          weightedSum += grades[title]! * credits;
          totalCredits += credits;
        }
      }

      calculatedAverage = totalCredits > 0 ? weightedSum / totalCredits : 0;
    } else {
      calculatedAverage = 0;
    }
    notifyListeners();
  }
}
