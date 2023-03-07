// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  String get username => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call({String username, String? image, @JsonKey(name: '_id') String id});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? image = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchModelCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$_SearchModelCopyWith(
          _$_SearchModel value, $Res Function(_$_SearchModel) then) =
      __$$_SearchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String? image, @JsonKey(name: '_id') String id});
}

/// @nodoc
class __$$_SearchModelCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$_SearchModel>
    implements _$$_SearchModelCopyWith<$Res> {
  __$$_SearchModelCopyWithImpl(
      _$_SearchModel _value, $Res Function(_$_SearchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? image = freezed,
    Object? id = null,
  }) {
    return _then(_$_SearchModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchModel with DiagnosticableTreeMixin implements _SearchModel {
  const _$_SearchModel(
      {required this.username,
      this.image,
      @JsonKey(name: '_id') required this.id});

  factory _$_SearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchModelFromJson(json);

  @override
  final String username;
  @override
  final String? image;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchModel(username: $username, image: $image, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchModel'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      __$$_SearchModelCopyWithImpl<_$_SearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchModelToJson(
      this,
    );
  }
}

abstract class _SearchModel implements SearchModel {
  const factory _SearchModel(
      {required final String username,
      final String? image,
      @JsonKey(name: '_id') required final String id}) = _$_SearchModel;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$_SearchModel.fromJson;

  @override
  String get username;
  @override
  String? get image;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
