import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      bottomNavigationBar: Theme(
        data: ThemeData(
          disabledColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          visualDensity: VisualDensity(horizontal: 2, vertical: 2),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("icons/icon1.png"),
                color: _selectedIndex == 0 ? Colors.blue[400] : Colors.grey,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.blue[400] : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                 AssetImage("icons/icon2.png"),
                color: _selectedIndex == 1 ? Colors.blue[400] : Colors.grey,
              ),
              title: Text(
                'Photo',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.blue[400] : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
