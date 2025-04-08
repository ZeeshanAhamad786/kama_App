import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../Model/caretaker/user_model_patient_medical_details.dart';

class GetUserDataMedicalDetails extends GetxController{
  var isGetLoading =false.obs;

  Rxn<MedicalDetailsModel>   getUserDataMedicalDetailsRxModel =Rxn<MedicalDetailsModel>();
  MedicalDetailsModel? medicalDetailsModel;
final userPatientMedicalData =FirebaseFirestore.instance.collection("patient_medical_details").
withConverter<MedicalDetailsModel>(
    fromFirestore: (snapshot,context)=>MedicalDetailsModel.fromJson(snapshot.data()!),
    toFirestore: (patient_medical_details,context)=>patient_medical_details.toJson());

getUserDataMedicalDetails({userId})async {
  isGetLoading.value = true;
  medicalDetailsModel = (await userPatientMedicalData.doc(
      userId ?? FirebaseAuth.instance.currentUser?.uid).get().
  then((snapshot) => snapshot.data()));
  getUserDataMedicalDetailsRxModel.value = medicalDetailsModel;
  isGetLoading.value = false;
  log("The data is :${getUserDataMedicalDetailsRxModel.value!.temperature}");

}
}
