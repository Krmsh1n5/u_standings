import 'package:flutter/material.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_cohort_semester.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_credits.dart';
import 'package:u_standings/features/standings/domain/usecases/get_standings.dart';
import 'package:u_standings/features/standings/domain/usecases/get_total_cohort_semester_credits.dart';

class StandingsNotifier extends ChangeNotifier {
  // State variables
  String? selectedCohortSemester;
  double? knownCredits;
  double? totalCohortSemesterCredits;
  List<Standings> standings = [];
  List<String> cohortSemesters = [];

  // Use Cases
  final GetStandingsUseCase getStandingsUseCase;
  final GetKnownCohortSemesterUseCase getKnownCohortSemesterUseCase;
  final GetKnownCreditsUseCase getKnownCreditsUseCase;
  final GetTotalCohortSemesterCreditsUseCase
      getTotalCohortSemesterCreditsUseCase;

  StandingsNotifier({
    required this.getStandingsUseCase,
    required this.getKnownCohortSemesterUseCase,
    required this.getKnownCreditsUseCase,
    required this.getTotalCohortSemesterCreditsUseCase,
  });

  Future<void> loadAvailableCohortsSemesters() async {
    try {
      cohortSemesters = await getKnownCohortSemesterUseCase();
      if (cohortSemesters.isNotEmpty) {
        selectedCohortSemester = cohortSemesters.first;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading available cohorts/semesters: $e');
    }
  }

  Future<void> loadCredits() async {
    try {
      knownCredits = await getKnownCreditsUseCase(selectedCohortSemester!);
      totalCohortSemesterCredits =
          await getTotalCohortSemesterCreditsUseCase(selectedCohortSemester!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error in loadCredits for $selectedCohortSemester: $e');
    }
  }

  Future<void> loadStandings() async {
    try {
      standings = await getStandingsUseCase(selectedCohortSemester!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error in loadStandings for $selectedCohortSemester: $e');
    }
  }

  Future<void> updateCohort(String cohortSemester) async {
    if (selectedCohortSemester != cohortSemester) {
      selectedCohortSemester = cohortSemester;
      notifyListeners();
      await loadCredits();
      await loadStandings();
    }
  }
}
