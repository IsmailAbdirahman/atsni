import 'dart:convert';

import 'package:oldinsa/features/common/service/http.dart';
import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:oldinsa/features/home/service/home_service.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_post_repository.g.dart';

@riverpod
LikePostRepository likePostRepository(LikePostRepositoryRef ref) {
  return LikePostRepository(ref.watch(homeServiceProvider));
}

class LikePostRepository {
  final Http httpService;

  LikePostRepository(this.httpService);

  Future<List<String>> likePost(String endPoint) async {
    final response = await httpService.get(endPoint);
    List<String> data = List.from(response['likedUsersList']);
    print("-------likePost---------------- $data");
    return data;
  }
}
