import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:t_m/Admin/admin-homeScreen.dart';
import 'package:t_m/Authentication/forgotPasswordScreen.dart';
import 'package:t_m/NavigationFile/Explorepk.dart';
import 'package:t_m/Authentication/singUpScreen.dart';
import 'package:t_m/NavigationFile/main_navigaton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visibility = true;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
        body: Builder(
          builder: (BuildContext context) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 250.0,
                    child: Lottie.asset(
                        "assets/Animation - 1704534352101 (1).json"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: loginEmailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
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
                      controller: loginPasswordController,
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
                            visibility
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                      var loginEmail = loginEmailController.text.trim();
                      var loginPassword = loginPasswordController.text.trim();

                      try {
                        final UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: loginEmail,
                          password: loginPassword,
                        );

                        final User? firebaseUser = userCredential.user;

                        if (firebaseUser != null) {
                          final userData = await usersData(firebaseUser.uid);

                          if (userData.isNotEmpty &&
                              userData[0]['isAdmin'] == true) {
                            print(userData[0]['isAdmin'].toString());
                            Get.offAll(() => AdminHomeScreen());
                          } else {
                            Get.offAll(() => BottomNavi());
                          }
                        } else {
                          print("User not found.");
                        }
                      } on FirebaseAuthException catch (e) {
                        String errorMessage = 'An error occurred.';

                        if (e.code == 'invalid-email') {
                          errorMessage = 'Invalid email address.';
                        } else if (e.code == 'user-not-found') {
                          errorMessage = 'User not found.';
                        } else if (e.code == 'wrong-password') {
                          errorMessage = 'Invalid password.';
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 26, 143, 46),
                      minimumSize: Size(448, 55),
                    ),
                    child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                        )),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => ForgotPasswordScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? \t\t",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              color: Color.fromRGBO(112, 68, 192, 1),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => SignUpScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<List<QueryDocumentSnapshot>> usersData(String userId) async {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .get();
    return userData.docs;
  }
}
