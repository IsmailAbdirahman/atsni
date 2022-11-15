// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProfile _$MyProfileFromJson(Map<String, dynamic> json) => MyProfile(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => MyPosts.fromJson(e as Map<String, dynamic>))
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
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'following': instance.following,
      'follower': instance.follower,
      'status': instance.status,
    };

MyPosts _$MyPostsFromJson(Map<String, dynamic> json) => MyPosts(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      author: json['author'] as String,
      countLikes: json['countLikes'] as int,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$MyPostsToJson(MyPosts instance) => <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'countLikes': instance.countLikes,
      'likes': instance.likes,
      'author': instance.author,
      'isLiked': instance.isLiked,
    };
