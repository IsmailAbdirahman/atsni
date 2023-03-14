import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/components/caption_username_widget.dart';
import 'package:oldinsa/features/common/components/image_widget.dart';
import 'package:oldinsa/features/common/components/like_unlike_widget.dart';
import 'package:oldinsa/features/common/components/post_author_widget.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';

import '../features/home/controller/home_controller.dart';
import '../features/profile/controller/myprofile_info_controller.dart';
import '../features/profile/presentation/shared_widegts/view_profile_tile.dart';

class PostTile extends ConsumerWidget {
  PostTile({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            PostAuthor(
              username: homeModel.author.username,
              profileImage: homeModel.author.image,
              onPressed: () async {
                await ref
                    .read(viewProfileControllerProvider(homeModel.author.id));

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProfileTile()),
                  );
                }
              },
            ),
            ImageWidget(
              postImage: homeModel.image,
            ),
            LikeUnlikeWidget(
                isLiked: homeModel.isLiked,
                totalLikes: homeModel.totalLikes,
                onPressed: () {
                  ref
                      .read(homeControllerProvider.notifier)
                      .likePost(homeModel.id);
                }),
            CaptionUsernameWidget(username: homeModel.author.username)
          ],
        ),
      ),
    );
  }
}
