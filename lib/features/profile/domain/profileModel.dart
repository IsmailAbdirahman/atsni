import 'package:json_annotation/json_annotation.dart';

import '../../home/domain/posts.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class MyProfile {
  List<MyPosts> posts;
  ProfileModel profile;
  String? status;

  MyProfile({required this.posts, required this.profile, this.status});

  factory MyProfile.fromJson(Map<String, dynamic> data) =>
      _$MyProfileFromJson(data);

  Map<String, dynamic> toJson() => _$MyProfileToJson(this);
}

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '_id')
  String id;

  String username;
  String email;
  List<String> following;
  List<String> follower;
  String? status;

  ProfileModel(
      {required this.following,
      required this.follower,
      required this.id,
      required this.username,
      required this.email,
      this.status});

  factory ProfileModel.fromJson(Map<String, dynamic> data) =>
      _$ProfileModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class MyPosts {
  @JsonKey(name: '_id')
  String id;

  String caption;
  int countLikes;
  List<String> likes;
  String author;
  bool isLiked;

  MyPosts(
      {required this.id,
      required this.caption,
      required this.likes,
      required this.author,
      required this.countLikes,
      this.isLiked = false});

  factory MyPosts.fromJson(Map<String, dynamic> data) =>
      _$MyPostsFromJson(data);

  Map<String, dynamic> toJson() => _$MyPostsToJson(this);
}
