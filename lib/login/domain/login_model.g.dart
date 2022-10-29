// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String,
      follower:
          (json['follower'] as List<dynamic>).map((e) => e as String).toList(),
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
      likedPosts: (json['likedPosts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'following': instance.following,
      'follower': instance.follower,
      'likedPosts': instance.likedPosts,
    };
