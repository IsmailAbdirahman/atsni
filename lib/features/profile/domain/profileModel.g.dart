// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProfile _$$_MyProfileFromJson(Map<String, dynamic> json) => _$_MyProfile(
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_MyProfileToJson(_$_MyProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'status': instance.status,
    };

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      follower: (json['follower'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      likedPosts: (json['likedPosts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      myPosts: (json['myPosts'] as List<dynamic>)
          .map((e) => PostsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'following': instance.following,
      'follower': instance.follower,
      'likedPosts': instance.likedPosts,
      'image': instance.image,
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'myPosts': instance.myPosts,
      'status': instance.status,
    };

_$_PostsModel _$$_PostsModelFromJson(Map<String, dynamic> json) =>
    _$_PostsModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      isLiked: json['isLiked'] as bool,
      totalLikes: json['totalLikes'] as int,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PostsModelToJson(_$_PostsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'image': instance.image,
      'isLiked': instance.isLiked,
      'totalLikes': instance.totalLikes,
      'likes': instance.likes,
    };
