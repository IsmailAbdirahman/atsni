// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      follower: json['follower'] as List<dynamic>?,
      following: json['following'] as List<dynamic>?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'follower': instance.follower,
      'following': instance.following,
    };
