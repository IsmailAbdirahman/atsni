import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../home/domain/home_model.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class MyProfile extends Equatable {
  final List<PostsModel> posts;
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
  final String? image;
  final String email;
  final List<String> following;
  final List<String> follower;
  final String? status;

  const ProfileModel(
      {required this.following,
      required this.follower,
       this.image,
      required this.id,
      required this.username,
      required this.email,
      this.status});

  @override
  List<Object?> get props =>
      [id, image, username, email, following, follower, status];

  factory ProfileModel.fromJson(Map<String, dynamic> data) =>
      _$ProfileModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}


@JsonSerializable()
class PostsModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String caption;
  final String image;
  final List<String> likes;
  final String author;
  final bool isLiked;

  const PostsModel(
      {required this.id,
        required this.caption,
        required this.image,
        required this.likes,
        required this.author,
        this.isLiked = false});

  @override
  List<Object?> get props => [id, caption, likes, author, isLiked, image];

  factory PostsModel.fromJson(Map<String, dynamic> data) =>
      _$PostsModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
