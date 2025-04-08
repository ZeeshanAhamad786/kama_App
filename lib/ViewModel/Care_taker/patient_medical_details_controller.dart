import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_add_new_patient_medical_details.dart';

import '../../Model/caretaker/user_model_patient_medical_details.dart';


class PatientMedicalDetailsController extends GetxController{

  final TextEditingController estimatedGestationalAgeController =TextEditingController();
  final TextEditingController sFHController =TextEditingController();
  final TextEditingController fetalHeartRateController  =TextEditingController();
  final TextEditingController weightController  =TextEditingController();
  final TextEditingController heightController  =TextEditingController();
  final TextEditingController bMIController  =TextEditingController();
  final TextEditingController bPController  =TextEditingController();
  final TextEditingController urineTestController  =TextEditingController();
  final TextEditingController glucoseLevelController  =TextEditingController();
  final TextEditingController bloodLevelController  =TextEditingController();
  final TextEditingController temperatureController  =TextEditingController();
  final TextEditingController tTAndiPTController  =TextEditingController();
  var isLoading =false.obs;



  Rx<DateTime?> date = Rx<DateTime?>(null);
  dateString(){
    if(date.value ==null){
      return "";
    }else{
      return "${date.value?.day}-${date.value?.month}-${date.value?.year}";
    }
  }



  final userPatientMedicalData=  FirebaseFirestore.instance.collection("patient_medical_details").
  withConverter(
      fromFirestore: (snapshot,context)=>MedicalDetailsModel.fromJson(snapshot.data()!),
      toFirestore: (patient_medical_details,context)=>patient_medical_details.toJson());


  Future<void> patientMedicalDetailsHandler({
    DateTime? selectedDate,
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

  })async{
    if(
    estimatedGestationalAgeController.text.isNotEmpty&&
        sFHController.text.isNotEmpty&&
        fetalHeartRateController.text.isNotEmpty&&
        weightController.text.isNotEmpty&&
        heightController.text.isNotEmpty&&
        bMIController.text.isNotEmpty&&
        bPController.text.isNotEmpty&&
        urineTestController.text.isNotEmpty&&
        glucoseLevelController.text.isNotEmpty&&
        bloodLevelController.text.isNotEmpty&&
        temperatureController.text.isNotEmpty&&
        tTAndiPTController.text.isNotEmpty
    ){
      try{
        // formatDate();
        isLoading.value=true;
      User? user =FirebaseAuth.instance.currentUser!;



      if(user.toString().isNotEmpty){
        await addUserMedicalDetails(
          user.uid,
        selectedDate:selectedDate,
        estimatedGestationalAge:estimatedGestationalAge,
        sFH:sFH,
        fetalHeartRate:fetalHeartRate,
        weight:weight,
        height:height,
        bMI:bMI,
        bP:bP,
        urineTest:urineTest,
        glucoseLevel:glucoseLevel,
          bloodLevel:bloodLevel,
       temperature:temperature,
       tTAndiPT:tTAndiPT,
        );
      }
      }on  FirebaseAuthException catch (e){
        isLoading.value=false;
        log("something went wrong");
      }
    }else{isLoading.value=false;
    Get.snackbar(backgroundColor: CustomColors.mainAppColor,colorText: Colors.white,
        "Error", "All fields are required");
    }
  }
  Future<void>addUserMedicalDetails(userID,
      {
        DateTime? selectedDate,
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
      })async{
    return await userPatientMedicalData.doc(userID).set(MedicalDetailsModel(
      selectedDate:selectedDate,
      estimatedGestationalAge:estimatedGestationalAge,
      sFH:sFH,
      fetalHeartRate:fetalHeartRate,
      weight:weight,
      height:height,
      bMI:bMI,
      bP:bP,
      urineTest:urineTest,
      glucoseLevel:glucoseLevel,
      temperature:temperature,
      bloodLevel: bloodLevel,
      tTAndiPT:tTAndiPT,
      userId: userID
    )).then((value) => {
      isLoading.value=false,
      Get.snackbar(backgroundColor:CustomColors.mainAppColor,colorText: Colors.white,

          "Note", "Successfully Upload Data"),
      log("data successfully"),
      // userNameController.clear(),
      // userInitialController.clear(),
      // userLastPeriodController.clear(),
      // userPreviousPregnanciesController.clear(),
      // userMaritalStatusController.clear(),
      // userLevelOfEducationController.clear(),
      // userReligionAndSourceOfIncomeController.clear(),
      // userEthnicityController.clear(),
      // userMedicalConditionController.clear(),
      // userNoOfChildrenAndYearOfDeliveryController.clear(),
      Get.to(CaretakerAddNewPatientMedicalDetails(veginalDelivery: '',))
    });

  }





}