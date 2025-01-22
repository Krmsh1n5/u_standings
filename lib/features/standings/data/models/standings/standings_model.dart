import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';

part 'standings_model.freezed.dart';
part 'standings_model.g.dart';

@freezed
class StandingsModel with _$Standings {
  const factory StandingsModel({
    required int id,
    required String cohortSemester,
    required int rank,
    required String studentId,
    required double average,
    required int change,
  }) = _Standings;

  StandingsEntity toEntity() {
    return StandingsEntity(
      id: id,
      cohortSemester: cohortSemester,
      rank: rank,
      studentId: studentId,
      average: average,
      change: change,
    );
  }

  factory StandingsModel.fromJson(Map<String, dynamic> json) => _$StandingsFromJson(json);
}