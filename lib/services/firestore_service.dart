import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traceebee_users_app/models/hive_model.dart';
import 'package:traceebee_users_app/models/honey_model.dart';
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

  Future<void> addHiveData(HiveModel hiveModel) async {
    await _firestore.collection('hives').doc().set(hiveModel.toMap());
  }

  Future<String> addHoneyData(HoneyModel honeyModel, String hiveNumber) async {
    var data = await _firestore
        .collection('hives')
        .where(
          'hiveNumber',
          isEqualTo: hiveNumber,
        )
        .get();
    if (data.docs.isEmpty) {
      return 'Document doesn\'t exist for $hiveNumber Hive Number';
    }
    var doc = data.docs.first;
    await doc.reference.update({
      "createdAt": honeyModel.createdAt,
      "amountHoney": honeyModel.amountOfHoney,
    });
    return 'Success';
  }

  Stream<List<HiveModel>> fetchHives(String uuid) {
    return _firestore
        .collection('hives')
        .where('userID', isEqualTo: uuid)
        .snapshots()
        .map((event) {
      List<HiveModel> hives = [];

      event.docs.forEach((element) {
        hives.add(HiveModel.fromMap(element.data()));
      });

      return hives;
    });
  }
}
