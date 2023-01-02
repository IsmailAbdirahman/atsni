import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/search/repository/search_repository.dart';

import '../../login/controller/login_controller.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchController, AsyncValue<List<ProfileModel>>>((ref) {
  final searchRepository = ref.watch(searchRepositoryProvider);

  return SearchController(searchRepository: searchRepository, ref: ref);
});

class SearchController extends StateNotifier<AsyncValue<List<ProfileModel>>> {
  final SearchRepository searchRepository;
  final Ref ref;

  SearchController({required this.searchRepository, required this.ref})
      : super(const AsyncValue.loading());

  Future<List<ProfileModel>> getUserNames(String username) async {
    state = const AsyncValue.loading();
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final result = await searchRepository.getUsernames(
        username: username,
        endPoint: 'search-username',
        header: header);
    print('-------------------- ${result}');
    state = AsyncValue.data(result);

    return result;
  }
}