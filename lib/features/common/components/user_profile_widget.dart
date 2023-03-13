import 'package:flutter/material.dart';

class UserProfilePicture extends StatelessWidget {
  const UserProfilePicture({Key? key, required this.profilePicture})
      : super(key: key);
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image(
        image: NetworkImage(profilePicture),
        fit: BoxFit.fill,
      ),
    );
  }
}
