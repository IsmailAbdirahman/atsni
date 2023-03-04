import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../data/profile_service.dart';
import '../repository/edit_profile_repository.dart';
import 'view_profile_controller.dart';

final editProfileControllerProvider =
    StateNotifierProvider<EditProfileController, AsyncValue<MyProfile>>((ref) {
  final profileService = ref.watch(editRepositoryProvider);
  final reff = ref;
  return EditProfileController(
      editProfileRepository: profileService, ref: reff);
});

class EditProfileController extends StateNotifier<AsyncValue<MyProfile>> {
  final EditProfileRepository editProfileRepository;
  final Ref ref;

  EditProfileController(
      {required this.editProfileRepository, required this.ref})
      : super(const AsyncValue.loading());

  Future<MyProfile> editMyProfile({
    required String username,
    required String password,
  }) async {
    final data = await editProfileRepository.editMyProfile(
      username: username,
      password: password,
      endPoint: 'edit-profile',
    );
    await ref.read(viewProfileControllerProvider.notifier).myProfile();

    return data;
  }
}
