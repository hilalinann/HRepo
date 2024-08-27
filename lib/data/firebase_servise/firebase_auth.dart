import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/util/exception.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> Signup({
    required String email,
    required String password,
    required String passwordConfirme,
    required String username,
    required String bio,
    required File profile,
  }) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordConfirme) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
        } else {
          throw exceptions('password and confirm should be same');
        }
      } else {
        throw exceptions('enter all the fields');
      }
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }
}
