import 'package:u_standings/features/standings/data/datasources/api_service.dart';
import 'package:u_standings/features/standings/data/models/standings/standings_model.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/repositories/standings_repository.dart';

final List<StandingsEntity> leaderboardData = [
  StandingsEntity(id: 1, cohortSemester: 'L1 CS S1', rank: 1, studentId: '22322111', average: 17.9, change: 2),
  StandingsEntity(id: 2, cohortSemester: 'L1 CS S1', rank: 2, studentId: '22322222', average: 17.8, change: -1),
  StandingsEntity(id: 3, cohortSemester: 'L1 CS S1', rank: 3, studentId: '22322555', average: 17.6, change: 1),
  StandingsEntity(id: 4, cohortSemester: 'L1 CS S1', rank: 4, studentId: '22322333', average: 17.58, change: 0),
  StandingsEntity(id: 5, cohortSemester: 'L1 CS S1', rank: 5, studentId: '22322444', average: 17.5, change: 0),
  StandingsEntity(id: 6, cohortSemester: 'L1 CS S1', rank: 6, studentId: '22322666', average: 17.4, change: 0),
  StandingsEntity(id: 7, cohortSemester: 'L1 CS S1', rank: 7, studentId: '22322574', average: 17.3, change: 0),
  StandingsEntity(id: 8, cohortSemester: 'L1 CS S1', rank: 8, studentId: '22322628', average: 17.2, change: 0),
  StandingsEntity(id: 9, cohortSemester: 'L1 CS S1', rank: 9, studentId: '22322592', average: 17.15, change: 0),
  StandingsEntity(id: 10, cohortSemester: 'L1 CS S1', rank: 10, studentId: '22322000', average: 17.1, change: 0),
  StandingsEntity(id: 11, cohortSemester: 'L1 CS S1', rank: 11, studentId: '22322579', average: 17.0, change: 0),
  StandingsEntity(id: 12, cohortSemester: 'L1 CS S1', rank: 12, studentId: '22322888', average: 16.9, change: 0),
];

class StandingsRepositoryImpl implements StandingsRepository {

  final UStandingsApi api;

  StandingsRepositoryImpl(this.api);

  @override
  Future<List<StandingsEntity>> getStandings(String selectedCohortSemester) async {
    final List<StandingsModel> models = await api.getStandings(selectedCohortSemester);
    return models.map((model) => model.toEntity()).toList();
  }
}
