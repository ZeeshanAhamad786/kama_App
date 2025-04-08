import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import '../../Model/caretaker/patient_data_list.dart';
import '../../Model/caretaker/user_model_patient_personal_details.dart';

class PatientPersonalDetailsController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userInitialController = TextEditingController();
  final TextEditingController userLastPeriodController = TextEditingController();
  final TextEditingController userPreviousPregnanciesController = TextEditingController();
  final TextEditingController userMaritalStatusController = TextEditingController();
  final TextEditingController userLevelOfEducationController = TextEditingController();
  final TextEditingController userReligionController = TextEditingController();
  final TextEditingController userSourceOfIncomeController = TextEditingController();
  final TextEditingController userAgeController = TextEditingController();
  final TextEditingController userEthnicityController = TextEditingController();
  final TextEditingController userMedicalConditionController = TextEditingController();
  final TextEditingController userNoOfChildrenAndYearOfDeliveryController = TextEditingController();
  final TextEditingController estimatedGestationalAgeController = TextEditingController();
  final TextEditingController sFHController = TextEditingController();
  final TextEditingController fetalHeartRateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController bMIController = TextEditingController();
  final TextEditingController bPController = TextEditingController();
  final TextEditingController urineTestController = TextEditingController();
  final TextEditingController glucoseLevelController = TextEditingController();
  final TextEditingController bloodLevelController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController tTAndiPTController = TextEditingController();
  String? patientName;
  List<String>patientList=[];
  RxBool loading=false.obs;
  var isLoading = false.obs;
  Rx<DateTime?> date = Rx<DateTime?>(null);
  dateString(){
    if(date.value ==null){
      return "";
    }else{
      return "${date.value?.day}-${date.value?.month}-${date.value?.year}";
    }
  }

  final userPatientData = FirebaseFirestore.instance.collection("patient_data").withConverter(
    fromFirestore: (snapshot, context) => PatientModel.fromJson(snapshot.data()!),
    toFirestore: (patient_data, context) => patient_data.toJson(),
  );

  final patientDataList = FirebaseFirestore.instance
      .collection('patientDataList')
      .withConverter<PatientDataListModel>(
    fromFirestore: (snapshot, _) =>
        PatientDataListModel.fromJson(snapshot.data()!),
    toFirestore: (patientDataList, _) => patientDataList.toJson(),
  );
  Future<void> storePatientData(
      {
    required DateTime? selectedDate,
    userName,
    userInitial,
    userLastPeriod,
    userPreviousPregnancies,
    userVaginalDelivery,
    userMaritalStatus,
    userLevelOfEducation,
        userReligion,
        userSourceOfIncome,
        userAge,
    userEthnicity,
    userMedicalCondition,
    userNoOfChildrenAndYearOfDelivery,
    estimatedGestationalAge,
    sFH,
    fetalHeartRate,
    weight,
    height,
    bMI,
    bP,
    urineTest,
    glucoseLevel,
    bloodLevel,
    temperature,
    tTAndiPT,
    userId,
        required vaginalDelivery,
        centerName,
        status

  }) async {
    if (
    userNameController.text.isNotEmpty &&
        userInitialController.text.isNotEmpty &&
        userLastPeriodController.text.isNotEmpty &&
        userPreviousPregnanciesController.text.isNotEmpty &&
        userMaritalStatusController.text.isNotEmpty &&
        userLevelOfEducationController.text.isNotEmpty &&
        userReligionController.text.isNotEmpty &&
        userSourceOfIncomeController.text.isNotEmpty &&
        userAgeController.text.isNotEmpty &&
        userEthnicityController.text.isNotEmpty &&
        userMedicalConditionController.text.isNotEmpty &&
        userNoOfChildrenAndYearOfDeliveryController.text.isNotEmpty &&
        estimatedGestationalAgeController.text.isNotEmpty &&
        sFHController.text.isNotEmpty &&
        fetalHeartRateController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        bMIController.text.isNotEmpty &&
        bPController.text.isNotEmpty &&
        urineTestController.text.isNotEmpty &&
        glucoseLevelController.text.isNotEmpty &&
        bloodLevelController.text.isNotEmpty &&
        temperatureController.text.isNotEmpty &&
        tTAndiPTController.text.isNotEmpty) {
      try {
        isLoading.value = true;
        User? user = FirebaseAuth.instance.currentUser!;
        if (user != null) {
          await addUserPatientData(

            user.uid,
            selectedDate: selectedDate,
            userName: userName,
            userInitial: userInitial,
            userLastPeriod: userLastPeriod,
            userPreviousPregnancies: userPreviousPregnancies,
            userVaginalDelivery: userVaginalDelivery,
            userMaritalStatus: userMaritalStatus,
            userLevelOfEducation: userLevelOfEducation,
              userReligion: userReligion,
              userSourceOfIncome: userSourceOfIncome,
              userAge: userAge,
            userEthnicity: userEthnicity,
            userMedicalCondition: userMedicalCondition,
            userNoOfChildrenAndYearOfDelivery: userNoOfChildrenAndYearOfDelivery,
            estimatedGestationalAge: estimatedGestationalAge,
            sFH: sFH,
            fetalHeartRate: fetalHeartRate,
            weight: weight,
            height: height,
            bMI: bMI,
            bP: bP,
            urineTest: urineTest,
            glucoseLevel: glucoseLevel,
            bloodLevel: bloodLevel,
            temperature: temperature,
            tTAndiPT: tTAndiPT,
            centerName:centerName ,
            vaginalDelivery: vaginalDelivery,
              status:status,
            patientId: userId
          );
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        log("something went wrong");
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

  Future<void> addUserPatientData(

      userID, {
        DateTime? selectedDate,
        centerName,
        vaginalDelivery,
        userName,
        userInitial,
        userLastPeriod,
        userPreviousPregnancies,
        userVaginalDelivery,
        userMaritalStatus,
        userLevelOfEducation,
        userReligion,
        userSourceOfIncome,
        userAge,
        userEthnicity,
        userMedicalCondition,
        userNoOfChildrenAndYearOfDelivery,
        estimatedGestationalAge,
        sFH,
        fetalHeartRate,
        weight,
        height,
        bMI,
        bP,
        urineTest,
        glucoseLevel,
        bloodLevel,
        temperature,
        tTAndiPT,
        status,
        patientId
      }) async {
    return await userPatientData .doc().set(
      PatientModel(centerName:centerName ,vaginalDelivery: vaginalDelivery,
        selectedDate: selectedDate,
        userName: userName,
        userInitial: userInitial,
        userLastPeriod: userLastPeriod,
        userPreviousPregnancies: userPreviousPregnancies,
        userVaginalDelivery: userVaginalDelivery,
        userMaritalStatus: userMaritalStatus,
        userLevelOfEducation: userLevelOfEducation,
          userReligion: userReligion,
          userSourceOfIncome: userSourceOfIncome,
          userAge: userAge,
        userEthnicity: userEthnicity,
        userMedicalCondition: userMedicalCondition,
        userNoOfChildrenAndYearOfDelivery: userNoOfChildrenAndYearOfDelivery,
        estimatedGestationalAge: estimatedGestationalAge,
        sFH: sFH,
        fetalHeartRate: fetalHeartRate,
        weight: weight,
        height: height,
        bMI: bMI,
        bP: bP,
        urineTest: urineTest,
        glucoseLevel: glucoseLevel,
        bloodLevel: bloodLevel,
        temperature: temperature,
        tTAndiPT: tTAndiPT,
        userId: patientId,
        status: status
      ),
    )

        .then((value)async {

      isLoading.value = false;
      Get.snackbar(
        backgroundColor: CustomColors.mainAppColor,
        colorText: Colors.white,
        "Note",
        "Successfully Upload Data",
      );
      log("data successfully");
      userNameController.clear();
      userInitialController.clear();
      userLastPeriodController.clear();
      userPreviousPregnanciesController.clear();
      userMaritalStatusController.clear();
      userLevelOfEducationController.clear();
      userReligionController.clear();
      userSourceOfIncomeController.clear();
      userAgeController.clear();
      userEthnicityController.clear();
      userMedicalConditionController.clear();
      userNoOfChildrenAndYearOfDeliveryController.clear();
      estimatedGestationalAgeController.clear();
      sFHController.clear();
      fetalHeartRateController.clear();
      weightController.clear();
      heightController.clear();
      bMIController.clear();
      bPController.clear();
      urineTestController.clear();
      glucoseLevelController.clear();
      bloodLevelController.clear();
      temperatureController.clear();
      tTAndiPTController.clear();
      Get.to(CaretakerBottomNavigationScreen());
    },
    );


  }
  Future<void> getPatientData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('patient_data').get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

          patientName = data['userName'];
          if(!patientList.contains(patientName)){
            patientList.add(patientName!);

          }
          log('The Total Length of Patent are ${patientList}');


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
