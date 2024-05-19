import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:signup_login/auth/auth_service.dart';
import 'package:signup_login/auth/signup_screen.dart';
import 'package:signup_login/home_screen.dart';
import 'package:signup_login/style.dart';
import 'package:signup_login/widgets/button.dart';
import 'package:signup_login/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyles.title, // Menghapus 'const' di sini
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login.png'),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyles.title, // Menghapus 'const' di sini
                ),
              ),
              const SizedBox(height: 24.0),
              CustomTextfield(
                controller: _email,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hint: 'Input Your Email Address',
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                controller: _password,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                isObscure: isObscure,
                hasSuffix: true,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                hint: 'Password',
              ),
              const SizedBox(height: 24.0),
              CustomButoon(
                label: 'Login',
                onPressed: () {
                  if (_email.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email is required'),
                      ),
                    );
                  } else if (_password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password is required'),
                      ),
                    );
                  } else {
                    _login();
                  }
                },
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );

  void goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  void _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful'),
        ),
      );
      // Tambahkan jeda waktu sebelum navigasi ke HomeScreen
      await Future.delayed(const Duration(seconds: 1));
      goToHome(context);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Failed'),
        ),
      );
    }
  }
}
