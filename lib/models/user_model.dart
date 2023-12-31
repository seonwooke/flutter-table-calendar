import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? email;
  String? nickName;
  List<String>? todoList;

  UserModel({
    required this.uid,
    required this.email,
    required this.nickName,
    required this.todoList,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? nickName,
    List<String>? todoList,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      todoList: todoList ?? this.todoList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'nickName': nickName,
      'todoList': todoList!.toSet().toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      nickName: map['nickName'] != null ? map['nickName'] as String : null,
      todoList:
          map['todoList'] != null ? List<String>.from(map['todoList']) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.empty() {
    return UserModel(
      uid: '',
      email: '',
      nickName: '',
      todoList: [],
    );
  }

  factory UserModel.signUp(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      nickName: user.displayName,
      todoList: [],
    );
  }
}
