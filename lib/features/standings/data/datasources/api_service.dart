import 'package:u_standings/features/standings/data/models/standings/standings_model.dart';

final List<StandingsModel> leaderboardData = [
  StandingsModel(id: 1, cohortSemester: 'L1 CS S1', rank: 1, studentId: '22322111', average: 17.9, change: 2),
  StandingsModel(id: 2, cohortSemester: 'L1 CS S1', rank: 2, studentId: '22322222', average: 17.8, change: -1),
  StandingsModel(id: 3, cohortSemester: 'L1 CS S1', rank: 3, studentId: '22322555', average: 17.6, change: 1),
  StandingsModel(id: 4, cohortSemester: 'L1 CS S1', rank: 4, studentId: '22322333', average: 17.58, change: 0),
  StandingsModel(id: 5, cohortSemester: 'L1 CS S1', rank: 5, studentId: '22322444', average: 17.5, change: 0),
  StandingsModel(id: 6, cohortSemester: 'L1 CS S1', rank: 6, studentId: '22322666', average: 17.4, change: 0),
  StandingsModel(id: 7, cohortSemester: 'L1 CS S1', rank: 7, studentId: '22322574', average: 17.3, change: 0),
  StandingsModel(id: 8, cohortSemester: 'L1 CS S1', rank: 8, studentId: '22322628', average: 17.2, change: 0),
  StandingsModel(id: 9, cohortSemester: 'L1 CS S1', rank: 9, studentId: '22322592', average: 17.15, change: 0),
  StandingsModel(id: 10, cohortSemester: 'L1 CS S1', rank: 10, studentId: '22322000', average: 17.1, change: 0),
  StandingsModel(id: 11, cohortSemester: 'L1 CS S1', rank: 11, studentId: '22322579', average: 17.0, change: 0),
  StandingsModel(id: 12, cohortSemester: 'L1 CS S1', rank: 12, studentId: '22322888', average: 16.9, change: 0),
];

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

class UStandingsApi {
  Future<List<StandingsModel>> getStandings(String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return leaderboardData;
  }

  Future<List<String>> getAvailableCohortSemesters() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return cohortSemesterData;
  }

  Future<double> getKnownCredits(String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return Future.value(23.7);
  }

  Future<double> getTotalCohortSemesterCredits(String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return Future.value(30.0);
  }
}