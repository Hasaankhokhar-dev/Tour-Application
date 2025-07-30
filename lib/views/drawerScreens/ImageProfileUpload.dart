import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

// Function to upload image to Firebase Storage
Future<String> uploadImage(File imageFile, String userId) async {
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('profile_photos')
      .child('user_$userId.jpg');

  await ref.putFile(imageFile);

  String downloadURL = await ref.getDownloadURL();
  return downloadURL;
}
