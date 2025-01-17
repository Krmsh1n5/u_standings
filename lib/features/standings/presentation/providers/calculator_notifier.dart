import 'package:flutter/material.dart';
import 'package:u_standings/features/standings/domain/usecases/get_calculated_average.dart';
import 'package:u_standings/features/standings/domain/usecases/get_exams.dart';

class CalculatorProvider extends ChangeNotifier {
  // State variables
  String? selectedCohortSemester = 'L0 S1';
  List<Map<String, String>>? exams;
  double? calculatedAverage;

  // Use Cases
  GetCalculatedAverageUseCase getCalculatedAverage =
      GetCalculatedAverageUseCase();
  GetExamsUseCase getExams = GetExamsUseCase();

  final Map<String, double> grades = {}; // Stores user inputs for grades

  CalculatorProvider() {
    // Fetch initial data
    exams = getExams(selectedCohortSemester) ?? [];
  }

  // Update selected cohort and/or semester
  void updateCohort(String cohortSemester) {
    selectedCohortSemester = cohortSemester;
    exams = getExams(selectedCohortSemester);
    calculatedAverage = null;
    notifyListeners();
  }

  void updateGrade(String title, double grade) {
    grades[title] = grade;
    notifyListeners();
  }

  void calculateAverage() {
    calculatedAverage =
        getCalculatedAverage(grades, selectedCohortSemester ?? 'L0 S1');
    notifyListeners();
  }
}
