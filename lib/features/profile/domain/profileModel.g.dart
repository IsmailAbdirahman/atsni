// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProfile _$$_MyProfileFromJson(Map<String, dynamic> json) => _$_MyProfile(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_MyProfileToJson(_$_MyProfile instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'profile': instance.profile,
      'status': instance.status,
    };

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
      follower:
          (json['follower'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String?,
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'following': instance.following,
      'follower': instance.follower,
      'image': instance.image,
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'status': instance.status,
    };

_$_PostsModel _$$_PostsModelFromJson(Map<String, dynamic> json) =>
    _$_PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: json['author'] as String,
    );

Map<String, dynamic> _$$_PostsModelToJson(_$_PostsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'likes': instance.likes,
      'author': instance.author,
    };
