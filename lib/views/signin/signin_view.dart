import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth.dart';
import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class SigninView extends StatelessWidget {
  SigninView({super.key});

  final signController = Get.put(SignController());
  final currentUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("[USER INFO] $currentUser");
    }

    return Scaffold(
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: GoogleLoginButton(
          onTap: () async {
            signController.start();
            await Authentication.instance.signInWithGoogle();
            signController.done();
          },
        ),
      ),
    );
  }
}
