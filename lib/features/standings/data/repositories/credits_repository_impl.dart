import 'package:u_standings/features/standings/domain/repositories/credits_repository.dart';

class GetCreditsRepositoryImpl implements GetCreditsRepository {
  @override
  Future<double> getKnownCredits(String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return 19.5;
  }

  @override
  Future<double> getTotalCohortSemesterCredits(
      String selectedCohortSemester) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));
    return 30;
  }
}
