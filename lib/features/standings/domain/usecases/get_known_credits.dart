import 'package:u_standings/features/standings/domain/repositories/credits_repository.dart';

class GetKnownCreditsUseCase {
  final GetCreditsRepository repository;

  GetKnownCreditsUseCase(this.repository);

  Future<double> call(String selectedCohortSemester) async {
    return await repository.getKnownCredits(selectedCohortSemester);
  }
}
