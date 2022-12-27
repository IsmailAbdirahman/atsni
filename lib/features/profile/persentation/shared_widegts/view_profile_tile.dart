import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/profile_photo.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/show_follower_following_list_screen.dart';

import '../../controller/edit_profile.dart';
import '../../controller/view_profile_controller.dart';
import '../../domain/profileModel.dart';
import 'custom_vertical_divider.dart';

class ViewProfileTile extends ConsumerWidget {
  final MyProfile data;

  const ViewProfileTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color dividerColor = Colors.grey;

    return Scaffold(
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
                                        data: data.posts.length.toString(),
                                        name: "Posts"),
                                    const CustomVerticalDivider(
                                      height: 90,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(
                                                viewControllerProvider.notifier)
                                            .getAllFollowing(data.profile.id)
                                            .then((value) {
                                          if (!context.mounted) return;
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowAllFollowers(value)),
                                          );
                                        });
                                      },
                                      child: ShowFollowNumbers(
                                          data: data.profile.following.length
                                              .toString(),
                                          name: "Following"),
                                    ),
                                    const CustomVerticalDivider(
                                      height: 90,
                                    ),
                                    ShowFollowNumbers(
                                        data: data.profile.follower.length
                                            .toString(),
                                        name: "Follower"),
                                  ],
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: dividerColor,
                                ),
                                EditProfile(userID: data.profile.id)
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
                              fontWeight: FontWeight.w700, fontSize: 19),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Here is my BIO ",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
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
            ViewUserPosts()
          ],
        ),
      ),
    );
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

class EditProfile extends ConsumerWidget {
  EditProfile({Key? key, required this.userID}) : super(key: key);
  final String userID;
  late TextEditingController usernameController;

  late TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ddRef = ref.watch(viewControllerProvider);

    return ddRef.when(
        data: (data) {
          if (data.status != null) {
            return ElevatedButton(
                onPressed: () {
                  ref.read(viewControllerProvider.notifier).followUser(userID);
                },
                child: Text(data.status!));
          } else {
            return ElevatedButton(
                onPressed: () {
                  usernameController =
                      TextEditingController(text: data.profile.username);
                  emailController =
                      TextEditingController(text: data.profile.email);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Update')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Save'),
                            onPressed: () {
                              ref
                                  .read(editProfileControllerProvider.notifier)
                                  .editMyProfile(
                                      username: usernameController.text,
                                      password: emailController.text);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Edit Profile"));
          }
        },
        error: (e, r) => const Text('er'),
        loading: () => const CircularProgressIndicator());

    // return ddRef.when(
    //     data: (data) => ElevatedButton(
    //         onPressed: () {
    //           ref.read(viewControllerProvider.notifier).followUser(userID);
    //         },
    //         child: data.status != null
    //             ? Text(data.status!)
    //             : GestureDetector(
    //                 onTap: () {
    //                   usernameController =
    //                       TextEditingController(text: data.profile.username);
    //                   emailController =
    //                       TextEditingController(text: data.profile.email);
    //                   showDialog(
    //                     context: context,
    //                     builder: (BuildContext context) {
    //                       return AlertDialog(
    //                         title: const Text('Enter values'),
    //                         content: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           children: <Widget>[
    //                             TextFormField(
    //                               controller: usernameController,
    //                               decoration: const InputDecoration(
    //                                 labelText: 'Value 1',
    //                               ),
    //                               validator: (value) {
    //                                 if (value!.isEmpty) {
    //                                   return 'Please enter a value';
    //                                 }
    //                                 return null;
    //                               },
    //                             ),
    //                             TextFormField(
    //                               controller: emailController,
    //                               decoration: const InputDecoration(
    //                                 labelText: 'Value 2',
    //                               ),
    //                               validator: (value) {
    //                                 if (value!.isEmpty) {
    //                                   return 'Please enter a value';
    //                                 }
    //                                 return null;
    //                               },
    //                             ),
    //                           ],
    //                         ),
    //                         actions: <Widget>[
    //                           ElevatedButton(
    //                             child: const Text('Cancel'),
    //                             onPressed: () {
    //                               Navigator.of(context).pop();
    //                             },
    //                           ),
    //                           ElevatedButton(
    //                             child: const Text('Save'),
    //                             onPressed: () {
    //                               ref
    //                                   .read(editProfileControllerProvider
    //                                       .notifier)
    //                                   .editMyProfile(
    //                                       username: usernameController.text,
    //                                       password: emailController.text);
    //                               Navigator.of(context).pop();
    //                             },
    //                           ),
    //                         ],
    //                       );
    //                     },
    //                   );
    //                 },
    //                 child: const Text("Edit Profile"))),
    //     error: (e, r) => const Text('er'),
    //     loading: () => const CircularProgressIndicator());
  }
}
