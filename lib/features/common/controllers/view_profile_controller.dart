import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/repository/follow_user_repository.dart';
import 'package:oldinsa/features/common/repository/like_post_repository.dart';
import 'package:oldinsa/features/profile/controller/myprofile_info_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../../profile/repository/profile_repository.dart';

part 'view_profile_controller.g.dart';

@Riverpod(keepAlive: true)
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

  void likePostFromProfile(String postId) async {
    final likeRepo = ref.watch(likePostRepositoryProvider);
    PostsModel data = await likeRepo.likePost('likedPost/$postId');
    int totalLikes = data.totalLikes;
    bool isLiked = data.isLiked;
    final post = state.value!.myPosts.firstWhere((p) => p.id == postId);
    final updatedPost = post.copyWith(
        totalLikes: totalLikes, isLiked: isLiked, likes: data.likes);
    final updatedPosts = [...state.value!.myPosts];
    final index = updatedPosts.indexWhere((p) => p.id == postId);
    updatedPosts[index] = updatedPost;

    state = AsyncData(state.value!.copyWith(myPosts: updatedPosts));
  }

  Future<ProfileModel> followUserFromProfile(String userId) async {
    final profileRepository = ref.read(followUserProvider);
    final result = await profileRepository.followUser('follow-user/$userId');
    state = state.whenData((value) {
      return value.copyWith(status: result.status, follower: result.follower);
    });
    return result;
  }
}
