import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/repositories/standings_repository.dart';

class GetStandingsUseCase {
  final StandingsRepository repository;

  GetStandingsUseCase(this.repository);

  Future<List<StandingsEntity>> call(String selectedCohortSemester) async {
    return await repository.getStandings(selectedCohortSemester);
  }
}
