import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_table_calendar/controllers/user_controller.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class TodoRepository {
  TodoRepository._privateConstructor();
  static final TodoRepository _instance = TodoRepository._privateConstructor();
  static TodoRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> addTodoToFirebase(
      String tid, String uid, String desc, DateTime dateTime) async {
    // String formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final todoCollection = _userCollection.doc(uid).collection('todoList');
    var todoModel = TodoModel(
      tid: tid,
      uid: uid,
      desc: desc,
      selectedDate: dateTime,
      checked: false,
    );
    var isExisted = await todoCollection.doc(dateTime.toString()).get();

    if (isExisted.exists) {
      await todoCollection.doc(dateTime.toString()).update({
        'todos': FieldValue.arrayUnion([todoModel.toMap()])
      });
    } else {
      await todoCollection.doc(dateTime.toString()).set({
        'todos': FieldValue.arrayUnion([todoModel.toMap()])
      });
    }

    print("[SUCCESS] ${dateTime.toString()} : ${desc}");
  }

  Stream<List<DocumentSnapshot>> getDocList(String uid) {
    return _userCollection
        .doc(uid)
        .collection('todoList')
        .snapshots()
        .map((qs) {
      setTodoList(qs.docs);
      return qs.docs;
    });
  }

  setTodoList(List<QueryDocumentSnapshot<Map<String, dynamic>>> qdsList) {
    List<Map<String, dynamic>> todoList = [];

    for (var qds in qdsList) {
      Map<String, dynamic> todo = qds.data();
      todoList.add(todo);
      UserController.instance.todoList.value = (todoList);
    }
  }
}
