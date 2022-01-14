import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_test/views/home_view.dart';
import 'package:ui_test/views/login_view.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  void onClose() {
    emailController.clear();
    pswdController.clear();
    super.onClose();
  }

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? userAccount;

  googleLogin() async {
    try {
      userAccount = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential

      if (credential.accessToken != null || credential.idToken != null) {
        return await FirebaseAuth.instance
            .signInWithCredential(credential)
            .whenComplete(
              () => Get.off(() => HomeView()),
            );
      } else {
        Get.back();
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  googleLogout() async {
    await googleSignIn.signOut().then(
          (value) => Get.off(() => LoginView()),
        );
  }
}
