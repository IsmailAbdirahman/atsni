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
    return profileRef.when(
        data: (data) => Scaffold(
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
                    //Text("data")
                    profileRef.when(
                        data: (data) {
                          return Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Image(
                                      image: AssetImage('assets/images/s1.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ShowFollowNumbers(
                                      data: data.myPosts.length.toString(),
                                      name: 'Posts',
                                    ),
                                    const VerticalDivider(
                                      width: 10,
                                      color: Colors.red,
                                      thickness: 3,
                                    ),
                                    ShowFollowNumbers(
                                      data: data.profile.following.length
                                          .toString(),
                                      name: 'Following',
                                    ),
                                    const VerticalDivider(
                                      width: 10,
                                      color: Colors.red,
                                      thickness: 3,
                                    ),
                                    ShowFollowNumbers(
                                      data: data.profile.follower.length
                                          .toString(),
                                      name: 'Followers',
                                    )
                                  ],
                                ),
                              ],
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
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            data,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
          ),
        ),
        Text(name)
      ],
    );
  }
}
