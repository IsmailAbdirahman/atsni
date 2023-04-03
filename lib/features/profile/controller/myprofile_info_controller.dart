import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../repository/edit_profile_repository.dart';
import '../repository/profile_repository.dart';

part 'myprofile_info_controller.g.dart';

@riverpod
class MyProfileInfoController extends _$MyProfileInfoController {
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
}
