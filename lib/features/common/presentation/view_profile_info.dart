import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:oldinsa/features/common/components/profile_bio.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/common/presentation/show_folllow_number.dart';
import 'package:oldinsa/features/followers_list/presentation/followers_list_screen.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/common/presentation/profile_posts_tile.dart';
import 'package:oldinsa/features/profile/presentation/edit_profile.dart';
import 'package:oldinsa/features/profile/presentation/shared_widegts/custom_vertical_divider.dart';
import 'package:oldinsa/features/common/components/profile_photo.dart';
import 'package:oldinsa/shared_widgets/post_tile.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../following_list/persentation/following_list_screen.dart';

class ViewProfileInfo extends ConsumerWidget {
  const ViewProfileInfo({Key? key, required this.userProfileID})
      : super(key: key);
  final String userProfileID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewProfileRef =
        ref.watch(viewProfileControllerProvider(userProfileID));
    Color dividerColor = Colors.grey;

    return viewProfileRef.when(
        data: (data) => Scaffold(
              backgroundColor: const Color(0xFFd7d8d9),
              appBar: AppBar(
                backgroundColor: const Color(0xff306088),
                title: Text(data.username),
                centerTitle: true,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.settings),
                  )
                ],
              ),
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 240,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          color: const Color(0xFFf2f2f2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ProfilePhoto(
                                    image: data.image!,
                                  ),
                                  const CustomVerticalDivider(
                                    height: 131,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ShowFollowNumbers(
                                                data: data.myPosts.length
                                                    .toString(),
                                                name: "Posts"),
                                            const CustomVerticalDivider(
                                              height: 90,
                                            ),
                                            ShowFollowNumbers(
                                              data: data.following!.length
                                                  .toString(),
                                              name: "Following",
                                              onPressed: () {
                                                if (context.mounted) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewFollowingListScreen(
                                                              userID: data.id,
                                                            )),
                                                  );
                                                }
                                              },
                                            ),
                                            const CustomVerticalDivider(
                                              height: 90,
                                            ),
                                            ShowFollowNumbers(
                                              data: data.follower!.length
                                                  .toString(),
                                              name: "Follower",
                                              onPressed: () {
                                                if (context.mounted) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FollowersListScreen(
                                                              userID: data.id,
                                                            )),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: dividerColor,
                                        ),
                                        FollowButton(userID: data.id)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 0.5,
                                color: dividerColor,
                              ),
                              ProfileBio(
                                  username: data.username, bio: "Here is bio")
                            ],
                          ),
                        ),
                      ),
                    ),
                    GridViewPosts(posts: data)
                  ],
                ),
              ),
            ),
        error: (e, r) => Text(e.toString()),
        loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ));
  }
}

class GridViewPosts extends StatelessWidget {
  const GridViewPosts({Key? key, required this.posts}) : super(key: key);

  final ProfileModel posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: posts.myPosts.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 90,
                width: 90,
                child: Card(
                  elevation: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewPostAsList(
                                  userId: posts.id,
                                  index: index,
                                ),
                            maintainState: true),
                      );
                    },
                    child: Image(
                      image: NetworkImage(posts.myPosts[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ViewPostAsList extends ConsumerWidget {
  ViewPostAsList({Key? key, required this.userId, required this.index})
      : super(key: key);

  final String userId;
  final int index;

  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsRef = ref.watch(viewProfileControllerProvider(userId));
    return Scaffold(
        body: postsRef.when(
            data: (data) => ScrollablePositionedList.builder(
                initialScrollIndex: index,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: data.myPosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyPostTile(
                      profileModel: data, postsModel: data.myPosts[index]);
                }),
            error: (e, er) => const Text("Error"),
            loading: () => const CircularProgressIndicator()));
  }
}
