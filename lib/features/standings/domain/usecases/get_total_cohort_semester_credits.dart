import 'package:u_standings/features/standings/domain/repositories/credits_repository.dart';

class GetTotalCohortSemesterCreditsUseCase {
  final GetCreditsRepository repository;

  GetTotalCohortSemesterCreditsUseCase(this.repository);

  Future<double> call(String selectedCohortSemester) async {
    return await repository
        .getTotalCohortSemesterCredits(selectedCohortSemester);
  }
}
