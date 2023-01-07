import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/new_post/data/new_post_data.dart';

final newPostRepositoryProvider = Provider((ref) {
  final newPostRepository = ref.watch(newPostServiceProvider);

  return NewPostRepository(newPostRepository);
});

class NewPostRepository {
  final NewPostService newPostService;

  NewPostRepository(this.newPostService);

  Future<bool> newPost(
      {required String endPoint,
      required String caption,
      required File file}) async {
    final response = await newPostService.newPost(endPoint, caption, file);
    if (response == 200) {

    }
    return false;
  }
}
