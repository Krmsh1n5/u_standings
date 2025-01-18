import 'package:u_standings/core/utils/constants/cohorts_semesters_data.dart';
import 'package:u_standings/features/standings/domain/entities/exam.dart';

class GetMinimumAverageUseCase {
  double call(Map<String, double> grades, String selectedCohortSemester) {
    if (grades.isNotEmpty) {
      double totalCredits = 0;
      double weightedSum = 0;
      List<Exam> exams = cohortsSemesters
          .firstWhere(
              (cohortSemester) => cohortSemester.name == selectedCohortSemester)
          .exams;

      for (var examName in grades.keys) {
        final grade = grades[examName]!;
        final credits =
            exams.firstWhere((exam) => exam.title == examName).credits;

        weightedSum += grade * credits;
      }

      for (var exam in exams) {
        totalCredits += exam.credits;
      }

      return double.parse((weightedSum / totalCredits).toStringAsFixed(3));
    } else {
      return 0;
    }
  }
}
