// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
mixin _$HomeModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  AuthorModel get author => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get totalLikes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res, HomeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      String image,
      List<String> likes,
      AuthorModel author,
      bool isLiked,
      int totalLikes});

  $AuthorModelCopyWith<$Res> get author;
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? image = null,
    Object? likes = null,
    Object? author = null,
    Object? isLiked = null,
    Object? totalLikes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorModel,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorModelCopyWith<$Res> get author {
    return $AuthorModelCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      String image,
      List<String> likes,
      AuthorModel author,
      bool isLiked,
      int totalLikes});

  @override
  $AuthorModelCopyWith<$Res> get author;
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res>
    extends _$HomeModelCopyWithImpl<$Res, _$_HomeModel>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? image = null,
    Object? likes = null,
    Object? author = null,
    Object? isLiked = null,
    Object? totalLikes = null,
  }) {
    return _then(_$_HomeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorModel,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeModel with DiagnosticableTreeMixin implements _HomeModel {
  const _$_HomeModel(
      {@JsonKey(name: '_id') required this.id,
      required this.caption,
      required this.image,
      required final List<String> likes,
      required this.author,
      required this.isLiked,
      required this.totalLikes})
      : _likes = likes;

  factory _$_HomeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String caption;
  @override
  final String image;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  final AuthorModel author;
  @override
  final bool isLiked;
  @override
  final int totalLikes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeModel(id: $id, caption: $caption, image: $image, likes: $likes, author: $author, isLiked: $isLiked, totalLikes: $totalLikes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('caption', caption))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('isLiked', isLiked))
      ..add(DiagnosticsProperty('totalLikes', totalLikes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, caption, image,
      const DeepCollectionEquality().hash(_likes), author, isLiked, totalLikes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeModelToJson(
      this,
    );
  }
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {@JsonKey(name: '_id') required final String id,
      required final String caption,
      required final String image,
      required final List<String> likes,
      required final AuthorModel author,
      required final bool isLiked,
      required final int totalLikes}) = _$_HomeModel;

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$_HomeModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get caption;
  @override
  String get image;
  @override
  List<String> get likes;
  @override
  AuthorModel get author;
  @override
  bool get isLiked;
  @override
  int get totalLikes;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) {
  return _AuthorModel.fromJson(json);
}

/// @nodoc
mixin _$AuthorModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorModelCopyWith<AuthorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorModelCopyWith<$Res> {
  factory $AuthorModelCopyWith(
          AuthorModel value, $Res Function(AuthorModel) then) =
      _$AuthorModelCopyWithImpl<$Res, AuthorModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String username, String image});
}

/// @nodoc
class _$AuthorModelCopyWithImpl<$Res, $Val extends AuthorModel>
    implements $AuthorModelCopyWith<$Res> {
  _$AuthorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorModelCopyWith<$Res>
    implements $AuthorModelCopyWith<$Res> {
  factory _$$_AuthorModelCopyWith(
          _$_AuthorModel value, $Res Function(_$_AuthorModel) then) =
      __$$_AuthorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String username, String image});
}

/// @nodoc
class __$$_AuthorModelCopyWithImpl<$Res>
    extends _$AuthorModelCopyWithImpl<$Res, _$_AuthorModel>
    implements _$$_AuthorModelCopyWith<$Res> {
  __$$_AuthorModelCopyWithImpl(
      _$_AuthorModel _value, $Res Function(_$_AuthorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? image = null,
  }) {
    return _then(_$_AuthorModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorModel with DiagnosticableTreeMixin implements _AuthorModel {
  const _$_AuthorModel(
      {@JsonKey(name: '_id') required this.id,
      required this.username,
      required this.image});

  factory _$_AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String username;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorModel(id: $id, username: $username, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorModelCopyWith<_$_AuthorModel> get copyWith =>
      __$$_AuthorModelCopyWithImpl<_$_AuthorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorModelToJson(
      this,
    );
  }
}

abstract class _AuthorModel implements AuthorModel {
  const factory _AuthorModel(
      {@JsonKey(name: '_id') required final String id,
      required final String username,
      required final String image}) = _$_AuthorModel;

  factory _AuthorModel.fromJson(Map<String, dynamic> json) =
      _$_AuthorModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get username;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorModelCopyWith<_$_AuthorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
