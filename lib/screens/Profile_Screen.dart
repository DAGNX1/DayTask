import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../BottomNavigation_Screen/Home_Screen.dart';
import '../AuthProvider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _displayText = 'Fazil Laghari';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff212832),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, color: Colors.white),
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Stack(
              children: [
                Container(
                  width: 133,
                  height: 133,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFED36A),
                      width: 2.0,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/Image/Ellipse 36.png"),
                      radius: 60,
                    ),
                  ),
                ),
                // Change Picture Button
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Function to change the picture
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xff212832),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/useradd.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _displayText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/Icon/edit.png'),
                      color: Color(0xff8CAAB9),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          String newText = _displayText;
                          return AlertDialog(
                            title: const Text('Edit Text'),
                            content: TextField(
                              onChanged: (value) {
                                newText = value;
                              },
                              controller:
                                  TextEditingController(text: _displayText),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Save'),
                                onPressed: () {
                                  setState(() {
                                    _displayText = newText;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/usertag.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        authProvider.email,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/lock.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/task.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Tasks",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/securitycard.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Privacy",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xff455A64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const ImageIcon(
                    AssetImage('assets/Icon/setting4.png'),
                    color: Color(0xff8CAAB9),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Setting",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 45),
            Container(
              width: 364,
              height: 54,
              color: const Color(0xffFED36A),
              child: GestureDetector(
                onTap: () {
                  authProvider.logout();
                  Navigator.pushReplacementNamed(context, '/Login');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Icon/logoutcurve.png"),
                    const SizedBox(width: 10),
                    Image.asset("assets/Icon/Logout.png"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
