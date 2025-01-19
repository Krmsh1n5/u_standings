import 'package:u_standings/features/standings/domain/repositories/cohort_semester_repository.dart';

class GetKnownCohortSemesterUseCase {
  final CohortSemesterRepository repository;

  GetKnownCohortSemesterUseCase(this.repository);

  Future<List<String>> call() async {
    return await repository.getAvailableCohortSemesters();
  }
}
