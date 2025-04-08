
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Constant/constant.dart';
import 'package:kama_app/notification_services/notification_services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';

import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import '../CaretakerScreens/caretaker_personal_details.dart';

class AlertScreen extends StatefulWidget {
  final String? userName;
  final String? Initial;
  final String? lastPeriod;
  final String? previousPregnancies;
  final String? vaginalDelivery;
  final String? maritalStatus;
  final String? levelOfEducation;
  final String? religionAndSourceOfIncome;
  final String? ethnicity;
  final String? medicalCondition;
  final String? noOfChildrenAndYearOfDelivery;
  final String? userId;
  final String? userTimeStamp;
  //
  final String? selectedDate;
  final String? estimatedGestationalAge;
  final String? sFH;
  final String? fetalHeartRate;
  final String? weight;
  final String? height;
  final String? bMI;
  final String? bP;
  final String? urineTest;
  final String? glucoseLevel;
  final String? bloodLevel;
  final String? temperature;
  final String? tTAndiPT;
  const AlertScreen({
    Key? key,
    this.userName,
    this.Initial,
    this.lastPeriod,
    this.previousPregnancies,
    this.vaginalDelivery,
    this.maritalStatus,
    this.levelOfEducation,
    this.religionAndSourceOfIncome,
    this.ethnicity,
    this.medicalCondition,
    this.noOfChildrenAndYearOfDelivery,
    this.selectedDate,
    this.estimatedGestationalAge,
    this.sFH,
    this.fetalHeartRate,
    this.weight,
    this.height,
    this.bMI,
    this.bP,
    this.urineTest,
    this.glucoseLevel,
    this.bloodLevel,
    this.temperature,
    this.tTAndiPT,
    this.userId,
    this.userTimeStamp,
  }) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  final SignUpController signUpController = Get.find(tag: "signUpController");

  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpController.getSuperVisorData();
  }
  NotificationServices notificationServices = NotificationServices();
  PatientPersonalDetailsController patientPersonalDetailsController =
      Get.find(tag: "patientPersonalDetailsController");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.mainAppColor,
            centerTitle: true,
            title: Text(
              "Alert",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: MyConstants.boldFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "bP",
                      isGreaterThan: "131",
                    )
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

                                      title: 'SuperVisor',



                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "BP",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            bP.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "temperature",
                      isGreaterThan: "37.2",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final temperature =
                              snapshot.data.docs[index]["temperature"];

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
                                      title: 'SuperVisor',





                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Temperature",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            temperature.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "glucoseLevel",
                      isGreaterThan: "100",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final glucoseLevel =
                              snapshot.data.docs[index]["glucoseLevel"];

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
                                      title: 'SuperVisor',





                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "GlucoseLevel",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            glucoseLevel.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "urineTest",
                      isGreaterThan: "1",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final urineTest =
                              snapshot.data.docs[index]["urineTest"];

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
                                      title: 'SuperVisor',





                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "urineTest",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            urineTest.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "fetalHeartRate",
                      isGreaterThan: "160",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final fetalHeartRate =
                              snapshot.data.docs[index]["fetalHeartRate"];

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
                                      title: 'SuperVisor',





                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "FetalHeartRate",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            fetalHeartRate.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "bloodLevel",
                      isGreaterThanOrEqualTo: "10",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final bloodLevel =
                              snapshot.data.docs[index]["bloodLevel"];

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
                                      title: 'SuperVisor',




                                    ));
                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "BloodLevel",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            bloodLevel.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
              StreamBuilder(
                stream: patientPersonalDetailsController.userPatientData
                    .where(
                      "weight",
                      isGreaterThan: "3",
                    )
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
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final userName =
                              snapshot.data.docs[index]["userName"];
                          final weight = snapshot.data.docs[index]["weight"];

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
                                      title: 'SuperVisor',





                                    ));                                  },
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Weight",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors
                                                        .customDarkRedColor,
                                                    fontSize: 13,
                                                    fontFamily: MyConstants
                                                        .mediumFontFamily,
                                                  ),
                                                ),
                                                Text(
                                                  userName.toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomColors
                                                        .customBlackColor,
                                                    fontSize: 10,
                                                    fontFamily: MyConstants
                                                        .regularFontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            weight.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: CustomColors
                                                  .customDarkRedColor,
                                              fontSize: 16,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.4.h,
                                          ),
                                          SvgPicture.asset(
                                              "assets/svg/triangle.svg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
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
        ));
  }
}
