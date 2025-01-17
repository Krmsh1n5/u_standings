import 'package:u_standings/features/standings/domain/entities/exam.dart';

class CohortSemester {
  final String name; // e.g., "L0 S1", "L1 CS S2"
  final List<Exam> exams;

  CohortSemester({required this.name, required this.exams});
}