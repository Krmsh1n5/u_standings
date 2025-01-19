import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/repositories/standings_repository.dart';

final List<Standings> leaderboardData = [
  Standings(rank: 1, studentId: '22322111', average: 17.9, change: 2),
  Standings(rank: 2, studentId: '22322222', average: 17.8, change: -1),
  Standings(rank: 3, studentId: '22322555', average: 17.6, change: 1),
  Standings(rank: 4, studentId: '22322333', average: 17.58, change: 0),
  Standings(rank: 5, studentId: '22322444', average: 17.5, change: 0),
  Standings(rank: 6, studentId: '22322666', average: 17.4, change: 0),
  Standings(rank: 7, studentId: '22322574', average: 17.3, change: 0),
  Standings(rank: 8, studentId: '22322628', average: 17.2, change: 0),
  Standings(rank: 9, studentId: '22322592', average: 17.15, change: 0),
  Standings(rank: 10, studentId: '22322000', average: 17.1, change: 0),
  Standings(rank: 11, studentId: '22322579', average: 17.0, change: 0),
  Standings(rank: 12, studentId: '22322888', average: 16.9, change: 0),
];

class StandingsRepositoryImpl implements StandingsRepository {
  @override
  Future<List<Standings>> getStandings(String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return leaderboardData;
  }
}
