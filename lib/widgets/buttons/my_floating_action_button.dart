import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../repositories/repositories.dart';

class MyFloatingActionButton extends StatelessWidget {
  final String userUid;
  final DateTime selectedDay;
  MyFloatingActionButton({
    required this.userUid,
    required this.selectedDay,
    Key? key,
  }) : super(key: key);

  final TextEditingController _addTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      visible: true,
      backgroundColor: Colors.blue,
      animatedIcon: AnimatedIcons.add_event,
      curve: Curves.bounceIn,
      overlayOpacity: 0,
      children: [
        SpeedDialChild(
          onTap: () {
            addTodoDialog();
          },
          child: const Icon(Icons.create),
          backgroundColor: Colors.blue,
          labelBackgroundColor: Colors.blue,
          label: "Add Todo",
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Future addTodoDialog() {
    return Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0.5),
      radius: 4,
      barrierDismissible: false,
      content: Container(
        height: 150,
        width: 280,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Text(
                'ADD TODO',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 17),
              TextFormField(
                controller: _addTodoController,
                autocorrect: false,
              ),
              const SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      'CANCLE',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 58),
                  GestureDetector(
                    onTap: () {
                      TodoRepository.instance.addTodoToFirebase(
                        const Uuid().v4(),
                        userUid,
                        _addTodoController.text,
                        selectedDay,
                      );
                      Get.back();
                    },
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
