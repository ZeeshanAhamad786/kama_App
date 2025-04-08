// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kama_app/Utils/Colors/Colors.dart';
// import 'package:kama_app/View/CaretakerScreens/caretaker_add_new_patient_medical_details.dart';
// import '../../Model/caretaker/user_model_patient_personal_details.dart';
//
// class AlertPatientDataController extends GetxController {
//   final TextEditingController userNameController = TextEditingController();
//   final TextEditingController userInitialController = TextEditingController();
//   final TextEditingController userLastPeriodController = TextEditingController();
//   final TextEditingController userPreviousPregnanciesController = TextEditingController();
//   final TextEditingController userMaritalStatusController = TextEditingController();
//   final TextEditingController userLevelOfEducationController = TextEditingController();
//   final TextEditingController userReligionAndSourceOfIncomeController = TextEditingController();
//   final TextEditingController userEthnicityController = TextEditingController();
//   final TextEditingController userMedicalConditionController = TextEditingController();
//   final TextEditingController userNoOfChildrenAndYearOfDeliveryController = TextEditingController();
//   final TextEditingController estimatedGestationalAgeController = TextEditingController();
//   final TextEditingController sFHController = TextEditingController();
//   final TextEditingController fetalHeartRateController = TextEditingController();
//   final TextEditingController weightController = TextEditingController();
//   final TextEditingController heightController = TextEditingController();
//   final TextEditingController bMIController = TextEditingController();
//   final TextEditingController bPController = TextEditingController();
//   final TextEditingController urineTestController = TextEditingController();
//   final TextEditingController glucoseLevelController = TextEditingController();
//   final TextEditingController bloodLevelController = TextEditingController();
//   final TextEditingController temperatureController = TextEditingController();
//   final TextEditingController tTAndiPTController = TextEditingController();
//   var isLoading = false.obs;
//   Rx<DateTime?> date = Rx<DateTime?>(null);
//   dateString(){
//     if(date.value ==null){
//       return "";
//     }else{
//       return "${date.value?.day}-${date.value?.month}-${date.value?.year}";
//     }
//   }
//
//   final userAlertPatientData = FirebaseFirestore.instance.collection("alert_patient").withConverter(
//     fromFirestore: (snapshot, context) => PatientModel.fromJson(snapshot.data()!),
//     toFirestore: (alert_patient, context) => alert_patient.toJson(),
//   );
//
//   Future<void> alertPatientDataHandler({
//     required DateTime? selectedDate,
//     userName,
//     userInitial,
//     userLastPeriod,
//     userPreviousPregnancies,
//     userVaginalDelivery,
//     userMaritalStatus,
//     userLevelOfEducation,
//     userReligionAndSourceOfIncome,
//     userEthnicity,
//     userMedicalCondition,
//     userNoOfChildrenAndYearOfDelivery,
//     estimatedGestationalAge,
//     sFH,
//     fetalHeartRate,
//     weight,
//     height,
//     bMI,
//     bP,
//     urineTest,
//     glucoseLevel,
//     bloodLevel,
//     temperature,
//     tTAndiPT,
//     userId,
//   }) async {
//     if (
//     userNameController.text.isNotEmpty &&
//         userInitialController.text.isNotEmpty &&
//         userLastPeriodController.text.isNotEmpty &&
//         userPreviousPregnanciesController.text.isNotEmpty &&
//         userMaritalStatusController.text.isNotEmpty &&
//         userLevelOfEducationController.text.isNotEmpty &&
//         userReligionAndSourceOfIncomeController.text.isNotEmpty &&
//         userEthnicityController.text.isNotEmpty &&
//         userMedicalConditionController.text.isNotEmpty &&
//         userNoOfChildrenAndYearOfDeliveryController.text.isNotEmpty &&
//         estimatedGestationalAgeController.text.isNotEmpty &&
//         sFHController.text.isNotEmpty &&
//         fetalHeartRateController.text.isNotEmpty &&
//         weightController.text.isNotEmpty &&
//         heightController.text.isNotEmpty &&
//         bMIController.text.isNotEmpty &&
//         bPController.text.isNotEmpty &&
//         urineTestController.text.isNotEmpty &&
//         glucoseLevelController.text.isNotEmpty &&
//         bloodLevelController.text.isNotEmpty &&
//         temperatureController.text.isNotEmpty &&
//         tTAndiPTController.text.isNotEmpty) {
//       try {
//         isLoading.value = true;
//         User? user = FirebaseAuth.instance.currentUser!;
//         if (user != null) {
//           await addUserAlertPatientData(
//             user.uid,
//             selectedDate: selectedDate,
//             userName: userName,
//             userInitial: userInitial,
//             userLastPeriod: userLastPeriod,
//             userPreviousPregnancies: userPreviousPregnancies,
//             userVaginalDelivery: userVaginalDelivery,
//             userMaritalStatus: userMaritalStatus,
//             userLevelOfEducation: userLevelOfEducation,
//             userReligionAndSourceOfIncome: userReligionAndSourceOfIncome,
//             userEthnicity: userEthnicity,
//             userMedicalCondition: userMedicalCondition,
//             userNoOfChildrenAndYearOfDelivery: userNoOfChildrenAndYearOfDelivery,
//             estimatedGestationalAge: estimatedGestationalAge,
//             sFH: sFH,
//             fetalHeartRate: fetalHeartRate,
//             weight: weight,
//             height: height,
//             bMI: bMI,
//             bP: bP,
//             urineTest: urineTest,
//             glucoseLevel: glucoseLevel,
//             bloodLevel: bloodLevel,
//             temperature: temperature,
//             tTAndiPT: tTAndiPT,
//           );
//         }
//       } on FirebaseAuthException catch (e) {
//         isLoading.value = false;
//         log("something went wrong");
//       }
//     } else {
//       isLoading.value = false;
//       Get.snackbar(
//         backgroundColor: CustomColors.mainAppColor,
//         colorText: Colors.white,
//         "Error",
//         "All fields are required",
//       );
//     }
//   }
//
//   Future<void> addUserAlertPatientData(
//       userID, {
//         DateTime? selectedDate,
//         userName,
//         userInitial,
//         userLastPeriod,
//         userPreviousPregnancies,
//         userVaginalDelivery,
//         userMaritalStatus,
//         userLevelOfEducation,
//         userReligionAndSourceOfIncome,
//         userEthnicity,
//         userMedicalCondition,
//         userNoOfChildrenAndYearOfDelivery,
//         estimatedGestationalAge,
//         sFH,
//         fetalHeartRate,
//         weight,
//         height,
//         bMI,
//         bP,
//         urineTest,
//         glucoseLevel,
//         bloodLevel,
//         temperature,
//         tTAndiPT,
//       }) async {
//     return await userAlertPatientData .doc().set(
//       PatientModel(
//         selectedDate: selectedDate,
//         userName: userName,
//         userInitial: userInitial,
//         userLastPeriod: userLastPeriod,
//         userPreviousPregnancies: userPreviousPregnancies,
//         userVaginalDelivery: userVaginalDelivery,
//         userMaritalStatus: userMaritalStatus,
//         userLevelOfEducation: userLevelOfEducation,
//         userReligionAndSourceOfIncome: userReligionAndSourceOfIncome,
//         userEthnicity: userEthnicity,
//         userMedicalCondition: userMedicalCondition,
//         userNoOfChildrenAndYearOfDelivery: userNoOfChildrenAndYearOfDelivery,
//         estimatedGestationalAge: estimatedGestationalAge,
//         sFH: sFH,
//         fetalHeartRate: fetalHeartRate,
//         weight: weight,
//         height: height,
//         bMI: bMI,
//         bP: bP,
//         urineTest: urineTest,
//         glucoseLevel: glucoseLevel,
//         bloodLevel: bloodLevel,
//         temperature: temperature,
//         tTAndiPT: tTAndiPT,
//         userId: userID,
//       ),
//     )
//
//         .then((value)async {
//       // await  patientDataList.doc(userID).set(PatientDataListModel(
//       //       patientDataList: []
//       //   ));
//       isLoading.value = false;
//       Get.snackbar(
//         backgroundColor: CustomColors.mainAppColor,
//         colorText: Colors.white,
//         "Note",
//         "Successfully Upload Data",
//       );
//       log("data successfully");
//       // userNameController.clear();
//       // userInitialController.clear();
//       // userLastPeriodController.clear();
//       // userPreviousPregnanciesController.clear();
//       // userMaritalStatusController.clear();
//       // userLevelOfEducationController.clear();
//       // userReligionAndSourceOfIncomeController.clear();
//       // userEthnicityController.clear();
//       // userMedicalConditionController.clear();
//       // userNoOfChildrenAndYearOfDeliveryController.clear();
//       // estimatedGestationalAgeController.clear();
//       // sFHController.clear();
//       // fetalHeartRateController.clear();
//       // weightController.clear();
//       // heightController.clear();
//       // bMIController.clear();
//       // bPController.clear();
//       // urineTestController.clear();
//       // glucoseLevelController.clear();
//       // bloodLevelController.clear();
//       // temperatureController.clear();
//       // tTAndiPTController.clear();
//       Get.to(CaretakerAddNewPatientMedicalDetails());
//     },
//     );
//
//
//   }
// }
//
