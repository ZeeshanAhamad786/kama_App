import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/baby_controller.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import '../CaretakerScreens/caretaker_after_baby_add.dart';
import '../CaretakerScreens/caretaker_personal_details.dart';

class SupervisorcompletePatient extends StatefulWidget {
  const SupervisorcompletePatient({Key? key}) : super(key: key);

  @override
  State<SupervisorcompletePatient> createState() => _SupervisorcompletePatientState();
}

class _SupervisorcompletePatientState extends State<SupervisorcompletePatient> {
  PatientPersonalDetailsController patientPersonalDetailsController =
  Get.find(tag: "patientPersonalDetailsController");
  BabyModelController babyModelController =Get.find(tag: "babyModelController");
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          centerTitle: true,
          title:  Text(
            "Pending Patient Name",
            style: TextStyle(
                fontFamily: MyConstants.boldFontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white),
          )),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h,vertical: 10.h),
        child: Column(children: [
          Expanded(child: StreamBuilder(
            stream: patientPersonalDetailsController.userPatientData.where("status",isEqualTo: "complete") .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasError){
                return Text("Something went wrong");
              }else if (snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else if(!snapshot.hasData){
                return Text("No data found");
              }else if(snapshot.hasData){
                return ListView.builder(
                    physics:  BouncingScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      babyModelController.getBabyData(snapshot.data.docs[index]["userId"]);

                      return GestureDetector(onTap: () {
                        babyModelController.getBabyData(snapshot.data.docs[index]["userId"]);
                        if(babyModelController.babyDataList.contains(snapshot.data.docs[index]["userId"])  ){
                          superVisoraddCommentControllerTab1.getSenderData(snapshot.data.docs[index]["userId"]);

                          Get.to(CaretakerAfterBabyAddScreen(
                            userName: snapshot.data.docs[index]["userName"],
                            patientId: snapshot.data.docs[index]["userId"],
                            userNoOfChildrenAndYearOfDelivery: snapshot.data.docs[index]["noOfChildrenAndYearOfDelivery"],
                            userMedicalCondition: snapshot.data.docs[index]["medicalCondition"],
                            userEthnicity: snapshot.data.docs[index]["userEthnicity"],
                            userReligion: snapshot.data.docs[index]["userReligion"],
                            userSourceOfIncome: snapshot.data.docs[index]["userSourceOfIncome"],
                            userAge: snapshot.data.docs[index]["userAge"],
                            userLevelOfEducation: snapshot.data.docs[index]["levelOfEducation"],
                            userMaritalStatus: snapshot.data.docs[index]["maritalStatus"],
                            userVaginalDelivery: snapshot.data.docs[index]["vaginalDelivery"],
                            userPreviousPregnancies: snapshot.data.docs[index]["previousPregnancies"],
                            userLastPeriod: snapshot.data.docs[index]["lastPeriod"],
                            userInitial: snapshot.data.docs[index]["Initial"],
                            selectedDate: snapshot.data.docs[index]["selectedDate"]?.toDate() != null
                                ? DateFormat('dd/MM/yyyy').format(snapshot.data.docs[index]["selectedDate"].toDate())
                                : null,
                            estimatedGestationalAge: snapshot.data.docs[index]["estimatedGestationalAge"],
                            sFH: snapshot.data.docs[index]["sFH"],
                            fetalHeartRate: snapshot.data.docs[index]["fetalHeartRate"],
                            weight: snapshot.data.docs[index]["weight"],
                            height: snapshot.data.docs[index]["height"],
                            bMI: snapshot.data.docs[index]["bMI"],
                            bP: snapshot.data.docs[index]["bP"],
                            urineTest: snapshot.data.docs[index]["urineTest"],
                            glucoseLevel: snapshot.data.docs[index]["glucoseLevel"],
                            bloodLevel: snapshot.data.docs[index]["bloodLevel"],
                            temperature: snapshot.data.docs[index]["temperature"],
                            tTAndiPT: snapshot.data.docs[index]["tTAndiPT"],
                            title: 'CareTaker',

                          ));
                        }else{

                          Get.to(CaretakerPersonalDetails(
                            userName: snapshot.data.docs[index]["userName"],
                            patientId: snapshot.data.docs[index]["userId"],
                            userNoOfChildrenAndYearOfDelivery: snapshot.data.docs[index]["noOfChildrenAndYearOfDelivery"],
                            userMedicalCondition: snapshot.data.docs[index]["medicalCondition"],
                            userEthnicity: snapshot.data.docs[index]["userEthnicity"],
                            userReligion: snapshot.data.docs[index]["userReligion"],
                            userSourceOfIncome: snapshot.data.docs[index]["userSourceOfIncome"],
                            userAge: snapshot.data.docs[index]["userAge"],
                            userLevelOfEducation: snapshot.data.docs[index]["levelOfEducation"],
                            userMaritalStatus: snapshot.data.docs[index]["maritalStatus"],
                            userVaginalDelivery: snapshot.data.docs[index]["vaginalDelivery"],
                            userPreviousPregnancies: snapshot.data.docs[index]["previousPregnancies"],
                            userLastPeriod: snapshot.data.docs[index]["lastPeriod"],
                            userInitial: snapshot.data.docs[index]["Initial"],
                            selectedDate: snapshot.data.docs[index]["selectedDate"]?.toDate() != null
                                ? DateFormat('dd/MM/yyyy').format(snapshot.data.docs[index]["selectedDate"].toDate())
                                : null,
                            estimatedGestationalAge: snapshot.data.docs[index]["estimatedGestationalAge"],
                            sFH: snapshot.data.docs[index]["sFH"],
                            fetalHeartRate: snapshot.data.docs[index]["fetalHeartRate"],
                            weight: snapshot.data.docs[index]["weight"],
                            height: snapshot.data.docs[index]["height"],
                            bMI: snapshot.data.docs[index]["bMI"],
                            bP: snapshot.data.docs[index]["bP"],
                            urineTest: snapshot.data.docs[index]["urineTest"],
                            glucoseLevel: snapshot.data.docs[index]["glucoseLevel"],
                            bloodLevel: snapshot.data.docs[index]["bloodLevel"],
                            temperature: snapshot.data.docs[index]["temperature"],
                            tTAndiPT: snapshot.data.docs[index]["tTAndiPT"], title: 'CareTaker',




                          ));
                        }

                      },
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Container(
                            height: 6.5.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: CustomColors.customBlackColor
                                          .withOpacity(0.15),
                                      blurRadius: 8,
                                      offset: const Offset(0, 1))
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(snapshot.data.docs[index]["userName"],
                                      style: const TextStyle(
                                          fontFamily: MyConstants.mediumFontFamily,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.customBlackColor)),
                                  Text("",
                                      style: const TextStyle(
                                          fontFamily: MyConstants.boldFontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CustomColors.customBlackColor)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }return Container();
            },))
        ]),
      ),
    );
  }
}
