import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/controller/home_controller.dart';
import '../controller/profile_controller.dart';
import '../data/profile_service.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(profileControllerProvider);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            //Text("data")
            profileRef.when(
                data: (data) {
                  return Card(
                    child: Column(children: [
                      Text('Username: ${data.username}'),
                      // Text('Folowers Count: ${data.follower.length}'),
                      // Text('Following Count: ${data.following.length}'),
                      // Text('LikedPosts Count: ${data.likedPosts.length}'),
                    ]),
                  );
                },
                error: (e, r) => Text(r.toString()),
                loading: () => const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
