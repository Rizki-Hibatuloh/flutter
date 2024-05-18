// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       final UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       log("User created successfully with email: $email");
//       return cred.user;
//     } catch (e) {
//       log("Error creating user: $e");
//       return null;
//     }
//   }

//   Future<User?> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       final UserCredential cred = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       log("User logged in successfully with email: $email");
//       return cred.user;
//     } catch (e) {
//       log("Error logging in: $e");
//       return null;
//     }
//   }

//   Future<void> signout() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       log("Something went wrong");
//     }
//   }
// }
