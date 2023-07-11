import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../auth/auth.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final currentUserModel = UserModel.empty().obs;
  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  final todoListDocList = <DocumentSnapshot>[].obs;
  final todoList = <Map<String, dynamic>>[].obs;

  Future<void> init() async {
    UserModel userModel = await UserRepository.instance.getUser(currentUserUid);
    if (userModel.uid == null) {
      await Authentication.instance.signOutWithGoogle();
    } else {
      currentUserModel.value = userModel;
      todoListDocList
          .bindStream(TodoRepository.instance.getDocList(currentUserUid));
    }
  }

  @override
  Future<void> onInit() async {
    await init();
    super.onInit();
  }
}
