import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text('TABLE CALENDAR'),
    );
  }

  _bodyWidget() {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 1, 1),
      focusedDay: DateTime.now(),
    );
  }
}
