import 'package:flutter/material.dart';

class ShowFollowNumbers extends StatelessWidget {
  final String data;
  final String name;
  final VoidCallback? onPressed;

  const ShowFollowNumbers(
      {super.key, required this.data, required this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
