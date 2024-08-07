import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../AuthProvider.dart';
import '../screens/Calendar_Screens/Calendar_Screen.dart';
import '../screens/List_box/box_builder.dart';
import 'Add_Screen.dart';
import 'Chat_Screen.dart';
import 'CustomBottomNavigationBar.dart';
import 'Notification_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AddScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CalendarScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NotificationScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff212832),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: GoogleFonts.inter(
                color: Color(0xffFED36A),
                fontSize: 12,
              ),
            ),
            Text(
              'Fazil Laghari',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Profile");
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/Image/Rectangle 6.png"),
              radius: 20,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Container(
                  width: 311,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Color(0xFF455A64),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search tasks',
                      hintStyle: TextStyle(color: Color(0xFF6F8793)),
                      prefixIcon: Icon(
                        size: 30,
                        Icons.search,
                        color: Color(0xFF6F8793),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 58,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      // وظيفة زر الفلتر
                      print('Filter button pressed');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(Color(0xFFFED36A)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                    ),
                    child: Icon(Icons.filter_list_sharp, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34),
            Row(
              children: [
                Text(
                  'Completed Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 170),
                Text(
                  'See all',
                  style: TextStyle(color: Color(0xffFED36A), fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 175,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buildBoxes1(5, context).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: buildBoxes1(5, context)[index],
                  );
                },
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Ongoing Projects',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 170),
                Text(
                  'See all',
                  style: TextStyle(color: Color(0xffFED36A), fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: buildBoxes2(5, context).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: buildBoxes2(5, context)[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
