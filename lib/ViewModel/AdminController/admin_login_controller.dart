import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Colors/Colors.dart';
import '../../View/Admin/AdminLogin/admin_login.dart';
import '../../View/BottomNavigationBar/bottom_navigation_bar_screen.dart';

class AdminLoginController extends GetxController {
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminResetEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  // Admin Login Method
  Future<void> adminLogin(String email, password, BuildContext context) async {
    try {
      isLoading.value=true;

      if (email.isNotEmpty && password.isNotEmpty) {
        RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

        if (emailRegex.hasMatch(email)) {
          if (password.length >= 8) {
            // Properly check if the user exists

            UserCredential userCredential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);

            // If user exists and sign-in is successful
            if (userCredential.user != null &&
                adminEmailController.text == 'kamaapp669@gmail.com') {
              isLoading.value = false;

              adminEmailController.clear();
              adminPasswordController.clear();
              Get.offAll(()=>BottomNavigationBarScreen());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => BottomNavigationBarScreen()),
              // );
            } else {
              // User does not exist
              isLoading.value = false;

              Get.snackbar('Sorry ', 'User does not exist',
                  backgroundColor: CustomColors.mainAppColor,
                  colorText: Colors.white);
            }
          } else {
            isLoading.value = false;

            Get.snackbar('Sorry ', 'Password length should be 8 characters',
                backgroundColor: CustomColors.mainAppColor,
                colorText: Colors.white);
          }
        } else {
          isLoading.value = false;

          Get.snackbar('Sorry ', 'Invalid email',
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white);
        }
      } else {
        isLoading.value = false;

        Get.snackbar('Sorry ', 'All Fields are Required',
            backgroundColor: CustomColors.mainAppColor,
            colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;

      log('An error occurred: $e');
      Get.snackbar('Sorry ', 'An error occurred. Please try again later.',
          backgroundColor: CustomColors.mainAppColor, colorText: Colors.white);
      isLoading.value = false;
    }
  }

  // Admin Forgot Password & Reset Password Method
  Future<void> forgotPassword(String email) async {
    try {
      isLoading.value = true;

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Ok', 'Password send on Email Successfully',
          backgroundColor: CustomColors.mainAppColor, colorText: Colors.white);
      adminEmailController.clear();
      Get.to(() => AdminSignIn());
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Sorry', 'Something went Wrong',
          backgroundColor: CustomColors.mainAppColor, colorText: Colors.white);
      isLoading.value = false;
    }
  }

  //Change Password Method
  Future<void> changePassword(
      {currentPassword, emailAddress, newPassword}) async {
    var user = FirebaseAuth.instance.currentUser!;
    try {
      var Credential = EmailAuthProvider.credential(
          email: emailAddress, password: currentPassword);
      await user.reauthenticateWithCredential(Credential).then((value) {
        user.updatePassword(newPassword);
        Get.snackbar('Success', 'Your changes saved Successfully',
            backgroundColor: CustomColors.mainAppColor,
            colorText: Colors.white);
      });
    } catch (e) {
      Get.snackbar('Sorry', 'Something went Wrong',
          backgroundColor: CustomColors.mainAppColor, colorText: Colors.white);
      log('Error Occurred ${e.toString()}');
    }
  }
}
