import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class RegisterModel {

  @JsonKey(name: '_id')
  String id;

  String username;
  String email;
  List? follower;
  List? following;

  RegisterModel(
      {required this.id,
      required this.username,
      required this.email,
      this.follower,
      this.following});

  factory RegisterModel.fromJson(Map<String, dynamic> data) =>
      _$RegisterModelFromJson(data);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
