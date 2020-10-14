import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_polad/ui/home_page.dart';
import 'package:general_polad/ui/photos_page.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomePage(),
    PhotosPage(),
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.deepPurple[400] : Colors.grey,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color:
                    _selectedIndex == 0 ? Colors.deepPurple[400] : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _selectedIndex == 1 ? Colors.deepPurple[400] : Colors.grey,
            ),
            title: Text(
              'Search',
              style: TextStyle(
                color:
                    _selectedIndex == 1 ? Colors.deepPurple[400] : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
