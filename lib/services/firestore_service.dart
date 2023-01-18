import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traceebee_users_app/models/user_model.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkUser(String uid) async {
    var doc = await _firestore.collection('users').doc(uid).get();
    return doc.exists;
  }

  void createUser(UserModel userModel) async {
    await _firestore.collection('users').doc().set(userModel.toMap());
  }
}
