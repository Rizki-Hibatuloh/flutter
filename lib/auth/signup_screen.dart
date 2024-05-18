import 'package:flutter/material.dart';
import 'package:signup_login/auth/login_screen.dart';
import 'package:signup_login/style.dart';
import 'package:signup_login/widget/button.dart';
import 'package:signup_login/widget/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Sign Up', style: TextStyles.body.copyWith(fontSize: 20.0)),
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
                    'Create an Acoount',
                    style: TextStyles.title,
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextfield(
                    controller: _username,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hint: 'Username'),
                const SizedBox(height: 16.0),
                CustomTextfield(
                    controller: _email,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hint: 'Your email address'),
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
                    hint: 'Password'),
                const SizedBox(height: 24.0),
                CustomButoon(label: 'Sign Up', onPressed: () {}),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: const Text("Login",
                        style: TextStyle(color: Colors.red)),
                  )
                ]),

                // const Spacer()
              ],
            ),
          ),
        ));
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // void goToHome(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const HomeScreen()),
  //   );
  // }

  // void _signup() async {
  //   try {
  //     final user = await _auth.createUserWithEmailAndPassword(
  //       _email.text,
  //       _password.text,
  //     );
  //     if (user != null) {
  //       log("User Created Successfully");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Sign up successful!'), // Pesan sukses
  //           duration: Duration(seconds: 2), // Durasi pesan sukses
  //         ),
  //       );
  //       goToHome(context); // Pindah ke halaman home setelah sign up berhasil
  //     }
  //   } catch (e) {
  //     log("Error signing up: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Sign up failed. Please try again.'), // Pesan gagal
  //         duration: Duration(seconds: 2), // Durasi pesan gagal
  //       ),
  //     );
  //   }
  // }
}
