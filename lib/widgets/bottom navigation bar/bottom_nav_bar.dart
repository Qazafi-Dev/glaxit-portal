import 'package:flutter/material.dart';
import 'package:glaxit_portal/ui/home/home_screen.dart';
import 'package:glaxit_portal/ui/my%20attendance/my_attendance.dart';
import 'package:glaxit_portal/ui/my%20leaves/my_leaves.dart';
import 'package:glaxit_portal/ui/my%20profile/my_profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState extends State {
  int _selectedTab = 0;

  List _pages = [
    const HomeScreen(),
    const MyAttendance(),
          MyLeaves(),
    const MyProfile(),


  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), label: "My Attendance"),
          BottomNavigationBarItem(
              icon: Icon(Icons.leave_bags_at_home), label: "My Leaves"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "My Profile"),
        ],
      ),
    );
  }
}