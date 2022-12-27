import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../home/domain/posts.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class MyProfile extends Equatable {
  final List<MyPosts> posts;
  final ProfileModel profile;
  final String? status;

  const MyProfile({required this.posts, required this.profile, this.status});

  @override
  List<Object?> get props => [posts, profile, status];

  factory MyProfile.fromJson(Map<String, dynamic> data) =>
      _$MyProfileFromJson(data);

  Map<String, dynamic> toJson() => _$MyProfileToJson(this);
}

@JsonSerializable()
class ProfileModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String username;
  final String email;
  final List<String> following;
  final List<String> follower;
  final String? status;

  const ProfileModel(
      {required this.following,
      required this.follower,
      required this.id,
      required this.username,
      required this.email,
      this.status});

  @override
  List<Object?> get props => [id, username, email, following, follower, status];

  factory ProfileModel.fromJson(Map<String, dynamic> data) =>
      _$ProfileModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class MyPosts extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String caption;
  final int countLikes;
  final List<String> likes;
  final String author;
  final bool isLiked;

  const MyPosts(
      {required this.id,
      required this.caption,
      required this.likes,
      required this.author,
      required this.countLikes,
      this.isLiked = false});

  factory MyPosts.fromJson(Map<String, dynamic> data) =>
      _$MyPostsFromJson(data);

  Map<String, dynamic> toJson() => _$MyPostsToJson(this);

  @override
  List<Object?> get props => [id, caption, countLikes, likes, author, isLiked];
}
