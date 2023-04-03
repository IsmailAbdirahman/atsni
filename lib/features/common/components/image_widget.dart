import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.postImage}) : super(key: key);
  final String postImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Image(
        image: NetworkImage(postImage),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
