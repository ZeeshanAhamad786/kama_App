import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import 'package:kama_app/ViewModel/Care_taker/sign_up_caretaker_controller.dart';

class SignInCaretakerController extends GetxController {
  SignUPCaretakerController signUPCaretakerController =
  Get.find(tag: "signUPCaretakerController");
  final TextEditingController emailCaretakerController =
  TextEditingController();
  final TextEditingController passwordCaretakerController =
  TextEditingController();
  var isLoading = false.obs;


  signInCaretakerHandler(
      {String? userEmailCaretaker, String? userPasswordCaretaker,  String? userType}) async {
    if (emailCaretakerController.text.isNotEmpty &&
        passwordCaretakerController.text.isNotEmpty) {
      try {
        // Sign in
        isLoading.value = true;
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: userEmailCaretaker!, password: userPasswordCaretaker!)
            .then((value) async {
          isLoading.value = false;

          // Get the user data after successful login
          var userDataSnapshot = await signUPCaretakerController.userDataCaretaker
              .doc(value.user!.uid)
              .get();

          var userType = userDataSnapshot['userType'];

          if (userType == 'caretaker') {
            Get.snackbar(
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white,
              "Note",
              "Caretaker Login Successfully",
            );
            log("Caretaker login successful");
            emailCaretakerController.clear();
            passwordCaretakerController.clear();
            Get.offAll(CaretakerBottomNavigationScreen());
          } else {
            // If user is not a caretaker, show error
            Get.snackbar(
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white,
              "Error",
              "You are not authorized to login as a caretaker.",
            );
            log("User is not authorized to login as a caretaker.");
          }
        }).onError((error, stackTrace) {
          isLoading.value = false;
          Get.snackbar(
            backgroundColor: CustomColors.mainAppColor,
            colorText: Colors.white,
            "Error",
            "You are not authorized to login as a caretaker.",
          );
          log("Something went wrong: $error");
        });
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        Get.snackbar("Error", "$e");
        log("$e");
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        backgroundColor: CustomColors.mainAppColor,
        colorText: Colors.white,
        "Error",
        "All fields are required",
      );
    }
  }
}