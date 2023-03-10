import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../repository/edit_profile_repository.dart';
import '../repository/profile_repository.dart';

part 'view_profile_controller.g.dart';

@riverpod
class ViewProfileController extends _$ViewProfileController {
  @override
  Future<ProfileModel> build() async {
    return myProfile();
  }

  Future<ProfileModel> myProfile() async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(profileRepositoryProvider);

    final result = await profileRepository.myProfile('myProfile');

    state = AsyncValue.data(result);
    return result;
  }

  Future<String> editMyProfile({
    required String username,
  }) async {
    final editProfileRepository = ref.read(editRepositoryProvider);

    final data = await editProfileRepository.editMyProfile(
      username: username,
      endPoint: 'edit-profile',
    );
    state = state.whenData((value) => value.copyWith(username: data));

    return data;
  }

  Future<ProfileModel> viewUserProfile(String id) async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(profileRepositoryProvider);
    final result =
        await profileRepository.viewUserProfile(id, 'viewProfile/$id');
    state = AsyncValue.data(result);

    return result;
  }

  Future<String> followUserFromProfile(String userId) async {
    final profileRepository = ref.read(profileRepositoryProvider);
    final status = await profileRepository.followUser('follow-user/$userId');
    state = state.whenData((value) {
      return value.copyWith(status: status);
    });
    return status;
  }
}
