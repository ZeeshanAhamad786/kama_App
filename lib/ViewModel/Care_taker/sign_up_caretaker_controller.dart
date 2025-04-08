import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Model/caretaker/user_model_caretaker.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import '../../Utils/Colors/Colors.dart';

class SignUPCaretakerController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final TextEditingController userConfirmPasswordController =
      TextEditingController();
  String? careTakerName;
  String? careTakerId;
  String? careTakerCenterName;

  final userDataCaretaker = FirebaseFirestore.instance
      .collection("caretaker_users")
      .withConverter<userModelCaretaker>(
          fromFirestore: (snapshot, context) =>
              userModelCaretaker.fromJson(snapshot.data()!),
          toFirestore: (caretaker_users, context) => caretaker_users.toJson());

  signUpCaretakerHandler({
    userName,
    chooseCommunity,
    traditionalBirthAttendant,
    userBirthAttended,
    userEmail,
    userPassword,
    userConfirmPassword,
    userId,
    timeStamp,
    userType,
  }) async {
    if (userNameController.text.isNotEmpty &&
        userEmailController.text.isNotEmpty &&
        userPasswordController.text.isNotEmpty &&
        userConfirmPasswordController.text.isNotEmpty) {
      if (userPasswordController.text.length >= 8) {
        if (userConfirmPasswordController.text.length ==
            userPasswordController.text.length) {
          RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
          if (emailRegex.hasMatch(userEmailController.text)) {
            try {
              // create user email and password
              isLoading.value = true;
              final credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: userEmail, password: userPassword);
              User? user = credential.user!;
              //date time
              DateTime currentDateTime = DateTime.now();
              Timestamp myTimeStamp = Timestamp.fromDate(currentDateTime);
              if (user.toString().isNotEmpty) {
                addUserCaretaker(user.uid,
                    userName: userName,
                    chooseCommunity: chooseCommunity,
                    traditionalBirthAttendant: traditionalBirthAttendant,
                    userBirthAttended: userBirthAttended,
                    userEmail: userEmail,
                    userPassword: userPassword,
                    userConfirmPassword: userConfirmPassword,
                    userTimeStamp: myTimeStamp.toDate().toString(),
                    userType: userType);
              }
            } on FirebaseAuthException catch (e) {
              isLoading.value = false;
              Get.snackbar(
                backgroundColor: CustomColors.mainAppColor,
                "Error",
                "The email address is already in use by another account.",
                colorText: Colors.white,
              );
            }
          } else {
            isLoading.value = false;
            Get.snackbar(
              backgroundColor: CustomColors.mainAppColor,
              "Invalid",
              "Invalid Email Address",
              colorText: Colors.white,
            );
          }
        } else {
          isLoading.value = false;
          Get.snackbar(
            backgroundColor: CustomColors.mainAppColor,
            "Sorry",
            "Password does not match",
            colorText: Colors.white,
          );
        }
      } else {
        isLoading.value = false;
        Get.snackbar(
          backgroundColor: CustomColors.mainAppColor,
          "Sorry",
          "Weak Password! Please try again",
          colorText: Colors.white,
        );
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
          backgroundColor: CustomColors.mainAppColor,
          colorText: Colors.white,
          "Error",
          "All fields are required");
    }
  }

  Future<void> addUserCaretaker(userID,
      {userName,
      chooseCommunity,
      traditionalBirthAttendant,
      userBirthAttended,
      userEmail,
      userPassword,
      userConfirmPassword,
      userTimeStamp,
      userType}) async {
    return await userDataCaretaker
        .doc(userID)
        .set(userModelCaretaker(
            userName: userName,
            chooseCommunity: chooseCommunity,
            traditionalBirthAttendant: traditionalBirthAttendant,
            userBirthAttended: userBirthAttended,
            userEmail: userEmail,
            userPassword: userPassword,
            userConfirmPassword: userConfirmPassword,
            userId: userID,
            userTimeStamp: userTimeStamp,
            userType: userType))
        .then((value) => {
              userNameController.clear(),
              userEmailController.clear(),
              userPasswordController.clear(),
              userConfirmPasswordController.clear(),
              isLoading.value = false,
              Get.offAll(CaretakerBottomNavigationScreen()),
              log(" caretaker signUp successfully")
            });
  }

  Future<void> getCareTakerData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('caretaker_users').get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

           careTakerId = data['userId'];

          if(FirebaseAuth.instance.currentUser!.uid==careTakerId){
            careTakerCenterName = data['chooseCommunity'];
            careTakerName = data['name'];


            log("This is careTakerId $careTakerId");
            log("This is CaredTakerName $careTakerName");
            log("This is chooseCommunity $careTakerCenterName");

          }else{
            log('There is No Match');
          }

        });
      }
    } catch (e) {
      Get.snackbar(
        "An Error ",
        e.toString(),
        backgroundColor: CustomColors.mainAppColor,
        colorText: Colors.white,
      );
    }
  }
}
