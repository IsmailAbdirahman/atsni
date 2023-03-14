
import 'dart:io';

import 'package:flutter/material.dart';

class PreviewSelectedImage extends StatelessWidget {
  final File image;

  const PreviewSelectedImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Image.file(image),
    );
  }
}
