import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: '_id')
  String id;

  String username;
  List<String> following;
  List<String> follower;
  List<String> likedPosts;


  LoginModel(
      {required this.username,
      required this.follower,
      required this.following,
      required this.likedPosts,
      required this.id,
    });

  factory LoginModel.fromJson(Map<String, dynamic> data) =>
      _$LoginModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
