import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../profile/domain/profileModel.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String caption;
  final String image;
  final List<String> likes;
  final AuthorModel author;

  const HomeModel({
    required this.id,
    required this.caption,
    required this.image,
    required this.likes,
    required this.author,
  });

  @override
  List<Object?> get props => [id, caption, likes, author, image];

  HomeModel copyWith({
    String? id,
    String? caption,
    String? image,
    List<String>? likes,
    AuthorModel? author,
  }) {
    return HomeModel(
        id: id ?? this.id,
        caption: caption ?? this.caption,
        image: image ?? this.image,
        likes: likes ?? this.likes,
        author: author ?? this.author);
  }

  factory HomeModel.fromJson(Map<String, dynamic> data) =>
      _$HomeModelFromJson(data);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class AuthorModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String username;
  final String image;

  const AuthorModel(
      {required this.id, required this.username, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, username, image];

  factory AuthorModel.fromJson(Map<String, dynamic> data) =>
      _$AuthorModelFromJson(data);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
