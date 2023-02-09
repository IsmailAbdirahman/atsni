import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/login/persentation/login_screen.dart';
import 'package:oldinsa/shared_widgets/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/controller/login_controller.dart';
import 'features/login/service/shared_pref.dart';
import 'features/profile/persentation/view_profile.dart';
import 'package:image_picker/image_picker.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

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
      home:const  Wrapper(),
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
//
// class ButtomNavCustom extends StatefulWidget {
//   ButtomNavCustom({Key? key}) : super(key: key);
//
//   @override
//   State<ButtomNavCustom> createState() => _ButtomNavCustomState();
// }
//
// class _ButtomNavCustomState extends State<ButtomNavCustom> {
//   int selectedIndex = 0;
//
//   List<IconData> buttons = [
//     Icons.home,
//     Icons.search,
//     Icons.camera_alt_outlined,
//     Icons.notification_add_outlined,
//     Icons.person,
//   ];
//
//   Widget detectClickedIcon(int index) {
//     return GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         child: SizedBox(
//           height: 65,
//           width: 65,
//           child: Card(
//             shadowColor: Colors.blue[900],
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             color: selectedIndex == index ? Colors.white : Colors.grey[200],
//             elevation: selectedIndex == index ? 8: 0,
//             child: Icon(buttons[index]),
//           ),
//         ));
//   }
//
//   Widget cccc() {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: buttons
//             .asMap()
//             .entries
//             .map((singleType) => detectClickedIcon(singleType.key))
//             .toList());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Align(
//           alignment: Alignment.bottomCenter,
//           child: SizedBox(
//             height: 70,
//             child: Card(
//               color: Colors.white,
//               child: cccc(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
