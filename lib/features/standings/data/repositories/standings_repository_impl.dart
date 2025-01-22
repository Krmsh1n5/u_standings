import 'package:u_standings/features/standings/data/datasources/api_service.dart';
import 'package:u_standings/features/standings/data/models/standings/standings_model.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/repositories/standings_repository.dart';

class StandingsRepositoryImpl implements StandingsRepository {

  final UStandingsApi api;

  StandingsRepositoryImpl(this.api);

  @override
  Future<List<StandingsEntity>> getStandings(String selectedCohortSemester) async {
    final List<StandingsModel> models = await api.getStandings(selectedCohortSemester);
    return models.map((model) => model.toEntity()).toList();
  }
}
