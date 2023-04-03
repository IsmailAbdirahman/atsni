import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/repository/like_post_repository.dart';
import 'package:oldinsa/features/home/repository/home_repository.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../profile/controller/myprofile_info_controller.dart';
import '../../profile/data/profile_service.dart';
import '../../profile/repository/profile_repository.dart';
import '../domain/home_model.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<List<HomeModel>> build() async {
    return getPosts();
  }

  Future<List<HomeModel>> getPosts() async {
    state = const AsyncValue.loading();
    final homeRepository = ref.read(homeRepositoryProvider);
    final data = await homeRepository.getPosts('getMyFollowingsPosts');
    state = AsyncValue.data(data);

    return data;
  }

  Future likePost(String postId) async {
    final myID = ref.read(myProfileInfoControllerProvider);
    final homeRepository = ref.read(likePostRepositoryProvider);
    final data = await homeRepository.likePost('likedPost/$postId');

    String thisUserID = myID.whenData((value) => value.id).value!;
    int totalLikes = data.length;
    bool isLikedByThisUser = data.contains(thisUserID);

    state = AsyncValue.data([
      for (var post in state.value!)
        if (post.id == postId)
          post.copyWith(isLiked: isLikedByThisUser, totalLikes: totalLikes)
        else
          post
    ]);
  }
}
