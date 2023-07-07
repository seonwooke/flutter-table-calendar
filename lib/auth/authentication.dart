import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/constants.dart';
import '../repositories/repositories.dart';
import '../models/models.dart';

class Authentication {
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();
  static Authentication get instance => _instance;

  Future<void> signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAllNamed(AppRoutes.instance.INIT));
  }

  /// Google Sign In
  Future<User?> signInWithGoogle() async {
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithPopup(authProvider);

        user = userCredential.user;

        if (user != null && userCredential.additionalUserInfo!.isNewUser) {
          await UserRepository.instance.addUserToFirebase(
            UserModel.signUp(
              user,
            ),
          );
        }

        Get.offNamed(AppRoutes.instance.HOME);
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      try {
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          try {
            final UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            user = userCredential.user;

            if (user != null && userCredential.additionalUserInfo!.isNewUser) {
              await UserRepository.instance.addUserToFirebase(
                UserModel.signUp(
                  user,
                ),
              );
            }

            Get.offNamed(AppRoutes.instance.HOME);
          } on FirebaseAuthException catch (error) {
            if (kDebugMode) {
              print(error.code);
            }
          } catch (error) {
            if (kDebugMode) {
              print(error);
            }
          }
        }

        return user;
      } on PlatformException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    }

    return null;
  }

  /// Google Sign Out
  Future<void> signOutWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await signOut();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
