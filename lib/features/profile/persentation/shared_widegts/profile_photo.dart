import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/view_profile_controller.dart';
import '../../domain/profileModel.dart';






class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 90,
        width: 90,
        child: Image(
          image: AssetImage('assets/images/s1.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}