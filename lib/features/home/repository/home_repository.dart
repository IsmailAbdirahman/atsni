import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../../profile/domain/profileModel.dart';
import '../service/home_service.dart';

final homeRepositoryProvider = Provider((ref) {
  final httpService = ref.watch(homeServiceProvider);
  return HomeRepository(httpService);
});

class HomeRepository {
  final HttpService httpService;

  HomeRepository(this.httpService);

  Future<List<HomeModel>> getPosts(String endPoint) async {
    final response = await httpService.get(endPoint);
    return List<HomeModel>.from(response.map((e) => HomeModel.fromJson(e)));
  }

  Future<HomeModel> likePost(String? endPoint) async {
    final response = await httpService.get(endPoint!);
    var data = HomeModel.fromJson(response);
    return data;
  }
}
