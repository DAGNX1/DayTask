import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AuthProvider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffbac212832),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: 38),
              Image.asset("assets/Image/Group 5.png"),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create your account",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              SizedBox(height: 23),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(color: Color(0xff8CAAB9), fontSize: 16),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFF455A64),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) => _authProvider.updateEmail(value),
                ),
              ),
              SizedBox(height: 23),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Email Address",
                  style: TextStyle(color: Color(0xff8CAAB9), fontSize: 16),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFF455A64),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    // يمكنك هنا إضافة تحقق من تطابق البريد الإلكتروني
                    // في حالة أنك تريد أن يكون البريد الإلكتروني مؤكدًا
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(color: Color(0xff8CAAB9), fontSize: 16),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFF455A64),
                ),
                child: PasswordField(),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 67,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffFED36A)),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (await _authProvider.register()) {
                      Navigator.pushReplacementNamed(context, '/profile');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('فشل التسجيل')),
                      );
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 37),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Image.asset("assets/Icon/Or continue with.png"),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 37),
              Container(
                width: double.infinity,
                height: 67,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // يمكنك هنا إضافة منطق تسجيل الدخول عبر Google إذا رغبت في ذلك
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Icon/google.png"),
                      Text(
                        ' Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Login');
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xffFED36A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: _obscureText,
      onChanged: (value) => _authProvider.updatePassword(value),
    );
  }
}
