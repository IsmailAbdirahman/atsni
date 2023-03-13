import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../../profile/repository/profile_repository.dart';

part 'view_profile_controller.g.dart';

@riverpod
class ViewProfileController extends _$ViewProfileController {
  @override
  Future<ProfileModel> build(String userId) async {
    return viewUserProfile(userId);
  }

  Future<ProfileModel> viewUserProfile(String userId) async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(profileRepositoryProvider);
    final result =
        await profileRepository.viewUserProfile(userId, 'viewProfile/$userId');
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
