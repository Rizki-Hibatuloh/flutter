import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:signup_login/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCVTS6TDpaz8cyPFBTJClTR_16ifAnC5rc",
          authDomain: "fire-setup-658af.firebaseapp.com",
          projectId: "fire-setup-658af",
          storageBucket: "fire-setup-658af.appspot.com",
          messagingSenderId: "19930523780",
          appId: "1:19930523780:web:27c927f98efd18ab343ad1"),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
    );
  }
}
