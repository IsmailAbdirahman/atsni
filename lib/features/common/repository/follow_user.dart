import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_user.g.dart';

@riverpod
FollowUser followUser(FollowUserRef ref) {
  return FollowUser(ref.watch(httpServiceProvider));
}

class FollowUser {
  final HttpService httpService;

  FollowUser(this.httpService);

  Future<String> followUser(String endPoint) async {
    final response = await httpService.get(endPoint);
    return response['status'];
  }
}
