import 'package:u_standings/features/standings/domain/entities/standings.dart';

abstract class StandingsRepository {
  Future<List<StandingsEntity>> getStandings(String selectedCohortSemester);
}
