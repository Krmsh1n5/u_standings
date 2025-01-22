import 'package:u_standings/features/standings/data/datasources/api_service.dart';
import 'package:u_standings/features/standings/domain/repositories/cohort_semester_repository.dart';

class CohortSemesterRepositoryImpl implements CohortSemesterRepository {
  final UStandingsApi api;

  CohortSemesterRepositoryImpl(this.api);

  @override
  Future<List<String>> getAvailableCohortSemesters() async {
    return api.getAvailableCohortSemesters();
  }
}
