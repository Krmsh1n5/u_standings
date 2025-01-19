import 'package:flutter/material.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_cohort_semester.dart';
import 'package:u_standings/features/standings/domain/usecases/get_known_credits.dart';
import 'package:u_standings/features/standings/domain/usecases/get_standings.dart';
import 'package:u_standings/features/standings/domain/usecases/get_total_cohort_semester_credits.dart';

class StandingsNotifier extends ChangeNotifier {
  // State variables
  String? selectedCohortSemester = 'L0 S1';
  double? knownCredits;
  double? totalCohortSemesterCredits;
  List<Standings>? standings;

  // Use Cases
  final GetStandingsUseCase getStandingsUseCase;
  final GetKnownCohortSemesterUseCase getKnownCohortSemesterUseCase;
  final GetKnownCreditsUseCase getKnownCreditsUseCase;
  final GetTotalCohortSemesterCreditsUseCase getTotalCohortSemesterCreditsUseCase;

  StandingsNotifier({
    required this.getStandingsUseCase,
    required this.getKnownCohortSemesterUseCase,
    required this.getKnownCreditsUseCase,
    required this.getTotalCohortSemesterCreditsUseCase,
  });

  
}
