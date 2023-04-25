import 'package:flutter/material.dart';

class CaptionUsernameWidget extends StatelessWidget {
  const CaptionUsernameWidget(
      {Key? key, required this.username, required this.caption})
      : super(key: key);

  final String username;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Row(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.comment_bank,
          size: 16,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            username,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Color(0xFF306088)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(caption),
        ),
        // Text(caption)
      ],
    );
  }
}
