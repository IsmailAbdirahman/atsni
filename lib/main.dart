import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/login/persentation/login_screen.dart';
import 'package:oldinsa/shared_widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/controller/login_controller.dart';
import 'features/login/service/shared_pref.dart';
import 'features/profile/persentation/view_profile.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenProvider = ref.watch(futureTokenProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: tokenProvider.when(
                    data: (data) => data != null ? BottomNav() : LoginScreen(),
                    error: (e, ee) => const Text('something went wrong'),
                    loading: () => const CircularProgressIndicator()))
          ],
        ),
      ),
    );
  }
}

