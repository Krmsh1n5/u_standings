import 'package:u_standings/features/standings/domain/entities/standings.dart';

abstract class StandingsRepository {
  Future<List<Standings>> getStandings(String selectedCohortSemester);
}
