import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/foundation.dart';

part 'home_model.freezed.dart';

part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    @JsonKey(name: '_id') required final String id,
    required final String caption,
    required final String image,
    required final List<String> likes,
    required final AuthorModel author,
    required final bool isLiked,
    required final int totalLikes,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> data) =>
      _$HomeModelFromJson(data);
}

@freezed
class AuthorModel with _$AuthorModel {
  const factory AuthorModel(
      {@JsonKey(name: '_id') required final String id,
      required final String username,
      required final String image}) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, dynamic> data) =>
      _$AuthorModelFromJson(data);
}
