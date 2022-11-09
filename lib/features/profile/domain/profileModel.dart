import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '_id')
  String id;

  String username;
  String email;
  // List<String> following;
  // List<String> follower;
  // List<String> likedPosts;

  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> data) =>
      _$ProfileModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
