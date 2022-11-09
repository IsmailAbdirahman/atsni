// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      countLikes: json['countLikes'] as int,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: ProfileModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'countLikes': instance.countLikes,
      'likes': instance.likes,
      'author': instance.author,
    };
