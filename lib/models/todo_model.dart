import 'dart:convert';

class TodoModel {
  String? tid;
  String? uid;
  String? desc;
  DateTime? selectedDate;
  bool? checked;

  TodoModel({
    required this.tid,
    required this.uid,
    required this.desc,
    required this.selectedDate,
    required this.checked,
  });

  TodoModel copyWith({
    String? tid,
    String? uid,
    String? desc,
    DateTime? selectedDate,
    bool? checked,
  }) {
    return TodoModel(
      tid: tid ?? this.tid,
      uid: uid ?? this.uid,
      desc: desc ?? this.desc,
      selectedDate: selectedDate ?? this.selectedDate,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tid': tid,
      'uid': uid,
      'desc': desc,
      'selectedDate': selectedDate!.microsecondsSinceEpoch,
      'checked': checked,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      tid: map['tid'] != null ? map['tid'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      selectedDate: map['selectedDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['selectedDate'] as int)
          : null,
      checked: map['checked'] != null ? map['checked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory TodoModel.empty() {
    return TodoModel(
      tid: '',
      uid: '',
      desc: '',
      selectedDate: DateTime.now(),
      checked: false,
    );
  }

  factory TodoModel.add(TodoModel todoModel) {
    return TodoModel(
      tid: todoModel.tid,
      uid: todoModel.uid,
      desc: todoModel.desc,
      selectedDate: DateTime.now(),
      checked: false,
    );
  }
}
