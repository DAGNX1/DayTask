import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'Calendar_Screen.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212832),
      appBar: AppBar(
        title: const Text(
          'Create New Task',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalendarScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Task Title"),
            SizedBox(height: 10,),
            _buildTextContainer1("Hi-Fi Wireframe", 48),
            SizedBox(height: 30),
            _buildSectionTitle("Task Description"),
            SizedBox(height: 23,),

            _buildTextContainer2(
              "Lorem Ipsum is simply dummy text of the printing and "
              "typesetting industry. Lorem Ipsum has been the industry's"
              " standard dummy text ever since the 1500s,",
              82,
            ),
            SizedBox(height: 23),
            _buildSectionTitle("Add team members"),
            SizedBox(height: 20),
            _buildTeamMemberRow(),
            SizedBox(height: 28),
            _buildSectionTitle("Time & Date"),
            SizedBox(height: 20),
            _buildTimeAndDateRow(context),
            SizedBox(height: 50),
            _buildAddNewText(),
            SizedBox(height: 42),
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextContainer1(String text, double height) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xff455A64),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContainer2(String text, double height) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xff455A64),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMemberRow() {
    return Row(
      children: [
        _buildTeamMember("assets/Image/Ellipse 1.png", "Robert"),
        SizedBox(width: 10),
        _buildTeamMember("assets/Image/Ellipse 2.png", "Sophia"),
        SizedBox(width: 10),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildTeamMember(String imagePath, String name) {
    return Container(
      color: Color(0xff455A64),
      height: 40,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(imagePath),
            SizedBox(width: 5),
            Text(
              name,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Image.asset("assets/Icon/closesquare.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      height: 40,
      width: 40,
      color: Color(0xffFED36A),
      child: Center(
        child: Image.asset(
          "assets/Icon/add33.png",
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTimeAndDateRow(BuildContext context) {
    return Row(
      children: [
        _buildIconButton("assets/Icon/clock.png", () => _selectTime(context)),
        _buildInfoContainer("${_selectedTime.format(context)}", 135),
        SizedBox(width: 10),
        _buildIconButton(
            "assets/Icon/calendar.png", () => _selectDate(context)),
        _buildInfoContainer(
            DateFormat('dd/MM/yyyy').format(_selectedDate), 135),
      ],
    );
  }

  Widget _buildIconButton(String iconPath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        color: Color(0xffFED36A),
        child: Center(
          child: Image.asset(
            iconPath,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String info, double width) {
    return Container(
      color: Color(0xff455A64),
      height: 40,
      width: width,
      child: Center(
        child: Text(
          info,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewText() {
    return Center(
      child: Text(
        "Add New",
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return Container(
      alignment: Alignment.center,
      height: 66,
      width: double.infinity,
      color: Color(0xffFED36A),
      child: Text(
        "Create",
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
