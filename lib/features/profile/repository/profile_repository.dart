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

  Future<MyProfile> myProfile(String endPoint) async {
    final response = await profileService.get(endPoint);
    debugPrint('----------------myProfile-------------------- $response');
    var data = MyProfile.fromJson(response);
    return data;
  }

  Future<MyProfile> viewUserProfile(String id, String endPoint) async {
    final response = await profileService.get(endPoint);
    return MyProfile.fromJson(response);
  }

  Future<List<ProfileModel>> getAllFollowing(String endPoint) async {
    final response = await profileService.get(endPoint);
    return List<ProfileModel>.from(
        response['profileList'].map((user) => ProfileModel.fromJson(user)));
  }

  Future<List<ProfileModel>> getAllFollowers(String endPoint) async {
    final response = await profileService.get(endPoint);
    return List<ProfileModel>.from(
        response.map((user) => ProfileModel.fromJson(user)));
  }

  Future<String> followUser(String endPoint, Map<String, String> header) async {
    final response = await profileService.get(endPoint);
    return response['status'];
  }
}
