import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPostScreen extends ConsumerWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController postController = TextEditingController();

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Caption Input'),
              controller: postController,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Post'))
          ],
        ),
      )),
    );
  }
}
