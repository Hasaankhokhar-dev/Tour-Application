import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart'; // Add this import statement
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late User? _user; // Firebase user
  late String _userName = '';
  late String _userEmail = '';
  String? _profileImageUrl;
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
    _fetchProfileImage(); // Fetch profile image URL on initialization
  }

  Future<void> _getUserData() async {
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      setState(() {
        _userName = userData['name'];
        _userEmail = _user!.email!;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .set({'name': _userName}, SetOptions(merge: true));

      if (_newPasswordController.text.isNotEmpty) {
        // Change the password if a new password is provided
        await _changePassword();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Future<void> _fetchProfileImage() async {
    try {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      if (userData.exists && userData['profileImageUrl'] != null) {
        setState(() {
          _profileImageUrl = userData['profileImageUrl'];
        });
      }
    } catch (e) {
      print('Error fetching profile image: $e');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // Upload image to Firebase Storage
        String imageUrl = await uploadImage(File(pickedImage.path), _user!.uid);

        // Save image URL to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .set({'profileImageUrl': imageUrl}, SetOptions(merge: true));

        setState(() {
          _profileImageUrl = imageUrl;
        });
      } else {
        print('No image selected.');
      }
    } on PlatformException catch (e) {
      print('Error picking image: $e');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<String> uploadImage(File imageFile, String userId) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('profile_photos')
        .child('user_$userId.jpg');

    await ref.putFile(imageFile);

    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> _changePassword() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both current and new passwords'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Re-authenticate the user with their current password
      final credential = EmailAuthProvider.credential(
        email: _user!.email!,
        password: currentPassword,
      );
      await _user!.reauthenticateWithCredential(credential);

      // Change the user's password
      await _user!.updatePassword(newPassword);

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Password changed successfully'),
      //     backgroundColor: Colors.green,
      //   ),
      // );

      // Clear the password fields
      _currentPasswordController.clear();
      _newPasswordController.clear();
    } catch (e) {
      print('Error changing password: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to change password. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(_user!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            _userName = snapshot.data!['name'];
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: _profileImageUrl != null
                              ? NetworkImage(_profileImageUrl!)
                              : AssetImage('assets/default_profile_image.jpg')
                                  as ImageProvider<Object>,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Name'),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _userName,
                    decoration: InputDecoration(
                      hintText: 'Your name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => _userName = value!,
                  ),
                  const SizedBox(height: 20),
                  Text('Email'),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _userEmail,
                    decoration: InputDecoration(
                      hintText: _userEmail,
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 20),
                  Text('Change Password'),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _currentPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Current Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text('Save Profile'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
