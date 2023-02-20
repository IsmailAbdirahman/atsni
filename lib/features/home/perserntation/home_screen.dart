import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../profile/controller/view_profile_controller.dart';
import '../../profile/data/profile_service.dart';
import '../../profile/domain/profileModel.dart';
import '../../../shared_widgets/post_tile.dart';
import '../../profile/persentation/shared_widegts/view_profile_tile.dart';
import '../controller/home_controller.dart';
import '../service/home_service.dart';

class HomeScreen extends ConsumerWidget {
  // List<PostMo> postList =[];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeRef = ref.watch(homeControllerProvider);
    final myID = ref.watch(viewControllerProvider).value;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff306088),
          title: const Text(
            'Instagram',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                  onTap: () {
                    ref.read(homeControllerProvider.notifier).getPosts();
                  },
                  child: const Icon(Icons.update)),
            ),
          ],
        ),
        body: Column(children: [
          Expanded(
              child: homeRef.when(
                  data: (data) => ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onDoubleTap: () {
                                ref
                                    .read(homeControllerProvider.notifier)
                                    .likePost(data[index].id);
                              },
                              child: PostTile(
                                username: data[index].author.username,
                                userID: data[index].author.id,
                                profileImage: data[index].author.image,
                                postId: data[index].id,
                                postImage: data[index].image,
                                likes: data[index].likes,
                                caption: data[index].caption,
                              ));
                        },
                      ),
                  error: (e, r) => Text(e.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())))
        ]));
  }
}
