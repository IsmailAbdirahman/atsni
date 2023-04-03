import 'package:flutter/material.dart';

class LikeUnlikeWidget extends StatelessWidget {
  const LikeUnlikeWidget(
      {Key? key,
      required this.isLiked,
      required this.totalLikes,
       this.onPressed})
      : super(key: key);

  final bool isLiked;
  final int totalLikes;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isLiked == true
            ? InkWell(
                onTap: onPressed,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              )
            : InkWell(
                onTap: onPressed,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.redAccent,
                ),
              ),
        Text(
          '${totalLikes.toString()} likes',
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: Color(0xFF306088)),
        ),
      ],
    );
  }
}
