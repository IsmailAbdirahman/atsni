// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      countLikes: json['countLikes'] as int,
      author: json['author'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'countLikes': instance.countLikes,
      'author': instance.author,
      'likes': instance.likes,
    };
