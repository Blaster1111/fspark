import 'package:flutter/material.dart';
import 'package:fspark_task/constants/colors.dart';
import 'package:fspark_task/model/message.model.dart';
import 'package:fspark_task/screens/home_screen.dart';
import 'package:fspark_task/screens/profile_screen.dart';
import 'package:fspark_task/screens/statistics_screen.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:iconify_flutter/icons/ph.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ChatScreen(),
    StatisticsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundolor,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: primaryColor, fontSize: 14);
            }
            return TextStyle(color: Colors.grey, fontSize: 14);
          }),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: NavigationBar(
            height: 65.0,
            elevation: 20.0,
            backgroundColor: white,
            surfaceTintColor: white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationDestination(
                icon: Iconify(Carbon.home,
                    color: _selectedIndex == 0 ? primaryColor : Colors.grey),
                label: "Home",
              ),
              NavigationDestination(
                icon: Iconify(Ph.chat_circle_dots_thin,
                    color: _selectedIndex == 1 ? primaryColor : Colors.grey),
                label: "Chat",
              ),
              NavigationDestination(
                icon: Iconify(Jam.messages,
                    color: _selectedIndex == 2 ? primaryColor : Colors.grey),
                label: "Statistics",
              ),
              NavigationDestination(
                icon: Iconify(Gg.profile,
                    color: _selectedIndex == 3 ? primaryColor : Colors.grey),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
