import 'dart:convert';

import 'package:oldinsa/features/common/service/http.dart';
import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:oldinsa/features/home/service/home_service.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_post_repository.g.dart';

@Riverpod(keepAlive: true)
LikePostRepository likePostRepository(LikePostRepositoryRef ref) {
  return LikePostRepository(ref.watch(homeServiceProvider));
}

class LikePostRepository {
  final Http httpService;

  LikePostRepository(this.httpService);

  Future<PostsModel> likePost(String endPoint) async {
    final response = await httpService.get(endPoint);
    final data = PostsModel.fromJson(response['postObject']);

    return data;
  }
}
