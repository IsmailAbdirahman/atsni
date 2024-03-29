import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/common/presentation/view_profile_info.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/search/controller/search_controller.dart';

import '../../profile/controller/myprofile_info_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRef = ref.watch(searchControllerProvider);
    TextEditingController usernameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search)),
              onChanged: (username) {
                ref
                    .read(searchControllerProvider.notifier)
                    .getUserNames(username);
              },
            ),
            searchRef.when(
                data: (data) => Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              await ref.read(viewProfileControllerProvider(
                                  data[index].id));

                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProfileInfo(
                                          userProfileID: data[index].id)),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image: NetworkImage(data[index].image!)),
                                ),
                                Text(data[index].username),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                error: (e, r) => const Text('Something Went Wrong'),
                loading: () => const Center(child: Text('')))
          ],
        ),
      ),
    );
  }
}
