import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Model/caretaker/user_model_patient_personal_details.dart';
class GetUserDataPersonalDetails extends GetxController{
  // RxList<dynamic> userData =[].obs;
  var isGetUserDataLoading =false.obs;
  PatientModel? patientModel;
  Rxn<PatientModel> getUserDataPersonalDetailsRxModel =Rxn<PatientModel>();

  final userPatientPersonalData  =FirebaseFirestore.instance.collection("patient_personal_details")
      .withConverter<PatientModel>(
      fromFirestore: (snapshot, context)=>PatientModel.fromJson(snapshot.data()!),
      toFirestore: (patient_personal_details ,context)=>patient_personal_details.toJson());
  getUserDataPersonalDetails({userId})
  async{
    isGetUserDataLoading.value =true;
    patientModel =await  (userPatientPersonalData.
    doc().get().
    then((snapshot) => snapshot.data()));
    getUserDataPersonalDetailsRxModel.value=patientModel;
    isGetUserDataLoading.value=false;


    log('userData list length '
        ' ${getUserDataPersonalDetailsRxModel.value!.userName}');
  }

}