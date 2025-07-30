// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, duplicate_ignore, unused_local_variable, avoid_print

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:t_m/Authentication/signUpServices.dart';
import 'package:t_m/Authentication/signInScreen.dart';
// import 'package:t_mentor/views/signInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visibility = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Colors.white,
        //   size: 27, // Set your desired color here
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 26, 143, 46),

        centerTitle: true,
        title: const Text(
          'Tour Mentor',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            // lottie animation
            Container(
              alignment: Alignment.center,
              height: 250.0,
              child: Lottie.asset("TM_logo1.json"),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // name field container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.person),
                  hintText: 'Your Name',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Email field container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: userEmailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  // suffixIcon: Icon(Icons.email),
                  hintText: 'Your Email',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                obscureText: visibility,
                controller: userPasswordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: Icon(
                      visibility ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () async {
                  var userName = userNameController.text.trim();
                  var userEmail = userEmailController.text.trim();
                  var userPassword = userPasswordController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmail, password: userPassword)
                      .then((value) => {
                            print("User Created"),
                            signUpUser(
                              userName,
                              userEmail,
                              userPassword,
                            ),
                          });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 26, 143, 46),
                  minimumSize: Size(448, 55),
                ),
                child: Text("Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                    ))),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? \t\t",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily:
                            'Open Sans', // White color for the first part
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Color.fromRGBO(112, 68, 192, 1),
                        // decoration: TextDecoration.underline,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold, // Underline for "Login"
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle navigation to LoginScreen here
                          Get.to(() => LoginScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
