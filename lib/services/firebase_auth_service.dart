import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:traceebee_users_app/models/user_model.dart';
import 'package:traceebee_users_app/services/firestore_service.dart';
import 'package:traceebee_users_app/services/local_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = FireStoreService();

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String result = '';

    // to avoid spaces
    email.trim();
    password.trim();

    try {
      var userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCred.user != null) {
        LocalService().setSharedToken(userCred.user!.uid);
        result = 'success';
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      result = e.message.toString();
    }

    return result;
  }

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String result = '';

    // to avoid spaces
    name.trim();
    email.trim();
    password.trim();

    try {
      var userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user != null) {
        if (await _fireStoreService.checkUser(userCred.user!.uid)) {
          result = 'user already exists';
        } else {
          _fireStoreService.createUser(
            UserModel(
                email: email,
                name: name,
                uid: userCred.user!.uid,
                password: password,
                createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                hiveCount: '0',
                totalAmountOfHoney: '0',
                profileImage:
                    'https://firebasestorage.googleapis.com/v0/b/tracebee-128c8.appspot.com/o/WhatsApp%20Image%202023-01-30%20at%2010.39.25%20PM.jpeg?alt=media&token=38d0dc08-326a-4783-9bc6-e2ed44ae418d'),
          );
          result = 'success';
        }
      }
    } on FirebaseAuthException catch (e) {
      result = e.message.toString();
    }

    return result;
  }
}
