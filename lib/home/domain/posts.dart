import 'package:json_annotation/json_annotation.dart';

part 'posts.g.dart';

@JsonSerializable()
class PostsModel {
  @JsonKey(name: '_id')
  String id;

  String caption;
  int countLikes;
  String author;
  List<String> likes;

  PostsModel(
      {required this.id,
      required this.caption,
      required this.countLikes,
      required this.author,
      required this.likes});


      factory PostsModel.fromJson(Map<String, dynamic> data) =>
      _$PostsModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}
