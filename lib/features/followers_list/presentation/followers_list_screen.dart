import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/followers_list/controller/followers_list_controller.dart';

class FollowersListScreen extends ConsumerWidget {
  const FollowersListScreen({Key? key, required this.userID}) : super(key: key);
  final String userID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followersListRef = ref.watch(followersListControllerProvider(userID));
    return Scaffold(
      body: Column(
        children: [
          followersListRef.when(
              data: (data) => Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].username),
                                ElevatedButton(
                                    onPressed: () {
                                      ref
                                          .read(followersListControllerProvider(
                                                  userID)
                                              .notifier)
                                          .followUserFromList(data[index].id);
                                    },
                                    child: Text(data[index].status!))
                              ],
                            ),
                          );
                        }),
                  ),
              error: (e, er) => Text(e.toString()),
              loading: () => const CircularProgressIndicator())
        ],
      ),
    );
  }
}
