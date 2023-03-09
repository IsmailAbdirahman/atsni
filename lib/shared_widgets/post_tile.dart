import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/view_profile_tile.dart';

import '../features/home/controller/home_controller.dart';
import '../features/profile/controller/view_profile_controller.dart';

class PostTile extends ConsumerWidget {
  PostTile(
      {super.key,
      required this.username,
      required this.caption,
      required this.postImage,
      required this.likes,
      required this.profileImage,
      required this.userID,
      required this.postId});

  final String userID;
  final String postId;
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;
  final List likes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myID = ref.watch(viewProfileControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: NetworkImage(profileImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await ref
                          .read(viewProfileControllerProvider.notifier)
                          .viewUserProfile(userID);

                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewProfileTile()),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        username,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF306088)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image(
                image: NetworkImage(postImage),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 0.0),
              child: Row(
                children: [
                  likes.contains(myID.value?.id) == true
                      ? IconButton(
                          onPressed: () {
                            ref
                                .read(homeControllerProvider.notifier)
                                .likePost(postId);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            ref
                                .read(homeControllerProvider.notifier)
                                .likePost(postId);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${likes.length.toString()} likes',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF306088)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Wrap(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.comment_bank,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF306088)),
                    ),
                  ),
                  // Text(caption)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
