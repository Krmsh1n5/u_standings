// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StandingsModelImpl _$$StandingsModelImplFromJson(Map<String, dynamic> json) =>
    _$StandingsModelImpl(
      id: (json['id'] as num).toInt(),
      cohortSemester: json['cohortSemester'] as String,
      studentId: json['studentId'] as String,
      average: (json['average'] as num).toDouble(),
      change: (json['change'] as num).toInt(),
    );

Map<String, dynamic> _$$StandingsModelImplToJson(
        _$StandingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cohortSemester': instance.cohortSemester,
      'studentId': instance.studentId,
      'average': instance.average,
      'change': instance.change,
    };
