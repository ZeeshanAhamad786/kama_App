import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Widgets/custom_textfield_medical.dart';
import 'package:kama_app/notification_services/notification_services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';

import '../../ViewModel/Supervisor/sign_up_controller.dart';

class CaretakerAddNewPatientMedicalDetails extends StatefulWidget {
  CaretakerAddNewPatientMedicalDetails(
      {super.key, this.centerName, this.veginalDelivery});
  String? centerName;
  String? veginalDelivery;

  @override
  State<CaretakerAddNewPatientMedicalDetails> createState() =>
      _CaretakerAddNewPatientMedicalDetailsState();
}

class _CaretakerAddNewPatientMedicalDetailsState
    extends State<CaretakerAddNewPatientMedicalDetails> {
  int? bpLevel;
  int? weight;
  int? urienTest;
  int? golucoseLevel;
  int? bloodLevel;
  int? fatelHeartRate;
  int? temperature;
  PatientPersonalDetailsController patientPersonalDetailsController =
      Get.find(tag: "patientPersonalDetailsController");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NotificationServices notificationServices = NotificationServices();
  final SignUpController signUpController = Get.find(tag: "signUpController");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpController.getSuperVisorData();
    signUpController.deviceIdList;
  }

  void convertDataIntoInt() {
    try {
      bpLevel = int.parse(patientPersonalDetailsController.bPController.text);
      golucoseLevel = int.parse(
          patientPersonalDetailsController.glucoseLevelController.text);
      bloodLevel =
          int.parse(patientPersonalDetailsController.bloodLevelController.text);
      urienTest =
          int.parse(patientPersonalDetailsController.urineTestController.text);
      fatelHeartRate = int.parse(
          patientPersonalDetailsController.fetalHeartRateController.text);
      weight =
          int.parse(patientPersonalDetailsController.weightController.text);
    } catch (e) {
      // Handle the error, for example, show a message to the user or log it
      print("Error converting string to int: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    var patientId = Uuid().v4();

    return
      Scaffold(
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
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text(
                "Add New patient",
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
      body: SingleChildScrollView(
          child: Obx(
        () => Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Text(
                    "Medical Details${widget.veginalDelivery}",
                    style: TextStyle(
                        color: CustomColors.customBlue1Color,
                        fontSize: 13,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 0.6.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030));
                      if (pickedDate != null) {
                        patientPersonalDetailsController.date.value =
                            pickedDate;
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        height: 7.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.08)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                offset: Offset(0, 1),
                                blurRadius: 8),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/svg/1image.svg"),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text(
                              patientPersonalDetailsController.dateString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyConstants.mediumFontFamily,
                                color: CustomColors.customBlackColor,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller: patientPersonalDetailsController
                        .estimatedGestationalAgeController,
                    label: "Estimated Gestational Age",
                    PrefixIcon: SvgPicture.asset("assets/svg/2image.svg"),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller: patientPersonalDetailsController.sFHController,
                    label: "SFH",
                    PrefixIcon: SvgPicture.asset("assets/svg/3image.svg"),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller: patientPersonalDetailsController
                        .fetalHeartRateController,
                    label: "Fetal Heart Rate (FHR)",
                    PrefixIcon: SvgPicture.asset("assets/svg/4image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller:
                        patientPersonalDetailsController.weightController,
                    label: "Weight",
                    PrefixIcon: SvgPicture.asset("assets/svg/5image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller:
                        patientPersonalDetailsController.heightController,
                    label: "Height",
                    PrefixIcon: SvgPicture.asset("assets/svg/6image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller: patientPersonalDetailsController.bMIController,
                    label: "BMI",
                    PrefixIcon: SvgPicture.asset("assets/svg/7image.svg"),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    validator: (value) {
                      bpLevel = int.parse(value!);
                      return null;
                    },
                    controller: patientPersonalDetailsController.bPController,
                    label: "BP",
                    PrefixIcon: SvgPicture.asset("assets/svg/8image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    validator: (value) {
                      urienTest = int.parse(value!);

                      return null;
                    },
                    controller:
                        patientPersonalDetailsController.urineTestController,
                    label: "Urine Test",
                    PrefixIcon: SvgPicture.asset("assets/svg/9image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    validator: (value) {
                      golucoseLevel = int.parse(value!);

                      return null;
                    },
                    controller:
                        patientPersonalDetailsController.glucoseLevelController,
                    label: "Glucose level",
                    PrefixIcon: SvgPicture.asset("assets/svg/10ten.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    validator: (value) {
                      bloodLevel = int.parse(value!);

                      return null;
                    },
                    controller:
                        patientPersonalDetailsController.bloodLevelController,
                    label: "Blood level",
                    PrefixIcon: SvgPicture.asset("assets/svg/10image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller:
                        patientPersonalDetailsController.temperatureController,
                    label: "Temperature",
                    PrefixIcon: SvgPicture.asset("assets/svg/11image.svg"),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFieldMedical(
                    controller:
                        patientPersonalDetailsController.tTAndiPTController,
                    label: "TT & IPT",
                    PrefixIcon: SvgPicture.asset("assets/svg/12image.svg"),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                Obx(() =>   patientPersonalDetailsController.isLoading.value
                    ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: CustomColors.mainAppColor,
                  ),
                )
                    :
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(14.h, 4.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: CustomColors.mainAppColor,
                    ),
                    onPressed: () {
                      convertDataIntoInt();

                      // Handle null values with safe access (null-aware operators)
                      bool isAbnormal = (bpLevel != null && bpLevel! > 131) ||
                          (fatelHeartRate != null && fatelHeartRate! > 160) ||
                          (weight != null && weight! > 3) ||
                          (urienTest != null && urienTest! > 1) ||
                          (golucoseLevel != null && golucoseLevel! > 100) ||
                          (bloodLevel != null && bloodLevel! < 10);

                      String status = "pending";

                      if (isAbnormal) {
                        notificationServices.sendNotification(
                          signUpController.deviceIdList,
                          'Alert!',
                          'Patient is Abnormal. Please CheckUp!',
                        );
                      } else {
                        notificationServices.sendNotification(
                          signUpController.deviceIdList,
                          'Alert!',
                          'Patient is Normal.',
                        );
                      }

                      patientPersonalDetailsController.storePatientData(
                        userName: patientPersonalDetailsController.userNameController.text.trim(),
                        userInitial: patientPersonalDetailsController.userInitialController.text.trim(),
                        userLastPeriod: patientPersonalDetailsController.userLastPeriodController.text.trim(),
                        userPreviousPregnancies: patientPersonalDetailsController.userPreviousPregnanciesController.text.trim(),
                        userMaritalStatus: patientPersonalDetailsController.userMaritalStatusController.text.trim(),
                        userLevelOfEducation: patientPersonalDetailsController.userLevelOfEducationController.text.trim(),
                        userReligion: patientPersonalDetailsController.userReligionController.text.trim(),
                        userSourceOfIncome: patientPersonalDetailsController.userSourceOfIncomeController.text.trim(),
                        userAge: patientPersonalDetailsController.userAgeController.text.trim(),
                        userEthnicity: patientPersonalDetailsController.userEthnicityController.text.trim(),
                        userMedicalCondition: patientPersonalDetailsController.userMedicalConditionController.text.trim(),
                        userNoOfChildrenAndYearOfDelivery: patientPersonalDetailsController.userNoOfChildrenAndYearOfDeliveryController.text.trim(),
                        selectedDate: patientPersonalDetailsController.date.value,
                        estimatedGestationalAge: patientPersonalDetailsController.estimatedGestationalAgeController.text.trim(),
                        sFH: patientPersonalDetailsController.sFHController.text.trim(),
                        fetalHeartRate: patientPersonalDetailsController.fetalHeartRateController.text.trim(),
                        weight: patientPersonalDetailsController.weightController.text.trim(),
                        height: patientPersonalDetailsController.heightController.text.trim(),
                        bMI: patientPersonalDetailsController.bMIController.text.trim(),
                        bP: patientPersonalDetailsController.bPController.text.trim(),
                        urineTest: patientPersonalDetailsController.urineTestController.text.trim(),
                        glucoseLevel: patientPersonalDetailsController.glucoseLevelController.text.trim(),
                        bloodLevel: patientPersonalDetailsController.bloodLevelController.text.trim(),
                        temperature: patientPersonalDetailsController.temperatureController.text.trim(),
                        tTAndiPT: patientPersonalDetailsController.tTAndiPTController.text.trim(),
                        vaginalDelivery: widget.veginalDelivery,
                        centerName: widget.centerName,
                        status: status,
                        userId: patientId.toString(),
                      );

                      log('This is User Id   $patientId');
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),),

                  SizedBox(
                    height: 1.h,
                    width: 1.h,
                  ),
                ]),
          ),
        ),
      )),
    );

  }
}
