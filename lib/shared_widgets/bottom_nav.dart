import 'package:flutter/material.dart';
import 'package:oldinsa/login/persentation/login_screen.dart';
import 'package:oldinsa/register/persentation/register_screen.dart';
import 'package:oldinsa/shared_widgets/custom_bottom_nav.dart';

import '../home/perserntation/home_screen.dart';

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
    RegisterScreen(),
    LoginScreen(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: Colors.black,
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
