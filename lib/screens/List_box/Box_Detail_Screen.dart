import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../BottomNavigation_Screen/Home_Screen.dart';

class BoxDetailScreen extends StatefulWidget {
  final String boxName;

  const BoxDetailScreen({
    required this.boxName,
  });

  @override
  _BoxDetailScreenState createState() => _BoxDetailScreenState();
}

class _BoxDetailScreenState extends State<BoxDetailScreen> {
  List<String> tasks = [];
  List<bool> taskCompletionStatus = [];
  double progress = 0.0;

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      taskCompletionStatus.add(false); // Add a new status for the new task
      updateProgress();
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      taskCompletionStatus.removeAt(index);
      updateProgress();
    });
  }

  void updateProgress() {
    setState(() {
      int completedCount =
          taskCompletionStatus.where((completed) => completed).length;
      progress = tasks.isEmpty ? 0.0 : completedCount / tasks.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212832),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ImageIcon(
              color: Colors.white,
              AssetImage("assets/Icon/edit.png"),
            ),
          ),
        ],
        title: Text(
          'Task Details',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.boxName,
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 47,
                            width: 47,
                            color: Color(0xffFED36A),
                          ),
                          ImageIcon(
                            AssetImage("assets/Icon/calendar.png"),
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Due Date",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Color(0xff8CAAB9),
                            ),
                          ),
                          Text(
                            "20 June",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 0),
                Expanded(
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 47,
                            width: 47,
                            color: Color(0xffFED36A),
                          ),
                          ImageIcon(
                            AssetImage("assets/Icon/usertag.png"),
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Team",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Color(0xff8CAAB9),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 1.png'),
                                radius: 10,
                              ),
                              SizedBox(width: 1),
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 2.png'),
                                radius: 10,
                              ),
                              SizedBox(width: 1),
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 3.png'),
                                radius: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Project Details",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 9),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xffBCCFD8),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Project Progress",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                Spacer(),
                CircularPercentIndicator(
                  radius: 35,
                  lineWidth: 5.0,
                  percent: progress,
                  center: Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  progressColor: Color(0xffFED36A),
                  backgroundColor: Color(0xff2C4653),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "All Tasks",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 22),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      removeTask(index);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        height: 58,
                        width: 370,
                        color: Color(0xff455A64),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                tasks[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              color: Color(0xffFED36A),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                value: taskCompletionStatus[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    taskCompletionStatus[index] = value ?? false;
                                    updateProgress();
                                  });
                                },
                                activeColor: Color(0xffFED36A),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Container(
                width: 318,
                height: 57,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String newTask = "";
                        return AlertDialog(
                          title: Text(
                            'Add New Task',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          content: TextField(
                            onChanged: (value) {
                              newTask = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter task description',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (newTask.isNotEmpty) {
                                  addTask(newTask);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                'Add Task',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add Task',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xffFED36A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
