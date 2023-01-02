// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: ProfileModel.fromJson(json['author'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$PostsModelToJson(PostsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'likes': instance.likes,
      'author': instance.author,
      'isLiked': instance.isLiked,
    };
