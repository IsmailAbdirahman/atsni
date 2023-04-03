import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/presentation/shared_widegts/view_profile_tile.dart';

import '../controller/myprofile_info_controller.dart';
import '../repository/profile_repository.dart';
import 'shared_widegts/custom_vertical_divider.dart';

class ViewMyProfile extends ConsumerWidget {
  const ViewMyProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(myProfileInfoControllerProvider);
    return profileRef.when(
        data: (data) => const ViewProfileTile(),
        error: (e, r) => ElevatedButton(
            onPressed: () {
              ref.read(myProfileInfoControllerProvider.notifier).myProfile();
            },
            child: Text(e.toString())),
        loading: () => const CircularProgressIndicator());
  }
}
