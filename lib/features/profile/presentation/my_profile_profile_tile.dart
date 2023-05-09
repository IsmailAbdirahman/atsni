import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/followers_list/presentation/followers_list_screen.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:oldinsa/features/common/components/profile_photo.dart';
import 'package:oldinsa/features/common/presentation/profile_posts_tile.dart';
import 'package:oldinsa/shared_widgets/post_tile.dart';

import '../../following_list/persentation/following_list_screen.dart';
import '../controller/myprofile_info_controller.dart';
import '../domain/profileModel.dart';
import 'edit_profile.dart';
import 'shared_widegts/custom_vertical_divider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyProfileView extends ConsumerWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///THis provider is used to get only info as Grid view
    ///When we navigate to the next screen we are using this provider ['viewProfileControllerProvider']
    ///to get data as a list and update the liked post since it has the likeFromProfile method
    final viewProfileRef = ref.watch(myProfileInfoControllerProvider);
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
                                            GestureDetector(
                                              onTap: () {
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
                                              child: ShowFollowNumbers(
                                                  data: data.following!.length
                                                      .toString(),
                                                  name: "Following"),
                                            ),
                                            const CustomVerticalDivider(
                                              height: 90,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
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
                                              child: ShowFollowNumbers(
                                                  data: data.follower!.length
                                                      .toString(),
                                                  name: "Follower"),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  data.username,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Here is my BIO ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ViewUserPosts(posts: data)
                  ],
                ),
              ),
            ),
        error: (e, r) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class ShowFollowNumbers extends StatelessWidget {
  final String data;
  final String name;

  const ShowFollowNumbers({super.key, required this.data, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77,
      child: Card(
        color: const Color(0xFFf2f2f2),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ProfileIcon(
                iconData: Icons.person,
              ),
              Flexible(
                  child: VerticalDivider(
                thickness: 2,
              )),
              ProfileIcon(
                iconData: Icons.person,
              ),
              Flexible(
                  child: VerticalDivider(
                thickness: 2,
              )),
              ProfileIcon(
                iconData: Icons.person,
              ),
              Flexible(
                  child: VerticalDivider(
                thickness: 2,
              )),
              ProfileIcon(
                iconData: Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  final IconData iconData;

  const ProfileIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Colors.blue,
    );
  }
}

class ViewUserPosts extends StatelessWidget {
  ViewUserPosts({Key? key, required this.posts}) : super(key: key);

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
                            builder: (context) => ViewPostList(
                                  index: index,
                                  myID: posts.id,
                                )),
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

class ViewPostList extends ConsumerWidget {
  ViewPostList({Key? key, required this.index, required this.myID})
      : super(key: key);

  final int index;

  ///Here we getting the current user Profile ID to pass this provider ['viewProfileControllerProvider']
  /// Since both json data of my profile and other user profile are same
  final String myID;

  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileRef = ref.watch(viewProfileControllerProvider(myID));
    return Scaffold(
        body: myProfileRef.when(
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
