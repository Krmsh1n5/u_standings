abstract class GetCreditsRepository {
  Future<double> getKnownCredits(String selectedCohortSemester);
  Future<double> getTotalCohortSemesterCredits(String selectedCohortSemester);
}