// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profileModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyProfile _$MyProfileFromJson(Map<String, dynamic> json) {
  return _MyProfile.fromJson(json);
}

/// @nodoc
mixin _$MyProfile {
  ProfileModel get profile => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProfileCopyWith<MyProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProfileCopyWith<$Res> {
  factory $MyProfileCopyWith(MyProfile value, $Res Function(MyProfile) then) =
      _$MyProfileCopyWithImpl<$Res, MyProfile>;
  @useResult
  $Res call({ProfileModel profile, String? status});

  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$MyProfileCopyWithImpl<$Res, $Val extends MyProfile>
    implements $MyProfileCopyWith<$Res> {
  _$MyProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profile {
    return $ProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyProfileCopyWith<$Res> implements $MyProfileCopyWith<$Res> {
  factory _$$_MyProfileCopyWith(
          _$_MyProfile value, $Res Function(_$_MyProfile) then) =
      __$$_MyProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileModel profile, String? status});

  @override
  $ProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_MyProfileCopyWithImpl<$Res>
    extends _$MyProfileCopyWithImpl<$Res, _$_MyProfile>
    implements _$$_MyProfileCopyWith<$Res> {
  __$$_MyProfileCopyWithImpl(
      _$_MyProfile _value, $Res Function(_$_MyProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? status = freezed,
  }) {
    return _then(_$_MyProfile(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyProfile with DiagnosticableTreeMixin implements _MyProfile {
  const _$_MyProfile({required this.profile, this.status});

  factory _$_MyProfile.fromJson(Map<String, dynamic> json) =>
      _$$_MyProfileFromJson(json);

  @override
  final ProfileModel profile;
  @override
  final String? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyProfile(profile: $profile, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyProfile'))
      ..add(DiagnosticsProperty('profile', profile))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyProfile &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profile, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyProfileCopyWith<_$_MyProfile> get copyWith =>
      __$$_MyProfileCopyWithImpl<_$_MyProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyProfileToJson(
      this,
    );
  }
}

abstract class _MyProfile implements MyProfile {
  const factory _MyProfile(
      {required final ProfileModel profile,
      final String? status}) = _$_MyProfile;

  factory _MyProfile.fromJson(Map<String, dynamic> json) =
      _$_MyProfile.fromJson;

  @override
  ProfileModel get profile;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_MyProfileCopyWith<_$_MyProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  List<String>? get following => throw _privateConstructorUsedError;
  List<String>? get follower => throw _privateConstructorUsedError;
  List<String>? get likedPosts => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  List<PostsModel> get myPosts => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {List<String>? following,
      List<String>? follower,
      List<String>? likedPosts,
      String? image,
      @JsonKey(name: '_id') String id,
      String username,
      String email,
      List<PostsModel> myPosts,
      String? status});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = freezed,
    Object? follower = freezed,
    Object? likedPosts = freezed,
    Object? image = freezed,
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? myPosts = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likedPosts: freezed == likedPosts
          ? _value.likedPosts
          : likedPosts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      myPosts: null == myPosts
          ? _value.myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<PostsModel>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? following,
      List<String>? follower,
      List<String>? likedPosts,
      String? image,
      @JsonKey(name: '_id') String id,
      String username,
      String email,
      List<PostsModel> myPosts,
      String? status});
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$_ProfileModel>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = freezed,
    Object? follower = freezed,
    Object? likedPosts = freezed,
    Object? image = freezed,
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? myPosts = null,
    Object? status = freezed,
  }) {
    return _then(_$_ProfileModel(
      following: freezed == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      follower: freezed == follower
          ? _value._follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      likedPosts: freezed == likedPosts
          ? _value._likedPosts
          : likedPosts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      myPosts: null == myPosts
          ? _value._myPosts
          : myPosts // ignore: cast_nullable_to_non_nullable
              as List<PostsModel>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel with DiagnosticableTreeMixin implements _ProfileModel {
  const _$_ProfileModel(
      {final List<String>? following,
      final List<String>? follower,
      final List<String>? likedPosts,
      this.image,
      @JsonKey(name: '_id') required this.id,
      required this.username,
      required this.email,
      required final List<PostsModel> myPosts,
      this.status})
      : _following = following,
        _follower = follower,
        _likedPosts = likedPosts,
        _myPosts = myPosts;

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  final List<String>? _following;
  @override
  List<String>? get following {
    final value = _following;
    if (value == null) return null;
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _follower;
  @override
  List<String>? get follower {
    final value = _follower;
    if (value == null) return null;
    if (_follower is EqualUnmodifiableListView) return _follower;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _likedPosts;
  @override
  List<String>? get likedPosts {
    final value = _likedPosts;
    if (value == null) return null;
    if (_likedPosts is EqualUnmodifiableListView) return _likedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? image;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String username;
  @override
  final String email;
  final List<PostsModel> _myPosts;
  @override
  List<PostsModel> get myPosts {
    if (_myPosts is EqualUnmodifiableListView) return _myPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPosts);
  }

  @override
  final String? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileModel(following: $following, follower: $follower, likedPosts: $likedPosts, image: $image, id: $id, username: $username, email: $email, myPosts: $myPosts, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileModel'))
      ..add(DiagnosticsProperty('following', following))
      ..add(DiagnosticsProperty('follower', follower))
      ..add(DiagnosticsProperty('likedPosts', likedPosts))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('myPosts', myPosts))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality().equals(other._follower, _follower) &&
            const DeepCollectionEquality()
                .equals(other._likedPosts, _likedPosts) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._myPosts, _myPosts) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_following),
      const DeepCollectionEquality().hash(_follower),
      const DeepCollectionEquality().hash(_likedPosts),
      image,
      id,
      username,
      email,
      const DeepCollectionEquality().hash(_myPosts),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {final List<String>? following,
      final List<String>? follower,
      final List<String>? likedPosts,
      final String? image,
      @JsonKey(name: '_id') required final String id,
      required final String username,
      required final String email,
      required final List<PostsModel> myPosts,
      final String? status}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  List<String>? get following;
  @override
  List<String>? get follower;
  @override
  List<String>? get likedPosts;
  @override
  String? get image;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  List<PostsModel> get myPosts;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) {
  return _PostsModel.fromJson(json);
}

/// @nodoc
mixin _$PostsModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get totalLikes => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsModelCopyWith<PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsModelCopyWith<$Res> {
  factory $PostsModelCopyWith(
          PostsModel value, $Res Function(PostsModel) then) =
      _$PostsModelCopyWithImpl<$Res, PostsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      String image,
      bool isLiked,
      int totalLikes,
      List<String> likes});
}

/// @nodoc
class _$PostsModelCopyWithImpl<$Res, $Val extends PostsModel>
    implements $PostsModelCopyWith<$Res> {
  _$PostsModelCopyWithImpl(this._value, this._then);

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
    Object? isLiked = null,
    Object? totalLikes = null,
    Object? likes = null,
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
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostsModelCopyWith<$Res>
    implements $PostsModelCopyWith<$Res> {
  factory _$$_PostsModelCopyWith(
          _$_PostsModel value, $Res Function(_$_PostsModel) then) =
      __$$_PostsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String caption,
      String image,
      bool isLiked,
      int totalLikes,
      List<String> likes});
}

/// @nodoc
class __$$_PostsModelCopyWithImpl<$Res>
    extends _$PostsModelCopyWithImpl<$Res, _$_PostsModel>
    implements _$$_PostsModelCopyWith<$Res> {
  __$$_PostsModelCopyWithImpl(
      _$_PostsModel _value, $Res Function(_$_PostsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? image = null,
    Object? isLiked = null,
    Object? totalLikes = null,
    Object? likes = null,
  }) {
    return _then(_$_PostsModel(
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
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostsModel with DiagnosticableTreeMixin implements _PostsModel {
  const _$_PostsModel(
      {@JsonKey(name: '_id') required this.id,
      required this.caption,
      required this.image,
      required this.isLiked,
      required this.totalLikes,
      required final List<String> likes})
      : _likes = likes;

  factory _$_PostsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostsModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String caption;
  @override
  final String image;
  @override
  final bool isLiked;
  @override
  final int totalLikes;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostsModel(id: $id, caption: $caption, image: $image, isLiked: $isLiked, totalLikes: $totalLikes, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('caption', caption))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('isLiked', isLiked))
      ..add(DiagnosticsProperty('totalLikes', totalLikes))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, caption, image, isLiked,
      totalLikes, const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostsModelCopyWith<_$_PostsModel> get copyWith =>
      __$$_PostsModelCopyWithImpl<_$_PostsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostsModelToJson(
      this,
    );
  }
}

abstract class _PostsModel implements PostsModel {
  const factory _PostsModel(
      {@JsonKey(name: '_id') required final String id,
      required final String caption,
      required final String image,
      required final bool isLiked,
      required final int totalLikes,
      required final List<String> likes}) = _$_PostsModel;

  factory _PostsModel.fromJson(Map<String, dynamic> json) =
      _$_PostsModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get caption;
  @override
  String get image;
  @override
  bool get isLiked;
  @override
  int get totalLikes;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$$_PostsModelCopyWith<_$_PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
