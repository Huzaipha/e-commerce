// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:first/appColors/app_colors.dart';
import 'package:first/screens/homapage/home_page.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(title: ''),//0index
    Text(
      '2 Page',
      style: optionStyle,
    ),//1index
    Text(
      '3 Page',
      style: optionStyle,
    ),//3index
    Text(
      '4 Page',
      style: optionStyle,
    ),//4index
    Text(
      '5 Page',
      style: optionStyle,
    ),//5index
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        unselectedItemColor: AppColors.baseBlackColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.baseDarkPinkColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
