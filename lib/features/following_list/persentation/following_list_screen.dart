
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/presentation/shared_widegts/view_profile_tile.dart';

import '../controller/following_list_controller.dart';
import '../../profile/controller/myprofile_info_controller.dart';

class ViewFollowingListScreen extends ConsumerStatefulWidget {
  final String userID;

  const ViewFollowingListScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  ShowFollowingState createState() => ShowFollowingState();
}

class ShowFollowingState extends ConsumerState<ViewFollowingListScreen> {


  @override
  Widget build(BuildContext context) {
    final followingListRef =
        ref.watch(followingListControllerProvider(widget.userID));

    return Scaffold(
        body: followingListRef.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        ref.read(viewProfileControllerProvider(data[index].id));

                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewProfileTile()),
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
                                              widget.userID)
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
                  child: Text(e.toString()),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
