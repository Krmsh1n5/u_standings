// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StandingsImpl _$$StandingsImplFromJson(Map<String, dynamic> json) =>
    _$StandingsImpl(
      id: (json['id'] as num).toInt(),
      cohortSemester: json['cohortSemester'] as String,
      rank: (json['rank'] as num).toInt(),
      studentId: json['studentId'] as String,
      average: (json['average'] as num).toDouble(),
      change: (json['change'] as num).toInt(),
    );

Map<String, dynamic> _$$StandingsImplToJson(_$StandingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cohortSemester': instance.cohortSemester,
      'rank': instance.rank,
      'studentId': instance.studentId,
      'average': instance.average,
      'change': instance.change,
    };
