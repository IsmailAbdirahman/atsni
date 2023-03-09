import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/data/profile_service.dart';
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../domain/profileModel.dart';

final profileRepositoryProvider = Provider((ref) {
  final profileService = ref.watch(profileServiceProvider);
  return ProfileRepository(profileService);
});

class ProfileRepository {
  ProfileService profileService;

  ProfileRepository(this.profileService);

  Future<ProfileModel> myProfile(String endPoint) async {
    final response = await profileService.get(endPoint);
    var data = ProfileModel.fromJson(response['profile']);
    return data;
  }

  Future<ProfileModel> viewUserProfile(String id, String endPoint) async {
    final response = await profileService.get(endPoint);
    return ProfileModel.fromJson(response['profile']);
  }

  Future<List<ProfileModel>> getAllFollowing(String endPoint) async {
    final response = await profileService.get(endPoint);
    return List<ProfileModel>.from(
        response['profileList'].map((user) => ProfileModel.fromJson(user)));
  }

  Future<List<ProfileModel>> getAllFollowers(String endPoint) async {
    final response = await profileService.get(endPoint);
    return List<ProfileModel>.from(
        response['profileList'].map((user) => ProfileModel.fromJson(user)));
  }

  Future<String> followUser(String endPoint) async {
    final response = await profileService.get(endPoint);
    return response['status'];
  }

  Future<String> getStatus(String endPoint) async {
    final response = await profileService.get(endPoint);
    return response['status'];
  }
}
