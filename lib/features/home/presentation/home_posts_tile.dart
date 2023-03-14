import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/components/caption_username_widget.dart';
import 'package:oldinsa/features/common/components/image_widget.dart';
import 'package:oldinsa/features/common/components/like_unlike_widget.dart';
import 'package:oldinsa/features/common/components/post_author_widget.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/common/presentation/view_profile_info.dart';
import 'package:oldinsa/features/home/controller/home_controller.dart';
import 'package:oldinsa/features/home/domain/home_model.dart';
import 'package:oldinsa/features/profile/controller/myprofile_info_controller.dart';


class HomePostsTile extends ConsumerWidget {
  const HomePostsTile({Key? key, required this.homeModel}) : super(key: key);
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
                ref.read(viewProfileControllerProvider(homeModel.author.id));

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProfileInfo(
                            userProfileID: homeModel.author.id)),
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
