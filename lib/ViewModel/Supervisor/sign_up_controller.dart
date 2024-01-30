import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kama_app/Model/user_model.dart';
import 'package:kama_app/validations/validation.dart';

class SignUpController extends GetxController {
  final TextEditingController userNameOfStaffController = TextEditingController();
  final TextEditingController userFacilityPracticeController = TextEditingController();
  final TextEditingController userCadreOfSupervisorController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();
  final TextEditingController userLocalGovtController = TextEditingController();
  final TextEditingController userChoChargeController = TextEditingController();
  final TextEditingController userApexOicController = TextEditingController();
  final TextEditingController userHeadOfUnitController = TextEditingController();
  final TextEditingController userPhoneNumberController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userAlternateController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final TextEditingController userConfirmPasswordController = TextEditingController();

  var loading =false.obs;

// set firestore data to model
  final userData = FirebaseFirestore.instance.collection("supervisor_users")
      .withConverter<UserModel>(
      fromFirestore: (snapshot, context) =>
          UserModel.fromJson(snapshot.data()!),
      toFirestore: (supervisor_users, context) => supervisor_users.toJson());

// signup Handler
  Future<void> signUpHandler({
    userNameOfStaff,
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
    userAlternatePassword,
    userPassword,
    userConfirmPassword,
    userId,
    userTimestamp,
    selectedModel,

  }) async {
    if (
    userNameOfStaffController.text.isNotEmpty &&
        userFacilityPracticeController.text.isNotEmpty &&
        userCadreOfSupervisorController.text.isNotEmpty &&
        userAddressController.text.isNotEmpty &&
        userAddressController.text.isNotEmpty &&
        userChoChargeController.text.isNotEmpty &&
        userApexOicController.text.isNotEmpty &&
        userHeadOfUnitController.text.isNotEmpty &&
        userPhoneNumberController.text.isNotEmpty &&
        userEmailController.text.isNotEmpty &&
        userAlternateController.text.isNotEmpty &&
        userPasswordController.text.isNotEmpty &&
        userConfirmPasswordController.text.isNotEmpty
    )
      try {
        // user create with email and password
       loading.value=true;
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: userEmailName,
            password: userPassword);
// current user
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
            userAlternatePassword: userAlternatePassword,
            userPassword: userPassword,
            userConfirmPassword: userConfirmPassword,
            userTimestamp: myTimeStamp.toDate().toString(),
            selectedModel: selectedModel

          );
        }
      } on FirebaseAuthException catch (e) {
        loading.value=false;
   Get.snackbar("Error",Validations.handleFirebaseAuthError(e.toString()));


      }else{
      loading.value=false;
      Get.snackbar("Error", "All fields are required");
    }
  }

  Future<void> addUser(UserID,
      {
        userNameOfStaff,
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
        userAlternatePassword,
        userPassword,
        userConfirmPassword,
        userTimestamp,
        selectedModel,
      })
async {
   return await userData.doc(UserID).set(UserModel(
       userNameOfStaff:userNameOfStaff,
       userFacilityOfPractice:  userFacilityOfPractice,
       userCadreOfSupervisor:userCadreOfSupervisor,
       userAddress:userAddress,
       userLocalGovtArea:userLocalGovtArea,
       selectedState:selectedState,
       userChoInCharge:userChoInCharge,
       userApexOic:userApexOic,
       userHeadOfUnit:userHeadOfUnit,
       userPhoneNumber:userPhoneNumber,
       userEmailName:userEmailName,
       userAlternatePassword:userAlternatePassword,
       userPassword:userPassword,
       userConfirmPassword:userConfirmPassword,
       userTimestamp:userTimestamp,
     userId: UserID,
     selectedModel: selectedModel,

   )).then((value) {
     loading.value=false;
     log("Data Added Successfully");
   }
   );
}}