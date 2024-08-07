import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../BottomNavigation_Screen/Add_Screen.dart';
import '../../BottomNavigation_Screen/CustomBottomNavigationBar.dart';
import '../../BottomNavigation_Screen/Home_Screen.dart';
import '../../BottomNavigation_Screen/Chat_Screen.dart';
import '../../BottomNavigation_Screen/Notification_Screen.dart';
import 'Create_New_Task.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final screens = [
      HomeScreen(),
      ChatScreen(),
      AddScreen(),
      CalendarScreen(),
      NotificationScreen()
    ];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  final List<Map<String, dynamic>> tasks = [
    {"title": "Task 1", "time": "16:00 - 18:30", "completed": true},
    {"title": "Task 2", "time": "16:00 - 18:30", "completed": false},
    {"title": "Task 3", "time": "16:00 - 18:30", "completed": true},
    {"title": "Task 4", "time": "16:00 - 18:30", "completed": false},
    {"title": "Task 5", "time": "16:00 - 18:30", "completed": true},
  ];

  @override
  Widget build(BuildContext context) {
    // ترتيب المهام: المكتملة أولاً، ثم غير المكتملة
    final sortedTasks = List<Map<String, dynamic>>.from(tasks)
      ..sort(
          (a, b) => (b["completed"] ? 1 : 0).compareTo(a["completed"] ? 1 : 0));

    Widget buildTaskContainer(
        String title, String time, bool completed, List<String> images) {
      return Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: 370,
            height: 72,
            color: completed ? Color(0xffFED36A) : Color(0xff263238),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                            color: completed ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        time,
                        style: GoogleFonts.inter(
                            color: completed ? Colors.black : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Spacer(),
                  ...images
                      .map((image) => Container(
                            decoration: BoxDecoration(
                              border: completed
                                  ? Border.all(color: Colors.black, width: 1)
                                  : null,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(image),
                              radius: 10,
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
          Container(
            height: 72,
            width: 11,
            color: Color(0xffFED36A),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffbac212832),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: IconButton(
              icon: Image.asset("assets/Icon/add33.png"),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateNewTask()), // استبدل بـ الشاشة المراد الانتقال إليها
                );
              },
            ),
          ),
        ],
        title: const Text(
          'Schedule',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              // `selectedDate` هو التاريخ الجديد المختار
            },
            activeColor: const Color(0xffFED36A),
            dayProps: const EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.withBackground,
              todayHighlightColor: Color(0xffE1ECC8),
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today’s Tasks",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 26),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sortedTasks.length,
                      itemBuilder: (context, index) {
                        final task = sortedTasks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: buildTaskContainer(
                            task["title"],
                            task["time"],
                            task["completed"],
                            [
                              'assets/Image/Ellipse 1.png',
                              'assets/Image/Ellipse 2.png',
                              'assets/Image/Ellipse 3.png'
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
