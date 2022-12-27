import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key, required this.height})
      : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const VerticalDivider(
        thickness: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
