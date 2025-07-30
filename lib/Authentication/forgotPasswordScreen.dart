// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, duplicate_ignore, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:t_m/Authentication/signInScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotPasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reset password'),

        // ignore: prefer_const_literals_to_create_immutables
        // actions: [
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 270.0,
            child: Lottie.asset("assets/Animation - 1704534352101 (1).json"),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: forgotPasswordcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                // suffixIcon: Icon(Icons.email),
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () async {
                var forgotEmail = forgotPasswordcontroller.text.trim();

                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgotEmail)
                      .then((value) => {
                            print("Email Sent!"),
                            Get.off(() => LoginScreen()),
                          });
                } on FirebaseAuthException catch (e) {
                  print("Error $e");
                }
              },
              child: Text("Sent Email")),
        ],
      )),
    );
  }
}
