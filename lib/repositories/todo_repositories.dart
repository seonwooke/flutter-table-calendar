import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class TodoRepository {
  TodoRepository._privateConstructor();
  static final TodoRepository _instance = TodoRepository._privateConstructor();
  static TodoRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> setTodoToFirebase(
      String tid, String uid, String desc, DateTime dateTime) async {
    String formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
    var todoModel = TodoModel(
      tid: tid,
      uid: uid,
      desc: desc,
      selectedDate: dateTime,
      checked: false,
    );

    await _userCollection.doc(uid).collection("todoList").doc(formatDate).set({
      'todos': FieldValue.arrayUnion([todoModel.toMap()])
    });

    print("[SUCCESS] ${desc} Todo Setted");
  }

  Future<void> addTodoToFirebase(
      String tid, String uid, String desc, DateTime dateTime) async {
    String formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
    var todoModel = TodoModel(
      tid: tid,
      uid: uid,
      desc: desc,
      selectedDate: dateTime,
      checked: false,
    );

    await _userCollection
        .doc(uid)
        .collection("todoList")
        .doc(formatDate)
        .update({
      'todos': FieldValue.arrayUnion([todoModel.toMap()])
    });

    print("[SUCCESS] ${desc} Todo added");
  }
}
