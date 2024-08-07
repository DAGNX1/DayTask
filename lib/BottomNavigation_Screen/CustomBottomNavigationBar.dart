import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff263238),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.yellow, // Color when item is selected
      unselectedItemColor: Color(0xff617D8A), // Color when item is unselected
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Icon/home2.png",
            color: selectedIndex == 0 ? Colors.yellow : Color(0xff617D8A),
            width: 24,
            height: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Icon/messages1.png",
            color: selectedIndex == 1 ? Colors.yellow : Color(0xff617D8A),
            width: 24,
            height: 24,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Color(0xffFED36A),
            ),
            child: Image.asset(
              "assets/Icon/add33.png",
              color: Colors.black,
              width: 24,
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Icon/calendar.png",
            color: selectedIndex == 3 ? Colors.yellow : Color(0xff617D8A),
            width: 24,
            height: 24,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Icon/notification1.png",
            color: selectedIndex == 4 ? Colors.yellow : Color(0xff617D8A),
            width: 24,
            height: 24,
          ),
          label: 'Notification',
        ),
      ],
    );
  }
}
