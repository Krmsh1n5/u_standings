import 'package:flutter/material.dart';
import 'package:u_standings/features/standings/domain/usecases/get_calculated_average.dart';
import 'package:u_standings/features/standings/domain/usecases/get_exams.dart';
import 'package:u_standings/features/standings/domain/usecases/get_maximum_average.dart';
import 'package:u_standings/features/standings/domain/usecases/get_minimum_average.dart';

class CalculatorProvider extends ChangeNotifier {
  // State variables
  String? selectedCohortSemester = 'L0 S1';
  List<Map<String, String>>? exams;
  double? calculatedAverage;
  double? minimumAverage;
  double? maximumAverage;

  // Use Cases
  GetCalculatedAverageUseCase getCalculatedAverage = GetCalculatedAverageUseCase();
  GetExamsUseCase getExams = GetExamsUseCase();
  GetMinimumAverageUseCase getMinimumAverage = GetMinimumAverageUseCase();
  GetMaximumAverageUseCase getMaximumAverage = GetMaximumAverageUseCase();

  final Map<String, double> _grades = {}; // Stores user inputs for grades
  final Map<String, TextEditingController> _controllers = {};

  CalculatorProvider() {
    // Fetch initial data
    exams = getExams(selectedCohortSemester);
  }

  // Update selected cohort and/or semester
  void updateCohort(String cohortSemester) {
    bool shouldClear = false;
    if (selectedCohortSemester != cohortSemester) {
      shouldClear = true;
    }
    selectedCohortSemester = cohortSemester;
    exams = getExams(selectedCohortSemester);
    _grades.clear();
    _controllers.clear();
    calculatedAverage = null;
    if (shouldClear) {
      clearAllGrades();
    }
  }

  void updateGrade(String title, double grade) {
    _grades[title] = grade;
    notifyListeners();
  }

  TextEditingController getController(String title) {
    if (!_controllers.containsKey(title)) {
      _controllers[title] = TextEditingController();
    }
    return _controllers[title]!;
  }

  void clearAllGrades() {
    _grades.clear();
    _controllers.clear();
    notifyListeners();
  }

  void calculateAverage() {
    calculatedAverage = getCalculatedAverage(_grades, selectedCohortSemester ?? 'L0 S1');
    minimumAverage = getMinimumAverage(_grades, selectedCohortSemester ?? 'L0 S1');
    maximumAverage = getMaximumAverage(_grades, selectedCohortSemester ?? 'L0 S1');
    notifyListeners();
  }
}
