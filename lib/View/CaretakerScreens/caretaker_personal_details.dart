import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_medical_details_tab.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_personal_details_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/baby_controller.dart';
import 'caretaker_baby_details.dart';

class CaretakerPersonalDetails extends StatefulWidget {

  const CaretakerPersonalDetails({
    Key? key,
    this.userName,
    this.userInitial,
    this.userLastPeriod,
    this.userPreviousPregnancies,
    this.userVaginalDelivery,
    this.userMaritalStatus,
    this.userLevelOfEducation,
    this.userReligion,
    this.userSourceOfIncome,
    this.userAge,
    this.userEthnicity,
    this.userMedicalCondition,
    this.userNoOfChildrenAndYearOfDelivery,
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
    required this.title,
    required this.patientId
  }) : super(key: key);

  final String? userName;
  final String patientId;
  final String? userInitial;
  final String? userLastPeriod;
  final String? userPreviousPregnancies;
  final String? userVaginalDelivery;
  final String? userMaritalStatus;
  final String? userLevelOfEducation;
  final String? userReligion;
  final String? userSourceOfIncome;
  final String? userAge;
  final String? userEthnicity;
  final String? userMedicalCondition;
  final String? userNoOfChildrenAndYearOfDelivery;
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
  final String? title;

  @override
  State<CaretakerPersonalDetails> createState() =>
      _CaretakerPersonalDetailsState();
}

class _CaretakerPersonalDetailsState extends State<CaretakerPersonalDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
BabyModelController babyModelController=Get.find(tag: 'babyModelController');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    babyModelController.getBabyData(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 3.h),
              ),
              Text(
                widget.userName.toString(),
                style: TextStyle(
                    fontFamily: MyConstants.boldFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                          CaretakerBabyDetails(userName: widget.userName,
                              userInitial: widget.userInitial,
                              userLastPeriod: widget.userLastPeriod,
                              userPreviousPregnancies: widget.userPreviousPregnancies,
                              userVaginalDelivery: widget.userVaginalDelivery,
                              userMaritalStatus: widget.userMaritalStatus,
                              userLevelOfEducation: widget.userLevelOfEducation,
                              userReligion: widget.userReligion,
                              userSourceOfIncome: widget.userSourceOfIncome,
                              userAge: widget.userAge,
                              userEthnicity: widget.userEthnicity,
                              userMedicalCondition: widget.userMedicalCondition,
                              userNoOfChildrenAndYearOfDelivery: widget.userNoOfChildrenAndYearOfDelivery
                              ,
                              selectedDate: widget.selectedDate,
                              estimatedGestationalAge: widget.estimatedGestationalAge,
                              sFH: widget.sFH,
                              fetalHeartRate: widget.fetalHeartRate,
                              weight: widget.weight
                              , height: widget.height,
                              bMI: widget.bMI,
                              bP: widget.bP,
                              urineTest: widget.urineTest,
                              glucoseLevel: widget.glucoseLevel,
                              bloodLevel: widget.bloodLevel,
                              temperature: widget.temperature,
                              tTAndiPT: widget.tTAndiPT,
                          patientId: widget.patientId,)));
                },
                child: Text(
                  "+ Add baby",
                  style: TextStyle(
                      fontFamily: MyConstants.boldFontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.white),
                ),
              ),
            ],
          )),
      body: Column(children: [
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 5.h,
          margin: EdgeInsets.symmetric(horizontal: 4.h),
          decoration: BoxDecoration(
              color: CustomColors.customTabBackgroundColor,
              borderRadius: BorderRadius.circular(32)),
          child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  color: CustomColors.mainAppColor,
                  borderRadius: BorderRadius.circular(32)),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: CustomColors.customTabGreyColor,
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  fontFamily: MyConstants.mediumFontFamily),
              dividerColor: Colors.transparent,
              tabs: [
                Text(
                  "Personal Details",
                ),
                Text(
                  "Medical Details",
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            CaretakerPersonalDetailsTab(
              patientId: widget.patientId,
              userName: widget.userName,
              userNoOfChildrenAndYearOfDelivery: widget.userNoOfChildrenAndYearOfDelivery,
              userMedicalCondition: widget.userMedicalCondition,
              userEthnicity: widget.userEthnicity,
              userReligion: widget.userReligion,
              userSourceOfIncome: widget.userSourceOfIncome,
              userAge: widget.userAge,
              userLevelOfEducation: widget.userLevelOfEducation,
              userMaritalStatus: widget.userMaritalStatus,
              userVaginalDelivery: widget.userVaginalDelivery,
              userPreviousPregnancies: widget.userPreviousPregnancies,
              userLastPeriod: widget.userLastPeriod,
              userInitial: widget.userInitial,
              title: widget.title,
            ),
            CaretakerMedicalDetailsTab(
              patientId: widget.patientId,
               selectedDate: widget.selectedDate,
              estimatedGestationalAge: widget.estimatedGestationalAge,
              sFH: widget.sFH,
              fetalHeartRate: widget.fetalHeartRate,
              weight: widget.weight,
              height: widget.height,
              bMI: widget.bMI,
              bP: widget.bP,
              urineTest: widget.urineTest,
              glucoseLevel: widget.glucoseLevel,
              bloodLevel: widget.bloodLevel,
              temperature: widget.temperature,
              tTAndiPT: widget.tTAndiPT,
              title: widget.title,

            ),
          ]),
        )
      ]),
    );
  }
}
