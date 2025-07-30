// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_m/Authentication/signInScreen.dart';

signUpUser(
  String userName,
  String userEmail,
  String userPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection("users").doc(userid?.uid).set({
      'userName': userName,
      'userEmail': userEmail,
      // 'userPassword': userPassword,
      'createdAt': DateTime.now(),
      'userId': userid?.uid,
      'isAdmin': false
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(() => LoginScreen()),
        });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
