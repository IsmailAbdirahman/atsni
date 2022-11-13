import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/controller/followingAndFollowers_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../home/controller/home_controller.dart';
import '../controller/profile_controller.dart';
import '../data/profile_service.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileControllerProvider);
    Color dividerColor = Colors.grey;
    return profileRef.when(
        data: (data) => Scaffold(
              backgroundColor: const Color(0xFFd7d8d9),
              appBar: AppBar(
                backgroundColor: const Color(0xff306088),
                title: Text(data.profile.username),
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
                    profileRef.when(
                        data: (data) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 210,
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
                                        const ProfilePhoto(),
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
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const FollowingAndFollowersListScreen()),
                                                      );
                                                    },
                                                    child: ShowFollowNumbers(
                                                        data: data.profile
                                                            .following.length
                                                            .toString(),
                                                        name: "Following"),
                                                  ),
                                                  const CustomVerticalDivider(
                                                    height: 90,
                                                  ),
                                                  ShowFollowNumbers(
                                                      data: data.profile
                                                          .follower.length
                                                          .toString(),
                                                      name: "Follower"),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 0.5,
                                                color: dividerColor,
                                              ),
                                              const EditProfile()
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
                                        data.profile.username,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Here's to the crazy once",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        error: (e, r) => Text(r.toString()),
                        loading: () => const CircularProgressIndicator()),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ViewProfile(),
                    ),
                    ViewUserPosts()
                  ],
                ),
              ),
            ),
        error: (e, r) => const Text('ss'),
        loading: () => const CircularProgressIndicator());
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

class FollowingAndFollowersListScreen extends ConsumerWidget {
  const FollowingAndFollowersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followRef = ref.watch(followControllerProvider);
    return Scaffold(
        body: followRef.when(
            data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(data[index].username);
                  },
                ),
            error: (error, r) => const Text('error'),
            loading: () => const CircularProgressIndicator()));
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
  ViewUserPosts({Key? key}) : super(key: key);

  final List<String> userPosts = [
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
    'assets/images/s1.jpg',
  ];

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
            itemCount: userPosts.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 90,
                width: 90,
                child: Card(
                  elevation: 2,
                  child: Image(
                    image: AssetImage(userPosts[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 90,
        width: 90,
        child: Image(
          image: AssetImage('assets/images/s1.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key, required this.height})
      : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const VerticalDivider(
        thickness: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Edit Your Profile',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        )
      ],
    );
  }
}
