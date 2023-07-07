import 'dart:convert';

class TodoModel {
  String? uid;
  String? desc;
  DateTime? madeDay;
  bool? checked;

  TodoModel({
    required this.uid,
    required this.desc,
    required this.madeDay,
    required this.checked,
  });

  TodoModel copyWith({
    String? uid,
    String? desc,
    DateTime? madeDay,
    bool? checked,
  }) {
    return TodoModel(
      uid: uid ?? this.uid,
      desc: desc ?? this.desc,
      madeDay: madeDay ?? this.madeDay,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'desc': desc,
      'madeDay': madeDay?.microsecondsSinceEpoch,
      'checked': checked,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      madeDay: map['madeDay'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['madeDay'] as int)
          : null,
      checked: map['checked'] != null ? map['checked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory TodoModel.empty() {
    return TodoModel(
      uid: '',
      desc: '',
      madeDay: DateTime.now(),
      checked: false,
    );
  }

  factory TodoModel.add(TodoModel todoModel) {
    return TodoModel(
      uid: todoModel.uid,
      desc: todoModel.desc,
      madeDay: todoModel.madeDay,
      checked: todoModel.checked,
    );
  }
}
