import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/View/Supervisor/personal_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import 'caretaker_personal_details.dart';

class CaretakerReferScreen extends StatefulWidget {
  const CaretakerReferScreen({Key? key}) : super(key: key);

  @override
  State<CaretakerReferScreen> createState() => _CaretakerReferScreenState();
}

class _CaretakerReferScreenState extends State<CaretakerReferScreen> {
  PatientPersonalDetailsController patientPersonalDetailsController =
  Get.find(tag: "patientPersonalDetailsController");
  final List<Map<String, String>> centerDetails = [
    {"centerName": "Mohsin", "time": "12:30 AM"},
    {"centerName": "Ali", "time": "01:30 PM"},
    // Add more center details here if needed
  ];
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.mainAppColor,
        centerTitle: true,
        title: Text(
          "Refer",
          style: TextStyle(
            fontSize: 16,
            fontFamily: MyConstants.boldFontFamily,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                  stream: patientPersonalDetailsController.userPatientData
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return Text("No data found");
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 3.h, vertical: 6.h),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final userName =
                            snapshot.data.docs[index]["userName"];
                            final bP = snapshot.data.docs[index]["bP"];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Lahore center",
                                        style: TextStyle(
                                          fontFamily:
                                          MyConstants.regularFontFamily,
                                          color: CustomColors.customBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.h,
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color:
                                          CustomColors.customLightGreyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.h,
                                      ),
                                      Text(
                                        "12:30 AM",
                                        style: TextStyle(
                                          fontFamily:
                                          MyConstants.regularFontFamily,
                                          color: CustomColors.customBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      superVisoraddCommentControllerTab1.getSenderData(snapshot.data.docs[index]["userId"]);
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
                                        tTAndiPT: snapshot.data.docs[index]["tTAndiPT"],
                                        title: 'CareTaker',




                                      ));                                    },
                                    child: Container(
                                      height: 8.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: CustomColors.customBlackColor
                                                .withOpacity(0.15),
                                            offset: const Offset(0, 1),
                                            blurRadius: 8,
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 3.h),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              userName.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color:
                                                CustomColors.customBlackColor,
                                                fontSize: 10,
                                                fontFamily:
                                                MyConstants.regularFontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          )

      ),
    );
  }
}
