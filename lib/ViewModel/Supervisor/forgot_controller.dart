import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Colors/Colors.dart';
class ForgotController extends GetxController{
  final TextEditingController forgotEmailController =TextEditingController();
   var isLoading =false.obs;
  void forgotPassword(){
    isLoading.value = true;
    FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgotEmailController.text
            .toString().trim())
        .then((value) => {
      isLoading.value=false,
      Get.snackbar("Error",
          "We have sent you email to recover password, please check email"),
      // Get.offAll(SupervisorLoginScreen()),
      forgotEmailController.clear()
    })
        .onError((error, stackTrace) => {
      isLoading.value=false,
      Get.snackbar(backgroundColor: CustomColors.mainAppColor,colorText: Colors.white,
          "Error", "Please Enter Email")
    });
  }

}