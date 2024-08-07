import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isLoggedIn = false;

  AuthProvider() {
    _loadUserData();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    // تحقق بسيط
    if (email == 'test@example.com' && password == 'password') {
      isLoggedIn = true;
      _saveUserData();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register() async {
    // تحقق بسيط
    if (email.isNotEmpty && password.isNotEmpty) {
      isLoggedIn = true;
      _saveUserData();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    isLoggedIn = false;
    email = '';
    password = '';
    _clearUserData();
    notifyListeners();
  }

  void _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    isLoggedIn = email.isNotEmpty && password.isNotEmpty;
    notifyListeners();
  }

  void _clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }
}
