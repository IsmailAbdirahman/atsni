import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                color: const Color(0xFFf2f2f2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 90,
                                            width: 90,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/s1.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 131,
                                          child: VerticalDivider(
                                            thickness: 0.5,
                                            color: dividerColor,
                                          ),
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
                                                  SizedBox(
                                                    height: 90,
                                                    child: VerticalDivider(
                                                      thickness: 0.5,
                                                      color: dividerColor,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: ShowFollowNumbers(
                                                        data: data.profile
                                                            .following.length
                                                            .toString(),
                                                        name: "Following"),
                                                  ),
                                                  SizedBox(
                                                    height: 90,
                                                    child: VerticalDivider(
                                                      thickness: 0.5,
                                                      color: dividerColor,
                                                    ),
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text(
                                                    'Edit Your Profile',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 19),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                              ),
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
  final ProfileModel data;

  const FollowingAndFollowersListScreen({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [Text(data.username)],
      ),
    );
  }
}
