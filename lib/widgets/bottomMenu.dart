import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomMenu extends StatefulWidget {
  PageController _pageController;
  int _selectedIndex;

  BottomMenu(this._pageController, this._selectedIndex);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            child: GNav(              
                gap: 4,
                activeColor: Colors.white,
                color: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.public,
                    text: 'Launches',
                  ),
                  GButton(
                    icon: Icons.home,
                    text: 'Search',
                  ),
                  GButton(icon: Icons.apps, text: 'Menu'),
                ],
                selectedIndex: widget._selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    widget._selectedIndex = index;
                  });
                  widget._pageController.jumpToPage(index);
                }),
          ),
        ),
      ),
    );
  }
}
