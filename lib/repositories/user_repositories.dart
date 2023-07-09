import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';

class UserRepository {
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  static UserRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFirebase(UserModel userModel) async {
    try {
      if (kDebugMode) {
        print('${userModel.email} is created');
      }
      await _userCollection.doc(userModel.uid).set(userModel.toMap());
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<UserModel> getUser(String uid) async {
    UserModel userModel = UserModel.empty();
    try {
      await _userCollection.doc(uid).get().then((DocumentSnapshot ds) {
        userModel = UserModel.fromMap(ds.data() as Map<String, dynamic>);
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(userModel.toString());
      }
    }

    return userModel;
  }
}
