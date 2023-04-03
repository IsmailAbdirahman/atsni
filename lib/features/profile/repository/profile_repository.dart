import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/data/profile_service.dart';
import 'package:oldinsa/features/common/service/http.dart';

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


}
