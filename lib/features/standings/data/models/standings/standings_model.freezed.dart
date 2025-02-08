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

StandingsModel _$StandingsModelFromJson(Map<String, dynamic> json) {
  return _StandingsModel.fromJson(json);
}

/// @nodoc
mixin _$StandingsModel {
  int get id => throw _privateConstructorUsedError;
  String get cohortSemester => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  double get average => throw _privateConstructorUsedError;
  int get change => throw _privateConstructorUsedError;

  /// Serializes this StandingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StandingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StandingsModelCopyWith<StandingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandingsModelCopyWith<$Res> {
  factory $StandingsModelCopyWith(
          StandingsModel value, $Res Function(StandingsModel) then) =
      _$StandingsModelCopyWithImpl<$Res, StandingsModel>;
  @useResult
  $Res call(
      {int id,
      String cohortSemester,
      String studentId,
      double average,
      int change});
}

/// @nodoc
class _$StandingsModelCopyWithImpl<$Res, $Val extends StandingsModel>
    implements $StandingsModelCopyWith<$Res> {
  _$StandingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StandingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohortSemester = null,
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
abstract class _$$StandingsModelImplCopyWith<$Res>
    implements $StandingsModelCopyWith<$Res> {
  factory _$$StandingsModelImplCopyWith(_$StandingsModelImpl value,
          $Res Function(_$StandingsModelImpl) then) =
      __$$StandingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cohortSemester,
      String studentId,
      double average,
      int change});
}

/// @nodoc
class __$$StandingsModelImplCopyWithImpl<$Res>
    extends _$StandingsModelCopyWithImpl<$Res, _$StandingsModelImpl>
    implements _$$StandingsModelImplCopyWith<$Res> {
  __$$StandingsModelImplCopyWithImpl(
      _$StandingsModelImpl _value, $Res Function(_$StandingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StandingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohortSemester = null,
    Object? studentId = null,
    Object? average = null,
    Object? change = null,
  }) {
    return _then(_$StandingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cohortSemester: null == cohortSemester
          ? _value.cohortSemester
          : cohortSemester // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$StandingsModelImpl implements _StandingsModel {
  const _$StandingsModelImpl(
      {required this.id,
      required this.cohortSemester,
      required this.studentId,
      required this.average,
      required this.change});

  factory _$StandingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StandingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final String cohortSemester;
  @override
  final String studentId;
  @override
  final double average;
  @override
  final int change;

  @override
  String toString() {
    return 'StandingsModel(id: $id, cohortSemester: $cohortSemester, studentId: $studentId, average: $average, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StandingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cohortSemester, cohortSemester) ||
                other.cohortSemester == cohortSemester) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, cohortSemester, studentId, average, change);

  /// Create a copy of StandingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StandingsModelImplCopyWith<_$StandingsModelImpl> get copyWith =>
      __$$StandingsModelImplCopyWithImpl<_$StandingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StandingsModelImplToJson(
      this,
    );
  }

  StandingsEntity toEntity() {
    return StandingsEntity(
      id: id,
      cohortSemester: cohortSemester,
      studentId: studentId,
      average: average,
      change: change,
    );
  }
}

abstract class _StandingsModel implements StandingsModel {
  const factory _StandingsModel(
      {required final int id,
      required final String cohortSemester,
      required final String studentId,
      required final double average,
      required final int change}) = _$StandingsModelImpl;

  factory _StandingsModel.fromJson(Map<String, dynamic> json) =
      _$StandingsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get cohortSemester;
  @override
  String get studentId;
  @override
  double get average;
  @override
  int get change;

  /// Create a copy of StandingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StandingsModelImplCopyWith<_$StandingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
