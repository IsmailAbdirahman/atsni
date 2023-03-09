import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../home/domain/home_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profileModel.freezed.dart';

part 'profileModel.g.dart';

@freezed
class MyProfile with _$MyProfile {
  const factory MyProfile({required ProfileModel profile, String? status}) =
      _MyProfile;

  factory MyProfile.fromJson(Map<String, dynamic> data) =>
      _$MyProfileFromJson(data);
}

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel(
      {final List<String>? following,
      final List<String>? follower,
      final List<String>? likedPosts,
      final String? image,
      @JsonKey(name: '_id') required final String id,
      required final String username,
      required final String email,
      required List<PostsModel> myPosts,
      final String? status}) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> data) =>
      _$ProfileModelFromJson(data);
}

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    @JsonKey(name: '_id') required String id,
    required String caption,
    required String image,
    required List<String> likes,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> data) =>
      _$PostsModelFromJson(data);
}
