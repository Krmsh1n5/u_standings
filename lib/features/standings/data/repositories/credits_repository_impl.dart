import 'package:u_standings/features/standings/data/datasources/api_service.dart';
import 'package:u_standings/features/standings/domain/repositories/credits_repository.dart';

class GetCreditsRepositoryImpl implements GetCreditsRepository {
  final UStandingsApi api;

  GetCreditsRepositoryImpl(this.api);
  
  @override
  Future<double> getKnownCredits(String selectedCohortSemester) async {
    return api.getKnownCredits(selectedCohortSemester);
  }
}
