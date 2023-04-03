import 'package:flutter/material.dart';
import 'package:oldinsa/features/common/components/user_profile_widget.dart';

class PostAuthor extends StatelessWidget {
  const PostAuthor(
      {Key? key,
      required this.username,
       this.onPressed,
      required this.profileImage})
      : super(key: key);
  final String username;
  final String profileImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UserProfilePicture(profilePicture: profileImage),
          InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                username,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Color(0xFF306088)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
