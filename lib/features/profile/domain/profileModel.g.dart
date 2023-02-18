// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProfile _$MyProfileFromJson(Map<String, dynamic> json) => MyProfile(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MyProfileToJson(MyProfile instance) => <String, dynamic>{
      'posts': instance.posts,
      'profile': instance.profile,
      'status': instance.status,
    };

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
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

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'email': instance.email,
      'following': instance.following,
      'follower': instance.follower,
      'status': instance.status,
    };

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) => PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: json['author'] as String,
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
