import 'package:get/get.dart';

import '../controllers/controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TableCalendarController());
    Get.put(UserController());
  }
}
