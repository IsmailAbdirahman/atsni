import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/persentation/shared_widegts/view_profile_tile.dart';

import '../../controller/view_profile_controller.dart';
import '../view_profile.dart';

class ShowAllFollowers extends ConsumerWidget {
  final List<ProfileModel> data;

  ShowAllFollowers(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ddRef = ref.watch(viewControllerProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () async {
                final result = await ref
                    .read(viewControllerProvider.notifier)
                    .viewUserProfile(data[index].id);

                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewProfileTile(data: result)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Text(data[index].username),
              ));
        },
      ),
    );
  }
}
