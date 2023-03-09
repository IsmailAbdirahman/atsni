import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/view_profile_tile.dart';

import '../../controller/following_list_controller.dart';
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
    final followingListRef =
        ref.watch(followingListControllerProvider(widget.userProfileID));

    return Scaffold(
        body: followingListRef.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        final result = await ref
                            .read(viewProfileControllerProvider.notifier)
                            .viewUserProfile(data[index].id);

                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ViewProfileTile()),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data[index].username),
                            ElevatedButton(
                                onPressed: () async {
                                  ref
                                      .read(followingListControllerProvider(
                                              widget.userProfileID)
                                          .notifier)
                                      .followUserFromList(data[index].id);
                                },
                                child: Text(data[index].status!))
                          ],
                        ),
                      ));
                },
              );
            },
            error: (e, r) => Padding(
              padding: const EdgeInsets.all(28.0),
              child:  Text(e.toString()),
            ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
