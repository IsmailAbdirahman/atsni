// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'likes': instance.likes,
      'author': instance.author,
    };

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'image': instance.image,
    };
