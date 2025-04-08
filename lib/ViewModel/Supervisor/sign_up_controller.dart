import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Model/supervisor/user_model.dart';
import '../../Utils/Colors/Colors.dart';
import '../../View/BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController userNameOfStaffController =
      TextEditingController();
  final TextEditingController userFacilityPracticeController =
      TextEditingController();
  final TextEditingController userCadreOfSupervisorController =
      TextEditingController();
  final TextEditingController userAddressController = TextEditingController();
  final TextEditingController userLocalGovtController = TextEditingController();
  final TextEditingController userChoChargeController = TextEditingController();
  final TextEditingController userApexOicController = TextEditingController();
  final TextEditingController userHeadOfUnitController =
      TextEditingController();
  final TextEditingController userPhoneNumberController =
      TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userAlternateController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final TextEditingController userConfirmPasswordController =
      TextEditingController();
  String? superVisorName;
  String? superVisorId;
  String? deviceId;
  var loading = false.obs;
  List<String> deviceIdList = [];

// set firestore data to model
  final userData = FirebaseFirestore.instance
      .collection("supervisor_users")
      .withConverter<UserModel>(
          fromFirestore: (snapshot, context) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (supervisor_users, context) =>
              supervisor_users.toJson());

  Future<void> signUpHandler(
      {userNameOfStaff,
      userFacilityOfPractice,
      userCadreOfSupervisor,
      userAddress,
      userLocalGovtArea,
      selectedState,
      userChoInCharge,
      userApexOic,
      userHeadOfUnit,
      userPhoneNumber,
      userEmailName,
        userAlternateContact,
      userPassword,
      userConfirmPassword,
      userId,
      userTimestamp,
      selectedModel,
      userType,
      deviceToken}) async {
    if (userNameOfStaffController.text.isNotEmpty &&
        userFacilityPracticeController.text.isNotEmpty &&
        userCadreOfSupervisorController.text.isNotEmpty &&
        userAddressController.text.isNotEmpty &&
        userLocalGovtController.text.isNotEmpty &&
        userChoChargeController.text.isNotEmpty &&
        userApexOicController.text.isNotEmpty &&
        userHeadOfUnitController.text.isNotEmpty &&

        userEmailController.text.isNotEmpty &&
        userAlternateController.text.isNotEmpty &&
        userPasswordController.text.isNotEmpty &&
        userConfirmPasswordController.text.isNotEmpty) {
      if (userPasswordController.text.length >= 8) {
        if (userPasswordController.text == userConfirmPasswordController.text) {
          // if (userAlternateController.text.length == 11) {
          //   if (userAlternateController.text.length == 11) {
              RegExp emailRegex =
                  RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
              if (emailRegex.hasMatch(userEmailController.text)) {
                try {
                  loading.value = true;
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmailName, password: userPassword);

                  User? user = userCredential.user!;
                  DateTime currentDateTime = DateTime.now();
                  Timestamp myTimeStamp = Timestamp.fromDate(currentDateTime);

                  if (user.toString().isNotEmpty) {
                    addUser(user.uid,
                        userNameOfStaff: userNameOfStaff,
                        userFacilityOfPractice: userFacilityOfPractice,
                        userCadreOfSupervisor: userCadreOfSupervisor,
                        userAddress: userAddress,
                        userLocalGovtArea: userLocalGovtArea,
                        selectedState: selectedState,
                        userChoInCharge: userChoInCharge,
                        userApexOic: userApexOic,
                        userHeadOfUnit: userHeadOfUnit,
                        userPhoneNumber: userPhoneNumber,
                        userEmailName: userEmailName,
                        userAlternateContact: userAlternateContact,
                        userPassword: userPassword,
                        userConfirmPassword: userConfirmPassword,
                        userTimestamp: myTimeStamp.toDate().toString(),
                        selectedModel: selectedModel,
                        userType: userType,
                        deviceToken: deviceToken);
                  } else {
                    loading.value = false;
                    Get.snackbar("Error", "Something went wrong");
                  }
                } on FirebaseAuthException catch (e) {
                  loading.value = false;
                  Get.snackbar("Error", "Something went wrong");
                }
              } else {
                loading.value = false;
                Get.snackbar(
                  backgroundColor: CustomColors.mainAppColor,
                  "Invalid",
                  "Invalid Email Address",
                  colorText: Colors.white,
                );
              }
          //   } else {
          //     loading.value = false;
          //     Get.snackbar(
          //       backgroundColor: CustomColors.mainAppColor,
          //       "Invalid",
          //       "Invalid Phone Number",
          //       colorText: Colors.white,
          //     );
          //   }
          // } else {
          //   loading.value = false;
          //   Get.snackbar(
          //     backgroundColor: CustomColors.mainAppColor,
          //     "Invalid",
          //     "Invalid Alternate Number",
          //     colorText: Colors.white,
          //   );
          // }
        } else {
          loading.value = false;
          Get.snackbar(
            backgroundColor: CustomColors.mainAppColor,
            "Sorry",
            "Password does not match",
            colorText: Colors.white,
          );
        }
      } else {
        loading.value = false;
        Get.snackbar(
          backgroundColor: CustomColors.mainAppColor,
          "Sorry",
          "Weak Password! Please try again",
          colorText: Colors.white,
        );
      }
    } else {
      loading.value = false;
      Get.snackbar(
          backgroundColor: CustomColors.mainAppColor,
          colorText: Colors.white,
          "Error",
          "All fields are required");
    }
  }

  Future<void> addUser(UserID,
      {userNameOfStaff,
      userFacilityOfPractice,
      userCadreOfSupervisor,
      userAddress,
      userLocalGovtArea,
      selectedState,
      userChoInCharge,
      userApexOic,
      userHeadOfUnit,
      userPhoneNumber,
      userEmailName,
        userAlternateContact,
      userPassword,
      userConfirmPassword,
      userTimestamp,
      selectedModel,
      userType,
      deviceToken}) async {
    return await userData
        .doc(UserID)
        .set(UserModel(
            userNameOfStaff: userNameOfStaff,
            userFacilityOfPractice: userFacilityOfPractice,
            userCadreOfSupervisor: userCadreOfSupervisor,
            userAddress: userAddress,
            userLocalGovtArea: userLocalGovtArea,
            selectedState: selectedState,
            userChoInCharge: userChoInCharge,
            userApexOic: userApexOic,
            userHeadOfUnit: userHeadOfUnit,
            userPhoneNumber: userPhoneNumber,
            userEmailName: userEmailName,
        userAlternateContact: userAlternateContact,
            userPassword: userPassword,
            userConfirmPassword: userConfirmPassword,
            userTimestamp: userTimestamp,
            userId: UserID,
            selectedModel: selectedModel,
            userType: userType,
            deviceToken: deviceToken))
        .then((value) {
      loading.value = false;
      userNameOfStaffController.clear();
      userFacilityPracticeController.clear();
      userCadreOfSupervisorController.clear();
      userAddressController.clear();
      userLocalGovtController.clear();
      userChoChargeController.clear();
      userApexOicController.clear();
      userHeadOfUnitController.clear();
      userPhoneNumberController.clear();
      userEmailController.clear();
      userAlternateController.clear();
      userPasswordController.clear();
      userConfirmPasswordController.clear();
      log("Data Added Successfully");
      // Get.offAll(SupervisorBottomNavigationScreen());
    });
  }

  Future<void> getSuperVisorData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('supervisor_users').get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

          superVisorId = data['userId'];
          deviceId = data['deviceToken'];
          if (FirebaseAuth.instance.currentUser!.uid == superVisorId) {
              superVisorName = data['nameOfStaff'];


          } else {
            if (!deviceIdList.contains(deviceId)) {
              deviceIdList.add(deviceId!);
              log("${deviceIdList.length}");
            } else {
              log("Already have device Token");
              log("${deviceIdList.length}");
            }
            log("There are No Match");
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
  String? SuperVisorName;
  String? SuperVisorId;
  Future<void> getSuperVisor() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('supervisor_users').get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

          SuperVisorId = data['userId'];


            SuperVisorName = data['nameOfStaff'];


            log("This is SuperVisorId $SuperVisorId");
            log("This is SuperVisorName $SuperVisorName");
            log("This is FirebaseAuth.instance.currentUser!.uid ${FirebaseAuth.instance.currentUser!.uid}");



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
