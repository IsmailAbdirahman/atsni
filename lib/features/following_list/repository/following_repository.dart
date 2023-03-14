import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/service/htttp_service.dart';

import '../../profile/domain/profileModel.dart';

final followingRepositoryProvider = Provider((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return FollowingRepository(httpService);
});

class FollowingRepository {
  final HttpService httpService;

  FollowingRepository(this.httpService);

  Future<List<ProfileModel>> getAllFollowing(String endPoint) async {
    final response = await httpService.get(endPoint);
    return List<ProfileModel>.from(
        response['profileList'].map((user) => ProfileModel.fromJson(user)));
  }
}
