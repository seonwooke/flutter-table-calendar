import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../auth/auth.dart';
import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final tableCalendarController = Get.put(TableCalendarController());
  final currentUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("[USER INFO] $currentUser");
    }

    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      floatingActionButton: MyFloatingActionButton(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text('TABLE CALENDAR'),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
          ),
          onPressed: () async {
            try {
              await Authentication.instance.signOutWithGoogle();
            } catch (error) {
              if (kDebugMode) {
                print(error);
              }
            }
          },
        )
      ],
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 1, 1),
              focusedDay: tableCalendarController.focusedDay.value,
              onDaySelected: (DateTime sd, DateTime fd) {
                tableCalendarController.selectedDay.value = sd;
                tableCalendarController.focusedDay.value = fd;
              },
              selectedDayPredicate: (DateTime day) {
                // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                return isSameDay(
                    tableCalendarController.selectedDay.value, day);
              },
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
            );
          }),
          const Divider(),
        ],
      ),
    );
  }
}
