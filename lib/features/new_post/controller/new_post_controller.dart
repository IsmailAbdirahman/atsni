import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/new_post/repository/new_post_repository.dart';
import 'package:image_picker/image_picker.dart';

final newPostControllerProvider =
    StateNotifierProvider<NewPostController, AsyncValue<bool>>((ref) {
  final newPostRepository = ref.watch(newPostRepositoryProvider);

  return NewPostController(newPostRepository: newPostRepository);
});

class NewPostController extends StateNotifier<AsyncValue<bool>> {
  final NewPostRepository newPostRepository;

  NewPostController({required this.newPostRepository})
      : super(const AsyncData(false));

  Future<bool> post(String caption, File file) async {
    final result = await newPostRepository.newPost(
        endPoint: 'https://oldclonee.onrender.com/userPost/createPost', caption: caption, file: file);
    state = AsyncData(result);

    return result;
  }

  Future<File> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? result = await imagePicker.pickImage(source: ImageSource.gallery);
    File file = File(result!.path);
    print('-0-0-0-0-0-0-0-0-0-0-0-0-0- : $file');
    return file;
  }
}
