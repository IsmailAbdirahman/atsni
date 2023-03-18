import 'package:flutter/material.dart';
import 'package:oldinsa/features/home/presentation/home_screen.dart';
import 'package:oldinsa/features/common/presentation/custom_bottom_nav.dart';

import '../../new_post/presentation/new_post_screen.dart';
import '../../profile/presentation/view_profile.dart';
import '../../search/presentation/presentation.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const SearchScreen(),
    const NewPostScreen(),
    const Text('Notifications'),
    const ViewMyProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index:_selectedIndex ,
        children: _widgetOptions,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: const Color(0xff1e2225),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 45,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              size: 50,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              size: 50,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle_notifications_sharp,
              size: 50,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(
              Icons.credit_card_rounded,
              size: 50,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
