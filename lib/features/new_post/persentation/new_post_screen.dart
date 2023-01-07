import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/new_post/controller/new_post_controller.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends ConsumerWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPostRef = ref.watch(newPostControllerProvider);
    TextEditingController postController = TextEditingController();
    late File image;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final result = await ref
                      .read(newPostControllerProvider.notifier)
                      .getImage();
                  image = result;
                },
                child: const Text('Pick Image')),
            TextField(
              decoration: const InputDecoration(hintText: 'Caption Input'),
              controller: postController,
            ),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(newPostControllerProvider.notifier)
                      .post(postController.text, image);
                },
                child: const Text('Post'))
          ],
        ),
      )),
    );
  }
}
