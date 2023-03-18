import 'package:flutter/material.dart';
import 'package:oldinsa/features/common/components/caption_username_widget.dart';
import 'package:oldinsa/features/common/components/image_widget.dart';
import 'package:oldinsa/features/common/components/like_unlike_widget.dart';
import 'package:oldinsa/features/common/components/post_author_widget.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

class MyPostTile extends StatelessWidget {
  const MyPostTile(
      {Key? key, required this.profileModel, required this.postsModel})
      : super(key: key);
  final ProfileModel profileModel;
  final PostsModel postsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            PostAuthor(
              username: profileModel.username,
              profileImage: profileModel.image!,
            ),
            ImageWidget(
              postImage: postsModel.image,
            ),
            LikeUnlikeWidget(
              isLiked: profileModel.isLiked,
              totalLikes: profileModel.totalLikes,
            ),
            CaptionUsernameWidget(username: profileModel.username)
          ],
        ),
      ),
    );
  }
}
