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
                              child: PostTile(homeModel: data[index]));
                        },
                      ),
                  error: (e, r) => Text(e.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())))
        ]));
  }
}

class PostTile extends ConsumerWidget {
  PostTile({super.key, required this.homeModel});

  final HomeModel homeModel;
  late bool isLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: NetworkImage(homeModel.author.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final result = await ref
                          .read(viewControllerProvider.notifier)
                          .viewUserProfile(homeModel.author.id);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewProfileTile(data: result)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        homeModel.author.username,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF306088)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image(
                image: NetworkImage(homeModel.image),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 0.0),
              child: Row(
                children: [
                  homeModel.likes.contains("63e29eead6c3e3f9a436c13d") == true
                      ? IconButton(
                          onPressed: () {
                            ref
                                .read(homeControllerProvider.notifier)
                                .likePost(homeModel.id);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            print("-0-0-0-0-0 ${homeModel.id}-0-0-00-");
                            ref
                                .read(homeControllerProvider.notifier)
                                .likePost(homeModel.id);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${homeModel.likes.length.toString()} likes',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF306088)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Wrap(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.comment_bank,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      homeModel.author.username,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF306088)),
                    ),
                  ),
                  Text(homeModel.caption)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
