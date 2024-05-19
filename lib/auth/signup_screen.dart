import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:signup_login/auth/auth_service.dart';
import 'package:signup_login/auth/login_screen.dart';
import 'package:signup_login/home_screen.dart';
import 'package:signup_login/style.dart';
import 'package:signup_login/widgets/button.dart';
import 'package:signup_login/widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = AuthService();

  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyles.body.copyWith(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/sign.png'),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Create an Account',
                  style: TextStyles.title,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                controller: _username,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                hint: 'Username',
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                controller: _email,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hint: 'Your email address',
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
                label: 'Sign Up',
                onPressed: _signup,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: const Text(
                      "Login",
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

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log('User Created Successfully');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign Up Successful'),
        ),
      );
      await Future.delayed(const Duration(
          seconds: 2)); // Menunggu beberapa detik sebelum navigasi
      goToHome(context);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign Up Failed'),
        ),
      );
    }
  }
}
