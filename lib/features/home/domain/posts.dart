import 'package:json_annotation/json_annotation.dart';

import '../../profile/domain/profileModel.dart';

part 'posts.g.dart';

@JsonSerializable()
class PostsModel {

  @JsonKey(name: '_id')
  String id;

  String caption;
  int countLikes;
  List<String> likes;
 ProfileModel author;

  PostsModel(
      {required this.id,
      required this.caption,
      required this.countLikes,
      required this.likes, required this.author
    });

  factory PostsModel.fromJson(Map<String, dynamic> data) =>
      _$PostsModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
