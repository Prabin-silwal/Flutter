import 'package:MeroDin/navbuttons/details.dart';
import 'package:flutter/material.dart';
import 'package:MeroDin/navbuttons/setting.dart';
import 'package:MeroDin/navbuttons/add.dart';
import 'package:MeroDin/navbuttons/homepage.dart';

import 'navbuttons/profile.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [Homepage(), Details(), Add(), Profile(), Setting()];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('You are about to Exit'),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          selectedFontSize: 20,
          selectedLabelStyle: TextStyle(fontSize: 0),
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.white : Colors.red),
              label: 'Home',
              backgroundColor: (Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.details,
                  color: _selectedIndex == 1 ? Colors.white : Colors.red),
              label: 'Details',
              backgroundColor: (Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: _selectedIndex == 2 ? Colors.white : Colors.red,
              ),
              label: 'Add',
              backgroundColor: (Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3 ? Colors.white : Colors.red),
              label: 'Profile',
              backgroundColor: (Colors.black),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: _selectedIndex == 4 ? Colors.white : Colors.red),
              label: 'Setting',
              backgroundColor: (Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
