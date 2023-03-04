import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

part 'view_profile_controller.g.dart';

// final viewControllerProvider =
//     StateNotifierProvider<ViewProfileController, AsyncValue<MyProfile>>((ref) {
//   final profileRepository = ref.watch(profileRepositoryProvider);
//   final reff = ref;
//   return ViewProfileController(profileRepository: profileRepository, ref: reff);
// });
@riverpod
class ViewProfileController extends _$ViewProfileController {
  @override
  Future<MyProfile> build() async {
    return myProfile();
  }

  Future<MyProfile> myProfile() async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(profileRepositoryProvider);

    final result = await profileRepository.myProfile('myProfile');
    state = AsyncValue.data(result);
    return result;
  }

  Future<MyProfile> viewUserProfile(String id) async {
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
