import 'package:u_standings/core/utils/constants/cohorts_semesters_data.dart';
import 'package:u_standings/features/standings/domain/entities/exam.dart';

class GetMaximumAverageUseCase {
  double call(Map<String, double> grades, String selectedCohortSemester) {
    if (grades.isNotEmpty) {
      double totalCredits = 0;
      double totalKnownCredits = 0;
      double weightedSum = 0;
      List<Exam> exams = cohortsSemesters
          .firstWhere(
              (cohortSemester) => cohortSemester.name == selectedCohortSemester)
          .exams;

      for (var examName in grades.keys) {
        final grade = grades[examName]!;
        final credits =
            exams.firstWhere((exam) => exam.title == examName).credits;
        totalKnownCredits += credits;

        weightedSum += grade * credits;
      }

      for (var exam in exams) {
        totalCredits += exam.credits;
      }

      weightedSum += (totalCredits - totalKnownCredits) * 20;

      return double.parse((weightedSum / totalCredits).toStringAsFixed(3));
    } else {
      return 20;
    }
  }
}
