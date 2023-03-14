import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/followers_list/presentation/followers_list_screen.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/presentation/shared_widegts/custom_vertical_divider.dart';
import 'package:oldinsa/features/profile/presentation/shared_widegts/profile_photo.dart';
import 'package:oldinsa/shared_widgets/post_tile.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../following_list/persentation/view_following_list_screen.dart';

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
                                            GestureDetector(
                                              onTap: () {
                                                if (context.mounted) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewFollowingListScreen(
                                                              userProfileID:
                                                                  data.id,
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
                                        ElevatedButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      viewProfileControllerProvider(
                                                              data.id)
                                                          .notifier)
                                                  .followUserFromProfile(
                                                      data.id);
                                            },
                                            child: data.status != null
                                                ? Text(data.status!)
                                                : const Text(
                                                    'Viewed own Profile!'))
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ViewProfile(),
                    ),
                    ViewUserPosts(posts: data)
                  ],
                ),
              ),
            ),
        error: (e, r) => Text(e.toString()),
        loading: () => const Scaffold(
              body: CircularProgressIndicator(),
            ));
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

  // final List<String> userPosts = [
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  //   'assets/images/s1.jpg',
  // ];

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
                                  profile: posts,
                                  index: index,
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

class ViewPostList extends StatefulWidget {
  const ViewPostList({Key? key, required this.profile, required this.index})
      : super(key: key);

  final ProfileModel profile;
  final int index;

  @override
  State<ViewPostList> createState() => _ViewPostListState();
}

class _ViewPostListState extends State<ViewPostList> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollablePositionedList.builder(
          initialScrollIndex: widget.index,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: widget.profile.myPosts.length,
          itemBuilder: (BuildContext context, int index) {
            // return PostTile(
            //   totalLikes: 0,
            //   isLiked: false,
            //   username: widget.profile.username,
            //   userID: widget.profile.id,
            //   profileImage: widget.profile.image!,
            //   postId: widget.profile.myPosts[index].id,
            //   postImage: widget.profile.myPosts[index].image,
            //   caption: widget.profile.myPosts[index].caption,
            //   likes: widget.profile.myPosts[index].likes,
            // );
            return Text("TO DO");
          }),
    );
  }
}
