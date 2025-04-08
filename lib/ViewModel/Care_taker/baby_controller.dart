import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/caretaker/baby_model.dart';
import '../../Utils/Colors/Colors.dart';
class  BabyModelController extends GetxController{

  TextEditingController addTextController =TextEditingController();
  TextEditingController numberOfBabiesController =TextEditingController();
  TextEditingController babyWeightController =TextEditingController();
  var selectedPregnancy;
  var addTextComment;
  var deliveryCase;
  var noOfBabies;
  var selectedDate1;
  var selectedTime;
  var Gender;

  var bodyWeight;
  var userId;
  var baby;
  var patientId;
  List babyDataList=[];
  var isLoading=false.obs;
  final addBabyData=FirebaseFirestore.instance.collection("baby_data").withConverter<BabyModel>(
      fromFirestore: (snapshot,_)=>BabyModel.fromJson(snapshot.data()!),
      toFirestore: (baby_data,_)=>baby_data.tojson());

  babyHandler({
    selectedPregnancy,
    addTextComment,
    deliveryCase,
    noOfBabies,
    DateTime? selectedDate,
    String? selectedTime,
    String? selectedGender,
    bodyWeight,
    userId,
    baby,
    patientId,
  })async{
    if(addTextController.text.isNotEmpty&&
        numberOfBabiesController.text.isNotEmpty&&
        babyWeightController.text.isNotEmpty
    ){
      try{
        User? user =FirebaseAuth.instance.currentUser;
        if(user !=null){
          await addBabyDetails(
            user.uid,
            selectedPregnancy:selectedPregnancy,
            addTextComment:addTextComment,
            deliveryCase:deliveryCase,
            noOfBabies:noOfBabies,
            selectedDate:selectedDate,
            selectedTime:selectedTime,
            Gender:selectedGender,
            bodyWeight:bodyWeight,
            baby:baby,
            patientId:patientId,

          );
        }

      }on FirebaseAuthException catch (e){
        log("$e");
      }

    }else {
      Get.snackbar("Error", "All fields are required");
    }
  }
  Future<void> addBabyDetails(
      userID, { selectedPregnancy,
        addTextComment,
        deliveryCase,
        noOfBabies,
        DateTime? selectedDate,
        selectedTime,
        Gender,
        bodyWeight,
        userId,
        baby,
        patientId,
      }
      )async{
    isLoading.value=true;
    await addBabyData.doc().set(BabyModel(
        selectedPregnancy:selectedPregnancy,
        addTextComment:addTextComment,
        deliveryCase:deliveryCase,
        noOfBabies:noOfBabies,
        selectedDate1:selectedDate,
        selectedTime:selectedTime,
        Gender:Gender,
        bodyWeight:bodyWeight,
        userId: userID,
        baby:baby,
        patientId:patientId

    )).then((value) => {
      isLoading.value=false,
      addTextController.clear(),
      numberOfBabiesController.clear(),
      babyWeightController.clear(),
    });
  }

  Future<void> getBabyData(var currentPatientId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('baby_data').where("patientId",isEqualTo: currentPatientId).get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

          selectedPregnancy = data['selectedPregnancy'];
          addTextComment = data['addTextComment'];
          deliveryCase = data['deliveryCase'];
          noOfBabies = data['noOfBabies'];
          selectedDate1 = data['selectedDate'];
          selectedTime = data['selectedTime'];
          Gender = data['gender'];
          bodyWeight = data['bodyWeight'];
          userId = data['userId'];
          baby = data['baby'];
          patientId = data['patientId'];
          if(!babyDataList.contains(patientId)){
            babyDataList.add(patientId);

          }

        });
      }else{
        log('No Data');
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