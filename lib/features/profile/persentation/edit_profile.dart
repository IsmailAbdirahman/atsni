import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/edit_profile.dart';
import '../controller/following_list_controller.dart';
import '../controller/view_profile_controller.dart';

class EditProfile extends ConsumerWidget {
  EditProfile({Key? key, required this.userID}) : super(key: key);
  final String userID;
  late TextEditingController usernameController;

  late TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ddRef = ref.watch(viewProfileControllerProvider);

    return ddRef.when(
        data: (data) {
          if (data.status != null) {
            return ElevatedButton(
                onPressed: () {
                  ref
                      .read(viewProfileControllerProvider.notifier)
                      .followUserFromProfile(userID);
                },
                child: Text(data.status!));
          } else {
            return ElevatedButton(
                onPressed: () {
                  usernameController =
                      TextEditingController(text: data.profile.username);
                  emailController =
                      TextEditingController(text: data.profile.email);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(child: Text('Update')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Save'),
                            onPressed: () {
                              ref
                                  .read(editProfileControllerProvider.notifier)
                                  .editMyProfile(
                                      username: usernameController.text,
                                      password: emailController.text);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Edit Profile"));
          }
        },
        error: (e, r) => const Text('er'),
        loading: () => const CircularProgressIndicator());
  }
}
