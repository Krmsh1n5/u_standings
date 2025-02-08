class StandingsEntity {
  final int id;
  final String cohortSemester;
  final String studentId;
  final double average;
  final int change;

  StandingsEntity({
    required this.id,
    required this.cohortSemester,
    required this.studentId,
    required this.average,
    required this.change,
  });
}
