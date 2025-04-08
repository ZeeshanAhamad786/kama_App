// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:kama_app/Model/caretaker/user_model_patient_personal_details.dart';
//
// class GetUserDataSupervisorPersonalDetails extends GetxController {
//   RxList<dynamic> userDataSupervisorPersonalDetails = [].obs;
//   var isLoading = false.obs;
//   PersonalDetailsModel? personalDetailsModel;
//   Rxn<PersonalDetailsModel> getUserDataSupervisorPersonalDetailsRxnModel = Rxn<
//       PersonalDetailsModel>();
//   final userPatientPersonalData = FirebaseFirestore.instance.collection(
//       "patient_personal_details").withConverter<PersonalDetailsModel>(
//       fromFirestore: (snapshot, _) =>
//           PersonalDetailsModel.fromJson(snapshot.data()!),
//       toFirestore: (patient_personal_details, _) =>
//           patient_personal_details.toJson());
//
//   getUserDataSupervisorPersonalDetails({userId}) async {
//     isLoading.value = true;
//     personalDetailsModel = await (userPatientPersonalData.doc(userId ?? FirebaseAuth.instance.currentUser
//        ).get().
//     then((snapshot) => snapshot.data()));
//     getUserDataSupervisorPersonalDetailsRxnModel.value = personalDetailsModel;
//     isLoading.value = false;
//
//     if (!userDataSupervisorPersonalDetails.contains(
//         getUserDataSupervisorPersonalDetailsRxnModel.value?.userName));
//
//       userDataSupervisorPersonalDetails.add(
//           getUserDataSupervisorPersonalDetailsRxnModel.value?.userName);
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value?.userInitial));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value?.userInitial);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value?.userLastPeriod));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value?.userLastPeriod);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userPreviousPregnancies));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userPreviousPregnancies);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userVaginalDelivery));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userVaginalDelivery);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userMaritalStatus));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userMaritalStatus);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userLevelOfEducation));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userLevelOfEducation);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userReligionAndSourceOfIncome));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userReligionAndSourceOfIncome);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value?.userEthnicity));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value?.userEthnicity);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userMedicalCondition));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userMedicalCondition);
//       }
//       if (!userDataSupervisorPersonalDetails.contains(
//           getUserDataSupervisorPersonalDetailsRxnModel.value
//               ?.userNoOfChildrenAndYearOfDelivery));
//       {
//         userDataSupervisorPersonalDetails.add(
//             getUserDataSupervisorPersonalDetailsRxnModel.value
//                 ?.userNoOfChildrenAndYearOfDelivery);
//       }
//
//       log("The data is : ${userDataSupervisorPersonalDetails.length}");
//
//   }
// }
//
//
//
//
