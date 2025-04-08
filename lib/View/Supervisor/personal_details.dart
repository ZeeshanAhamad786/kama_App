import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/Supervisor/personal_details_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import 'medical_details_tab.dart';

class PersonalDetails extends StatefulWidget {
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
  const PersonalDetails({Key? key,
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
    this.userId,
    this.userTimeStamp,
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
    this.tTAndiPT}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails>
    with SingleTickerProviderStateMixin {
  PatientPersonalDetailsController patientPersonalDetailsController=Get.find(tag: "patientPersonalDetailsController");
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
              SizedBox(
                height: 30,
                width: 30,
              )
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
              unselectedLabelColor: CustomColors.customTabGreyColor ,
              labelStyle:TextStyle(
              color: Colors.white,
              fontSize: 13.px,
              fontWeight: FontWeight.w500,
              fontFamily: MyConstants.mediumFontFamily),
           dividerColor: Colors.transparent,



            tabs: [
                Text("Personal Details",),
                Text("Medical Details",
                ),
              ]),
        ),
      Expanded(
        child:  TabBarView(controller: _tabController,
                children: [
              PersonalDetailsTab(
                userName: widget.userName,
                Initial: widget.Initial,
                lastPeriod: widget.lastPeriod,
                previousPregnancies: widget.previousPregnancies,
                vaginalDelivery: widget.vaginalDelivery,
                maritalStatus: widget.maritalStatus,
                levelOfEducation: widget.levelOfEducation,
                religionAndSourceOfIncome: widget.religionAndSourceOfIncome,
                ethnicity: widget.ethnicity,
                medicalCondition: widget.medicalCondition,
                noOfChildrenAndYearOfDelivery: widget.noOfChildrenAndYearOfDelivery,
                userId: widget.userId,
                userTimeStamp: widget.userTimeStamp,


              ),

              MedicalDetailsTab(
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
                userId: widget.userId,
              ),
        ]),
      )
      ]),
    );
  }
}
