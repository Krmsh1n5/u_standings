// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StandingsModel _$StandingsFromJson(Map<String, dynamic> json) {
  return _Standings.fromJson(json);
}

/// @nodoc
mixin _$Standings {
  int get id => throw _privateConstructorUsedError;
  String get cohortSemester => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  double get average => throw _privateConstructorUsedError;
  int get change => throw _privateConstructorUsedError;

  /// Serializes this Standings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Standings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StandingsCopyWith<StandingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandingsCopyWith<$Res> {
  factory $StandingsCopyWith(StandingsModel value, $Res Function(StandingsModel) then) =
      _$StandingsCopyWithImpl<$Res, StandingsModel>;
  @useResult
  $Res call(
      {int id,
      String cohortSemester,
      int rank,
      String studentId,
      double average,
      int change});
}

/// @nodoc
class _$StandingsCopyWithImpl<$Res, $Val extends StandingsModel>
    implements $StandingsCopyWith<$Res> {
  _$StandingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Standings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohortSemester = null,
    Object? rank = null,
    Object? studentId = null,
    Object? average = null,
    Object? change = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cohortSemester: null == cohortSemester
          ? _value.cohortSemester
          : cohortSemester // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StandingsImplCopyWith<$Res>
    implements $StandingsCopyWith<$Res> {
  factory _$$StandingsImplCopyWith(
          _$StandingsImpl value, $Res Function(_$StandingsImpl) then) =
      __$$StandingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cohortSemester,
      int rank,
      String studentId,
      double average,
      int change});
}

/// @nodoc
class __$$StandingsImplCopyWithImpl<$Res>
    extends _$StandingsCopyWithImpl<$Res, _$StandingsImpl>
    implements _$$StandingsImplCopyWith<$Res> {
  __$$StandingsImplCopyWithImpl(
      _$StandingsImpl _value, $Res Function(_$StandingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Standings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohortSemester = null,
    Object? rank = null,
    Object? studentId = null,
    Object? average = null,
    Object? change = null,
  }) {
    return _then(_$StandingsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cohortSemester: null == cohortSemester
          ? _value.cohortSemester
          : cohortSemester // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StandingsImpl implements _Standings {
  const _$StandingsImpl(
      {required this.id,
      required this.cohortSemester,
      required this.rank,
      required this.studentId,
      required this.average,
      required this.change});

  factory _$StandingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StandingsImplFromJson(json);

  @override
  final int id;
  @override
  final String cohortSemester;
  @override
  final int rank;
  @override
  final String studentId;
  @override
  final double average;
  @override
  final int change;

  @override
  String toString() {
    return 'Standings(id: $id, cohortSemester: $cohortSemester, rank: $rank, studentId: $studentId, average: $average, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StandingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cohortSemester, cohortSemester) ||
                other.cohortSemester == cohortSemester) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, cohortSemester, rank, studentId, average, change);

  /// Create a copy of Standings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StandingsImplCopyWith<_$StandingsImpl> get copyWith =>
      __$$StandingsImplCopyWithImpl<_$StandingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StandingsImplToJson(
      this,
    );
  }

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
}

abstract class _Standings implements StandingsModel {
  const factory _Standings(
      {required final int id,
      required final String cohortSemester,
      required final int rank,
      required final String studentId,
      required final double average,
      required final int change}) = _$StandingsImpl;

  factory _Standings.fromJson(Map<String, dynamic> json) =
      _$StandingsImpl.fromJson;

  @override
  int get id;
  @override
  String get cohortSemester;
  @override
  int get rank;
  @override
  String get studentId;
  @override
  double get average;
  @override
  int get change;

  /// Create a copy of Standings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StandingsImplCopyWith<_$StandingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
