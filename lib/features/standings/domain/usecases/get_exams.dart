import 'package:u_standings/core/utils/constants/cohorts_semesters_data.dart';

class GetExamsUseCase {
  List<Map<String, String>> call(String? selectedCohortSemester) {
    if (selectedCohortSemester == null) {
      return [];
    }
    final cohortSemesterObject = cohortsSemesters.firstWhere(
        (cohortSemester) => cohortSemester.name == selectedCohortSemester);

    return cohortSemesterObject.exams.map((exam) {
      return {'title': exam.title, 'credits': exam.credits.toString()};
    }).toList();
  }
}
