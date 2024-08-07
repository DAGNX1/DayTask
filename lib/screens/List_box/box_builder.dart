import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'Box_Detail_Screen.dart';

List<Widget> buildBoxes1(int count, BuildContext context) {
  List<String> titles = [
    'Real Estate Website Design',
    'Finance Mobile App Design',
    'Dashboard & App Design',
    'Database Schema',
    'Marketing Strategy'
  ];

  return List.generate(count, (index) {
    // تأكد من عدم تجاوز الفهرس لعدد العناصر المتاحة في العناوين
    String title = index < titles.length ? titles[index] : 'Task ${index + 1}';

    // تحديد اللون بناءً على الفهرس
    Color textColor = index == 0 ? Colors.black : Colors.white;
    Color completedColor = index == 0 ? Colors.black : Colors.white;
    Color progressBarColor = index == 0 ? Colors.black : Colors.white;

    return Container(
      width: 183,
      height: 175,
      color: index == 0 ? Color(0xffFED36A) : Color(0xff455A64),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5), // مساحة صغيرة بين النصوص والصور
            Row(
              children: [
                Text(
                  'Team members',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 5), // مساحة صغيرة بين النصوص والصور
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/Image/Ellipse 1.png'),
                      radius: 10,
                    ),
                    SizedBox(width: 1),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/Image/Ellipse 2.png'),
                      radius: 10,
                    ),
                    SizedBox(width: 1),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/Image/Ellipse 3.png'),
                      radius: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Completed',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  '100%',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              width: 163,
              height: 6,
              decoration: BoxDecoration(
                color: progressBarColor.withOpacity(1), // لون الشريط
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

List<Widget> buildBoxes2(int count, BuildContext context) {
  List<String> titles = [
    'Mobile App Wireframe',
    'Real Estate App Design',
    'Dashboard & App Design',
    'Database Schema',
    'Marketing Strategy'
  ];
  return List.generate(count, (index) {
    String dueDate = _getDueDate(index);
    double progress = (index + 1) /
        count; // نسبة مئوية للتقدم (مثلاً، كل عنصر لديه تقدم متزايد)

    // تأكد من عدم تجاوز الفهرس لعدد العناصر المتاحة في العناوين
    String title = index < titles.length ? titles[index] : 'Task ${index + 1}';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BoxDetailScreen(boxName: title),
          ),
        );
      },
      child: Container(
        width: 183,
        height: 130,
        margin: const EdgeInsets.only(bottom: 10),
        color: const Color(0xff455A64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Team members',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 10),
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 1.png'),
                                radius: 10,
                              ),
                              SizedBox(width: 3), // مساحة صغيرة بين الصور
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 2.png'),
                                radius: 10,
                              ),
                              SizedBox(width: 3), // مساحة صغيرة بين الصور
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/Image/Ellipse 3.png'),
                                radius: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // مساحة صغيرة بين النصوص والصور
                          Text(
                            'Due on: $dueDate',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircularPercentIndicator(
                        radius: 35,
                        // نصف قطر الدائرة
                        lineWidth: 5.0,
                        // سمك الخط للدائرة
                        percent: progress,
                        // النسبة المئوية للتقدم
                        center: Text(
                          '${(progress * 100).toStringAsFixed(0)}%',
                          // عرض النسبة المئوية
                          style:
                          const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        progressColor: const Color(0xffFED36A),
                        // لون التقدم
                        backgroundColor: const Color(0xff2C4653), // لون الخلفية
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  });
}

String _getDueDate(int index) {
  DateTime dueDate = DateTime.now().add(
      Duration(days: index * 1)); // اضف فترة معينة (مثلاً يوم واحد لكل عنصر)
  return '${dueDate.day} ${_getMonthName(dueDate.month)} ${dueDate.year}';
}

String _getMonthName(int month) {
  const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return months[month - 1];
}
