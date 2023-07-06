import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bindings/bindings.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: ((context, child) => GetMaterialApp(
            initialBinding: InitBinding(),
            initialRoute: AppRoutes.instance.HOME,
            getPages: AppPages.instance.pages,
            defaultTransition: Transition.native,
          )),
    );
  }
}
