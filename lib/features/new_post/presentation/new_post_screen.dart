import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/new_post/controller/new_post_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oldinsa/features/new_post/presentation/preview_picked_image.dart';
import 'package:oldinsa/features/common/presentation/bottom_nav.dart';

import '../../home/controller/home_controller.dart';

class NewPostScreen extends ConsumerStatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  NewPostState createState() => NewPostState();
}

class NewPostState extends ConsumerState<NewPostScreen> {
  File? image;

  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   final result = ref.read(newPostControllerProvider.notifier).getImage();
    //   result.then((value) {
    //     setState(() {
    //       image = value;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final newPostRef = ref.watch(newPostControllerProvider);
    TextEditingController postController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                image == null
                    ? InkWell(
                        onTap: () async {
                          final result = await ref
                              .read(newPostControllerProvider.notifier)
                              .getImage();
                          setState(() {
                            image = result;
                          });
                        },
                        child: const Icon(
                          Icons.image_search,
                          size: 100,
                          color: Colors.grey,
                        ),
                      )
                    : Expanded(child: PreviewSelectedImage(image: image!)),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Caption'),
                    controller: postController,
                  ),
                ),
                newPostRef.when(
                    data: (data) => ElevatedButton(
                        onPressed: () async {
                          await ref
                              .read(newPostControllerProvider.notifier)
                              .post(postController.text, image!);
                          await ref
                              .read(homeControllerProvider.notifier)
                              .getPosts();
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNav()),
                            );
                          }
                        },
                        child: const Text('Post')),
                    error: (error, ee) => const Text('error'),
                    loading: () => const Text('Posting...'))
              ],
            ),
          )),
    );
  }
}
