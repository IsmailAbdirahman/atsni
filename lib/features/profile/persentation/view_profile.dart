import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/profile_photo.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/view_profile_tile.dart';

import '../controller/view_profile_controller.dart';
import '../repository/profile_repository.dart';
import 'shared_widegts/custom_vertical_divider.dart';
import 'shared_widegts/show_follower_following_list_screen.dart';

class ViewMyProfile extends ConsumerWidget {
  const ViewMyProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(viewProfileControllerProvider);
    return profileRef.when(
        data: (data) => ViewProfileTile(data: data),
        error: (e, r) =>
            ElevatedButton(onPressed: () {
              ref.read(viewProfileControllerProvider.notifier).myProfile();
            }, child: Text(e.toString())),
        loading: () => const CircularProgressIndicator());
  }
}
