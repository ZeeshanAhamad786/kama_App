import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/Supervisor/alert_screen.dart';
import 'package:kama_app/View/Supervisor/refer_screen.dart';
import 'package:kama_app/View/Supervisor/setting_supervisor_screen.dart';
import 'package:kama_app/View/Supervisor/supervisor_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../CaretakerScreens/caretaker_center_patient_name.dart';

class SupervisorBottomNavigationScreen extends StatefulWidget {
  int? currentIndex;
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

  SupervisorBottomNavigationScreen({
    Key? key,
    this.currentIndex,
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
    this.tTAndiPT,
  }) : super(key: key);

  @override
  State<SupervisorBottomNavigationScreen> createState() =>
      _SupervisorBottomNavigationScreenState();
}

class _SupervisorBottomNavigationScreenState
    extends State<SupervisorBottomNavigationScreen> {
  int currentIndex = 0;
  late List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex ?? 0;
    widgetOptions = [
      const SupervisorHomeScreen(),
      AlertScreen(
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

      ),
      const ReferScreen(),
      CaretakerCenterPatientName(),
      const SettingSupervisorScreen(),
    ];
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          widgetOptions.elementAt(currentIndex),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CurvedNavigationBar(
                height: 9.h,
                color: CustomColors.mainAppColor,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: CustomColors.mainAppColor,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: currentIndex,
                items: [
                  SvgPicture.asset("assets/svg/splashnew.svg",
                      color: currentIndex == 0 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/alert.svg",
                      color: currentIndex == 1 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/refer.svg",
                      color: currentIndex == 2 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/hospital.svg",
                      color: currentIndex == 3 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/setting.svg",
                      color: currentIndex == 4 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                ],
                onTap: (index) => onTap(index),
              ),
              Positioned(
                bottom: 0.6.h,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Home",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 0
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("     Alert",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 1
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("    Refer",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 2
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("  Center",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 3
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("Setting",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 4
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
