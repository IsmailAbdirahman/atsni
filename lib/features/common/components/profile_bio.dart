import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({Key? key, required this.username, required this.bio})
      : super(key: key);
  final String username;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            bio,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
