import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/controller/myprofile_info_controller.dart';
import '../../profile/domain/profileModel.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 90,
        width: 90,
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
