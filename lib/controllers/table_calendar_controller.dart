import 'package:get/get.dart';

class TableCalendarController extends GetxController {
  static TableCalendarController get instance => Get.find();

  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
}
