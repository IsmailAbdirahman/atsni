import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/controllers/view_profile_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../controller/myprofile_info_controller.dart';

class FollowButton extends ConsumerWidget {
  FollowButton({Key? key, required this.userID}) : super(key: key);
  final String userID;
  late TextEditingController usernameController;

  late TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewProfileRef = ref.watch(viewProfileControllerProvider(userID));

    return viewProfileRef.when(
        data: (data) {
          if (data.status != null) {
            return ElevatedButton(
                onPressed: () {
                  ref
                      .read(viewProfileControllerProvider(data.id).notifier)
                      .followUserFromProfile(data.id);
                },
                child: Text(data.status!));
          } else {
            return EditMyProfile(
                myProfile: data,
                usernameController: TextEditingController(text: data.username),
                emailController: TextEditingController(text: data.email));
          }
        },
        error: (e, r) => const Text('er'),
        loading: () => const Center(child: CircularProgressIndicator()));
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
          usernameController = TextEditingController(text: myProfile.username);
          emailController = TextEditingController(text: myProfile.email);
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
                          .read(myProfileInfoControllerProvider.notifier)
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
