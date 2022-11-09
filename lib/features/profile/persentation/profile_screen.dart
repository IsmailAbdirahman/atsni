import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/controller/home_controller.dart';
import '../data/profile_service.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileRef = ref.watch(futureprofileServiceProvider);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
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
                error: (e, r) => Text(e.toString()),
                loading: () => const CircularProgressIndicator()),
            GestureDetector(
                onDoubleTap: () async {
                  await ref
                      .read(homeControllerProvider.notifier)
                      .likePost('635b71a950b0e6af3969d390');
                  ref.refresh(futureprofileServiceProvider);
                },
                child: const Icon(
                  Icons.favorite,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }
}
