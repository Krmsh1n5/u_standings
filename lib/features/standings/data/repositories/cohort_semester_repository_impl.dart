import 'package:u_standings/features/standings/domain/repositories/cohort_semester_repository.dart';

final List<String> cohortSemesterData = [
  'L0 S1',
  'L0 S2',
  'L1 CS S1',
  'L1 CS S2',
  'L1 CE S1',
  'L1 CE S2',
  'L1 PE S1',
  'L1 PE S2',
  'L1 GE S1',
  'L1 GE S2',
  'L2 CS S1',
  'L2 CS S2',
  'L2 CE S1',
  'L2 CE S2',
  'L2 PE S1',
  'L2 PE S2',
  'L2 GE S1',
  'L2 GE S2',
];

class CohortSemesterRepositoryImpl implements CohortSemesterRepository {
  @override
  Future<List<String>> getAvailableCohortSemesters() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return cohortSemesterData;
  }
}
