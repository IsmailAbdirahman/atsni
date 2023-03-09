import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

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
    print("-i-i-i-i-i-i-i-i-i-i-     $userID");
    final viewProfileRef = ref.watch(viewProfileControllerProvider);

    return viewProfileRef.when(
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
            return EditMyProfile(
                myProfile: data,
                usernameController:
                    TextEditingController(text: data.username),
                emailController:
                    TextEditingController(text: data.email));
          }
        },
        error: (e, r) => const Text('er'),
        loading: () => const CircularProgressIndicator());
  }
}

class EditMyProfile extends ConsumerWidget {
  EditMyProfile(
      {Key? key,
      required this.myProfile,
      required this.usernameController,
      required this.emailController})
      : super(key: key);
  final ProfileModel myProfile;
  TextEditingController usernameController;
  TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          usernameController =
              TextEditingController(text: myProfile.username);
          emailController =
              TextEditingController(text: myProfile.email);
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
                          .read(viewProfileControllerProvider.notifier)
                          .editMyProfile(
                            username: usernameController.text,
                          );
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
}
