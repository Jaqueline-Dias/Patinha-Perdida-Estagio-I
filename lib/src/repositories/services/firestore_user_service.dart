import 'package:app_patinha/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  addUserToFirestore(UserModel userModel) async {
    await _usersCollection.doc(userModel.userId).set(userModel.toMap());
  }

  Future<DocumentSnapshot> getUserFromFirestore(String uid) async {
    return await _usersCollection.doc(uid).get();
  }
}
