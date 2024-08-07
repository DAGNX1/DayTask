import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AuthProvider.dart';
import 'screens/Login_Sugnup/login_screen.dart';
import 'screens/Login_Sugnup/Sign_up_screen.dart';
import 'screens/Profile_Screen.dart';
import 'BottomNavigation_Screen/Home_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home',
      routes: {
        '/register': (context) =>  RegisterPage(),
        '/Home': (context) =>  HomeScreen(),
        '/Login': (context) =>  LoginPage(),
        '/Profile': (context) =>  ProfileScreen(),
      },
    );
  }
}
