import 'package:u_standings/core/utils/constants/cohorts_semesters_data.dart';

class GetTotalCohortSemesterCreditsUseCase {
  double call(String selectedCohortSemester) {
    var totalCredits = 0.0;
    final exams = cohortsSemesters
        .firstWhere((element) => element.name == selectedCohortSemester)
        .exams;

    for (var exam in exams) {
      totalCredits += exam.credits;
    }

    totalCredits = double.parse(totalCredits.toStringAsFixed(3));

    return totalCredits;
  }
}
