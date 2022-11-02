// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      follower:
          (json['follower'] as List<dynamic>).map((e) => e as String).toList(),
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
      email: json['email'] as String,
      likedPosts: (json['likedPosts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'following': instance.following,
      'follower': instance.follower,
      'likedPosts': instance.likedPosts,
    };
