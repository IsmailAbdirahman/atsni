// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$$_HomeModelFromJson(Map<String, dynamic> json) => _$_HomeModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool,
      totalLikes: json['totalLikes'] as int,
    );

Map<String, dynamic> _$$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'likes': instance.likes,
      'author': instance.author,
      'isLiked': instance.isLiked,
      'totalLikes': instance.totalLikes,
    };

_$_AuthorModel _$$_AuthorModelFromJson(Map<String, dynamic> json) =>
    _$_AuthorModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_AuthorModelToJson(_$_AuthorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'image': instance.image,
    };
