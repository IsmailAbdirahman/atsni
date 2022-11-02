import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/home/domain/posts.dart';
import 'package:oldinsa/profile/data/profile_service.dart';

import '../../login/controller/login_controller.dart';

class HomeEntity {
  AsyncValue<PostsModel> data;

  HomeEntity({required this.data});

  HomeEntity copyWith({AsyncValue<PostsModel>? data}) {
    return HomeEntity(data: data ?? this.data);
  }
}

final homeControllerProvider = StateNotifierProvider((ref) {
  final profileService = ref.watch(profileServiceProvider);

  return HomeController(profileService: profileService);
});

class HomeController extends StateNotifier<HomeEntity> {
  final ProfileService profileService;

  HomeController({required this.profileService})
      : super(HomeEntity(data: const AsyncValue.loading()));

  Future<bool> likePost(String postId) async {
    state = state.copyWith(data: const AsyncValue.loading());
    final likedPost = await profileService.likePost(postId);
    if (likedPost.likes.contains(postId)) {
      state = state.copyWith(data: AsyncValue.data(likedPost));
      return true;
    } else {
      return false;
    }
  }
}
