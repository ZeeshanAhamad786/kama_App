import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/ViewModel/Supervisor/sign_up_controller.dart';
import 'package:kama_app/notification_services/notification_services.dart';
import '../../View/BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpController signUpController = Get.find(tag: "signUpController");
NotificationServices notificationServices=NotificationServices();
  var loading = false.obs;
  var isLogin = false.obs;

  signInHandler({userEmailName, userPassword}) async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        loading.value = true;
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailName,
          password: userPassword,
        );
        User? user = userCredential.user;
        if (user != null) {
          loading.value = false;
          try {
            final snapshot = await signUpController.userData.doc(user.uid).get();
            if (snapshot.exists) {
              final userType = snapshot["userType"];
              log("User type: $userType");
              if (userType == "supervisor") {
                Get.snackbar(
                  backgroundColor: CustomColors.mainAppColor,
                  colorText: Colors.white,
                  "Note",
                  "User Login Successfully",
                );

                log("User login successfully");
                emailController.clear();
                passwordController.clear();
                Get.offAll(SupervisorBottomNavigationScreen());
              } else {
                Get.snackbar(
                  backgroundColor: CustomColors.mainAppColor,
                  colorText: Colors.white,
                  "Error",
                  "You are not authorized to login as a supervisor.",
                );
                log("User is not authorized to login as a supervisor.");
              }
            } else {
              Get.snackbar(
                backgroundColor: CustomColors.mainAppColor,
                colorText: Colors.white,
                "Error",
                "User is not authorized to login as a supervisor.",
              );
              log("User data not found");
            }
          } catch (e) {
            loading.value = false;
            Get.snackbar(
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white,
              "Error",
              "Failed to retrieve user data: $e",
            );
            log("Failed to retrieve user data: $e");
          }
        }

      } on FirebaseAuthException catch (e) {
        loading.value = false;
        Get.snackbar(
          backgroundColor: CustomColors.mainAppColor,
          colorText: Colors.white,
          "Error",
          "Something went wrong",
        );
        log("Something went wrong");
      }
    } else {
      loading.value = false;
      Get.snackbar(
        backgroundColor: CustomColors.mainAppColor,
        colorText: Colors.white,
        "Error",
        "All fields are required",
      );}
  }
  Future<void>updateDeviceToken(String deviceToken)async{
  try{
    FirebaseFirestore.instance.collection('supervisor_users').doc(FirebaseAuth.instance.currentUser!.uid).update(

        {
          'deviceToken':deviceToken
        }
    ).then((value) {

      log('DeviceToken Update Successfully');

    });
  }catch(e){
    log('SomeThing went Wrong ${e.toString()}');
  }
  }
}