import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../profile/domain/profileModel.dart';

part 'posts.g.dart';

@JsonSerializable()
class PostsModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String caption;
  final int countLikes;
  final List<String> likes;
  final ProfileModel author;
  final bool isLiked;

  const PostsModel(
      {required this.id,
      required this.caption,
      required this.countLikes,
      required this.likes,
      required this.author,
      this.isLiked = false});

  @override
  List<Object?> get props => [id, caption, countLikes, likes, author, isLiked];

  factory PostsModel.fromJson(Map<String, dynamic> data) =>
      _$PostsModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
