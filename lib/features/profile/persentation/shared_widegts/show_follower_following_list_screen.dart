import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/view_profile_tile.dart';

import '../../controller/follow_and_unfollow_controller.dart';
import '../../controller/follower_following_controller.dart';
import '../../controller/view_profile_controller.dart';
import '../view_profile.dart';

class ShowFollowing extends ConsumerStatefulWidget {
  final String userProfileID;

  const ShowFollowing({Key? key, required this.userProfileID})
      : super(key: key);

  @override
  ShowFollowingState createState() => ShowFollowingState();
}

class ShowFollowingState extends ConsumerState<ShowFollowing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final followFollowingRef = ref.watch(followingFollowerControllerProvider);
    return Scaffold(
        body: followFollowingRef.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        final result = await ref
                            .read(viewControllerProvider.notifier)
                            .viewUserProfile(data[index].id);

                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewProfileTile(data: result)),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: Row(
                          children: [
                            Text(data[index].username),
                            ElevatedButton(
                                onPressed: () async {
                                  await ref
                                      .read(followUndFollowProvider.notifier)
                                      .followUser(data[index].id);
                                  ref.refresh(followUndFollowProvider);
                                },
                                child: Text(data[index].status!))
                          ],
                        ),
                      ));
                },
              );
            },
            error: (e, r) => const Text('error'),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
