import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import '../../View/BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';


class ChangePasswordController extends GetxController{
  final TextEditingController currentPasswordController =TextEditingController();
  final TextEditingController newPasswordController =TextEditingController();
  var currentUser =FirebaseAuth.instance.currentUser;
  var isLoading =false.obs;


  Future<void> changePassword({emailName,currentPassword,newPassword})async{
    isLoading.value=true;

    var credential=EmailAuthProvider.credential(email: emailName, password:currentPassword);
 await currentUser?.reauthenticateWithCredential(credential).then((value) => {
 isLoading.value=false,
   currentUser?.updatePassword(newPassword),
   Get.snackbar(backgroundColor: CustomColors.mainAppColor,colorText: Colors.white,
       "Change Password", "Successfully"),
   log("changed password Successfully"),
   currentPasswordController.clear(),
   newPasswordController.clear(),

   Get.offAll(SupervisorBottomNavigationScreen()),
 }).
 onError((error, stackTrace) => {
    isLoading.value=false,
   Get.snackbar(backgroundColor: CustomColors.mainAppColor,colorText: Colors.white,
       "Error", "Please Enter correct Password")
 });
  }
}