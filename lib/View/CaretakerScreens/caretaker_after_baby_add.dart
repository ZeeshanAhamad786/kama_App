import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_home_screen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../ViewModel/Care_taker/baby_controller.dart';
import '../../ViewModel/Care_taker/caretaker_addcomment_controller.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Care_taker/sign_up_caretaker_controller.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import '../BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import '../Widgets/custom_textfield_medical.dart';

class CaretakerAfterBabyAddScreen extends StatefulWidget {
  final String? userName;
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
  final String? patientId;
  final String? title;

  CaretakerAfterBabyAddScreen(
      {super.key,
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
      this.patientId,
        this.title,
      });

  @override
  State<CaretakerAfterBabyAddScreen> createState() =>
      _CaretakerAfterBabyAddScreenState();
}

class _CaretakerAfterBabyAddScreenState
    extends State<CaretakerAfterBabyAddScreen> {
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
  List<String> personalQuestions = [
    'Name',
    'Initials',
    'Last period(First day), full date ',
    'Previous pregnancies',
    'Mode of deliveries (vaginal delivery or operative delivery)',
    'Marital status',
    'Level of education',
    'Religion and source of income',
    'Ethnicity',
    'Any known medical condition',
    'No of children and year of delivery',
  ];
  final SignUpController signUpController = Get.find(tag: 'signUpController');
  SignUPCaretakerController signUPCaretakerController =Get.find(tag: "signUPCaretakerController");


  List<String> medicalQuestions = [
    'Date',
    'Estimated Gestational Age',
    'SFH',
    'Fetal Heart Rate (FHR)',
    'Weight',
    'Height',
    'BMI',
    'BP',
    'Urine test',
    'Glucose level',
    'Blood level',
    'Temperature',
    'TT & IPT',
  ];

  List<String> constantText = [
    'VACCINATION SCHEDULE',
    'At Birth (BCG, Hepatitis B, OPV0)',
    '6 weeks  Pent 1, PCV1, OPV 1, Rotavirus 1',
    '10 weeks  Pent 2, PCV 2, OPV2, Rotavirus 2',
    '14 weeks  Pent 3, PCV 3, OPV3, IPV',
    '6 months Vitamin A1',
    "9 months Measles 1, Yellow fever, Meningitis vaccine",
    "12 months Vitamin A2",
  ];




  var chatList = [].obs;

  String formatedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  String formatedTime = DateFormat('HH:mm:ss a').format(DateTime.now());

  TextEditingController messageControllerTab1 = TextEditingController();

  TextEditingController messageControllerTab2 = TextEditingController();

  TextEditingController messageControllerTab3 = TextEditingController();

  final RxString _selectedDate = '01/11/2003'.obs;

  // Initialize with a default value or appropriate starting value.
  RxInt currentIndex = 0.obs;

  RxBool isTab1 = false.obs;
  RxBool isTab2 = false.obs;
  RxBool isTab3 = false.obs;

  FocusNode focusNode = FocusNode();
  PatientPersonalDetailsController patientPersonalDetailsController =
      Get.find(tag: "patientPersonalDetailsController");
  BabyModelController babyModelController =
      Get.find(tag: "babyModelController");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    babyModelController.getBabyData(widget.patientId);
    // String formattedDate = DateFormat('yyyy-MM-dd').format();
  }
  AddCommentController addCommentController=Get.find(tag: 'addCommentController');

  String _formatTimestamp(var timestamp) {
    if (timestamp == null) return ""; // Return empty string if timestamp is null
    DateTime dateTime = timestamp.toDate(); // Convert Firestore Timestamp to DateTime
    return DateFormat('yyyy-MM-dd').format(dateTime); // Format DateTime object
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffA69EFF),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.to(CaretakerHomeScreen());
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: const Color(0xffFFFFFF),
                  size: 3.h,
                )),
            title: Text(
              widget.userName.toString(),
              style: TextStyle(
                fontSize: 16,
                fontFamily: MyConstants.boldFontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: [
              GestureDetector(onTap: () {
                showMyDialog();
              },
                child: Text("Discharge", style: TextStyle(fontSize: 15,
                    fontFamily: MyConstants.boldFontFamily,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              ),
              SizedBox(width: 2.h,)
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: const Color(
                        0xffEBEBEB,
                      ),
                      borderRadius: BorderRadius.circular(32)),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    onTap: (value) {
                      currentIndex.value = value;
                    },
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: MyConstants.mediumFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                    indicator: currentIndex.value == 0
                        ? const ShapeDecoration(
                            color: Color(0xffA69EFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    bottomLeft: Radius.circular(32))))
                        : currentIndex.value == 1
                            ? const ShapeDecoration(
                                color: Color(0xffA69EFF),
                                shape: RoundedRectangleBorder())
                            : currentIndex.value == 2
                                ? const ShapeDecoration(
                                    color: Color(0xffA69EFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(32),
                                            bottomRight: Radius.circular(32))))
                                : const ShapeDecoration(
                                    color: Color(0xffA69EFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Text(
                        'Personal Details',
                      ),
                      Text('Medical Details'),
                      Text('Baby Details'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Personal Details',
                                  style: TextStyle(
                                    fontSize: 13.px,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    color: CustomColors.customBlue1Color,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                height: 1.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPatientWidget(
                                      label: 'Name', answer: widget.userName),
                                  CustomPatientWidget(
                                      label: 'Initials',
                                      answer: widget.userInitial ?? ""),
                                  CustomPatientWidget(
                                      label:
                                          'Last period(First day), full date',
                                      answer: widget.userLastPeriod ?? ""),
                                  CustomPatientWidget(
                                      label: 'Previous pregnancies',
                                      answer:
                                          widget.userPreviousPregnancies ?? ""),
                                  CustomPatientWidget(
                                      label:
                                          'Mode of deliveries (vaginal delivery or operative delivery)',
                                      answer: widget.userVaginalDelivery ?? ""),
                                  CustomPatientWidget(
                                      label: 'Marital status',
                                      answer: widget.userMaritalStatus ?? ""),
                                  CustomPatientWidget(
                                      label: 'Level of education',
                                      answer:
                                          widget.userLevelOfEducation ?? ""),
                                  CustomPatientWidget(
                                      label: 'Religion and source of income',
                                      answer: widget
                                              .userReligion ??
                                          ""),
                                  CustomPatientWidget(
                                      label: 'Source of income',
                                      answer: widget
                                          .userSourceOfIncome ??
                                          ""),
                                  CustomPatientWidget(
                                      label: 'Age',
                                      answer: widget
                                          .userAge ??
                                          ""),
                                  CustomPatientWidget(
                                      label: 'Ethnicity',
                                      answer: widget.userEthnicity ?? ""),
                                  CustomPatientWidget(
                                      label: 'Any known medical condition',
                                      answer:
                                          widget.userMedicalCondition ?? ""),
                                  CustomPatientWidget(
                                      label:
                                          'No of children and year of delivery',
                                      answer: widget
                                              .userNoOfChildrenAndYearOfDelivery ??
                                          ""),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000).withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab1.value == true
                                      ? EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.h),
                                  child:widget.title=='Admin'?SizedBox.shrink(): Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab1.value == true) {
                                            isTab1.value = false;
                                          } else {
                                            isTab1.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab1.value
                                                ? SvgPicture.asset(
                                                'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontFamily:
                                                  MyConstants.mediumFontFamily,
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xff9086FF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab1.value == true
                                            ? EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: CustomColors.customGreyBoldColor,
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab1.value == true
                                          ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:superVisoraddCommentControllerTab1
                                            .CommentList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    topRight: Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: 1.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w,
                                                      vertical: 1.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.CommentList[index],
                                                    style:
                                                    TextStyle(fontSize: 10.px),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    bottomLeft: Radius.circular(12),
                                                    bottomRight:
                                                    Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: .2.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.5.w,
                                                      vertical: .5.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.senderNameList[index],
                                                    style: TextStyle(
                                                        fontFamily: MyConstants
                                                            .mediumFontFamily,
                                                        fontSize: 10.px,
                                                        color: const Color(
                                                            0xff9086FF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              SizedBox(
                                                height: 1.4.h,
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                          : const SizedBox.shrink(),
                                      isTab1.value == true
                                          ? Container(
                                          alignment: Alignment.centerLeft,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: const Color(0xffFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.12),
                                                blurRadius: 8,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.5.w, vertical: 1.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                      keyboardType:
                                                      TextInputType.text,
                                                      controller:addCommentController.addCommentControllerTab1
                                                      ,
                                                      style:
                                                      TextStyle(fontSize: 13.px),
                                                      // focusNode: focusNode,
                                                      autofocus: true,
                                                      decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText:
                                                          'Write message...',
                                                          hintStyle: TextStyle(
                                                              fontFamily: MyConstants
                                                                  .regularFontFamily,
                                                              fontSize: 10.px,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: CustomColors
                                                                  .customLightGreyColor))),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    log('This is SuperVisor Name ${ signUpController.superVisorName}');
                                                    log('This is superVisorId ${ signUpController.superVisorId}');
                                                    if(widget.title=='SuperVisor'){
                                                      addCommentController.addCommentToFireStore(
                                                          signUpController.superVisorName,
                                                          signUpController.superVisorId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }else{
                                                      addCommentController.addCommentToFireStore(
                                                          signUPCaretakerController.careTakerName,
                                                          signUPCaretakerController.careTakerId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }

                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                        const Color(0xffA69EFF),
                                                        borderRadius:
                                                        BorderRadius.circular(8)),
                                                    height: 3.h,
                                                    width: 6.h,
                                                    child: Center(
                                                      child: Text(
                                                        'Send',
                                                        style: TextStyle(
                                                            fontFamily: MyConstants
                                                                .regularFontFamily,
                                                            color: Colors.white,
                                                            fontSize: 10.px,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Medical Details',
                                      style: TextStyle(
                                          fontSize: 13.px,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff837AE8))),
                                  Container(
                                    height: 4.5.h,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      color: const Color(0xffFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.15),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Obx(
                                      () => DropdownButton(
                                        borderRadius:
                                            BorderRadius.circular(10.px),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        underline: Container(),
                                        iconSize: 24,
                                        isExpanded: true,
                                        value: _selectedDate.value ?? 'Default',
                                        // Provide a default value if _selectedDate.value is null
                                        items: [
                                          DropdownMenuItem(
                                            value: '01/11/2003',
                                            child: Text('01/11/2003',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/12/2005',
                                            child: Text('01/09/2005',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),

                                          DropdownMenuItem(
                                            value: '01/04/2004',
                                            child: Text('01/04/2004',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/04/2009',
                                            child: Text('01/04/2009',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/04/2010',
                                            child: Text('01/04/2010',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          // Add similar DropdownMenuItem entries for other dates
                                        ],
                                        onChanged: (String? selectedDate) {
                                          _selectedDate.value = selectedDate ??
                                              'Default'; // Update the selected date using _selectedDate.value
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Date",
                                tabImage: "assets/svg/1image.svg",
                                titleText: widget.selectedDate,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Estimated Gestational Age",
                                tabImage: "assets/svg/2image.svg",
                                titleText: widget.estimatedGestationalAge,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "SFH",
                                tabImage: "assets/svg/3image.svg",
                                titleText: widget.sFH,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Fetal Heart Rate (FHR)",
                                tabImage: "assets/svg/4image.svg",
                                titleText: widget.fetalHeartRate,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Weight",
                                tabImage: "assets/svg/5image.svg",
                                titleText: widget.weight,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Height",
                                tabImage: "assets/svg/6image.svg",
                                titleText: widget.height,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "BMI",
                                tabImage: "assets/svg/7image.svg",
                                titleText: widget.bMI,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "BP",
                                tabImage: "assets/svg/8image.svg",
                                titleText: widget.bP,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Urine test",
                                tabImage: "assets/svg/9image.svg",
                                titleText: widget.urineTest,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Glucose level",
                                tabImage: "assets/svg/10ten.svg",
                                titleText: widget.glucoseLevel,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Blood level",
                                tabImage: "assets/svg/10image.svg",
                                titleText: widget.bloodLevel,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "Temperature",
                                tabImage: "assets/svg/11image.svg",
                                titleText: widget.temperature,
                              ),
                              CustomPatientMedicalWidget(
                                labelName: "TT & IPT",
                                tabImage: "assets/svg/12image.svg",
                                titleText: widget.tTAndiPT,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000).withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab1.value == true
                                      ? EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.h),
                                  child:widget.title=='Admin'?SizedBox.shrink(): Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab1.value == true) {
                                            isTab1.value = false;
                                          } else {
                                            isTab1.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab1.value
                                                ? SvgPicture.asset(
                                                'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontFamily:
                                                  MyConstants.mediumFontFamily,
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xff9086FF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab1.value == true
                                            ? EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: CustomColors.customGreyBoldColor,
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab1.value == true
                                          ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:superVisoraddCommentControllerTab1
                                            .CommentList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    topRight: Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: 1.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w,
                                                      vertical: 1.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.CommentList[index],
                                                    style:
                                                    TextStyle(fontSize: 10.px),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    bottomLeft: Radius.circular(12),
                                                    bottomRight:
                                                    Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: .2.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.5.w,
                                                      vertical: .5.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.senderNameList[index],
                                                    style: TextStyle(
                                                        fontFamily: MyConstants
                                                            .mediumFontFamily,
                                                        fontSize: 10.px,
                                                        color: const Color(
                                                            0xff9086FF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              SizedBox(
                                                height: 1.4.h,
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                          : const SizedBox.shrink(),
                                      isTab1.value == true
                                          ? Container(
                                          alignment: Alignment.centerLeft,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: const Color(0xffFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.12),
                                                blurRadius: 8,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.5.w, vertical: 1.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                      keyboardType:
                                                      TextInputType.text,
                                                      controller:addCommentController.addCommentControllerTab1
                                                      ,
                                                      style:
                                                      TextStyle(fontSize: 13.px),
                                                      // focusNode: focusNode,
                                                      autofocus: true,
                                                      decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText:
                                                          'Write message...',
                                                          hintStyle: TextStyle(
                                                              fontFamily: MyConstants
                                                                  .regularFontFamily,
                                                              fontSize: 10.px,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: CustomColors
                                                                  .customLightGreyColor))),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    log('This is SuperVisor Name ${ signUpController.superVisorName}');
                                                    log('This is superVisorId ${ signUpController.superVisorId}');
                                                    if(widget.title=='SuperVisor'){
                                                      addCommentController.addCommentToFireStore(
                                                          signUpController.superVisorName,
                                                          signUpController.superVisorId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }else{
                                                      addCommentController.addCommentToFireStore(
                                                          signUPCaretakerController.careTakerName,
                                                          signUPCaretakerController.careTakerId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }

                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                        const Color(0xffA69EFF),
                                                        borderRadius:
                                                        BorderRadius.circular(8)),
                                                    height: 3.h,
                                                    width: 6.h,
                                                    child: Center(
                                                      child: Text(
                                                        'Send',
                                                        style: TextStyle(
                                                            fontFamily: MyConstants
                                                                .regularFontFamily,
                                                            color: Colors.white,
                                                            fontSize: 10.px,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Baby Details',
                                  style: TextStyle(
                                      fontSize: 13.px,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.customBlue1Color,
                                      fontFamily:
                                          MyConstants.mediumFontFamily)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Outcome of pregnancy',
                                style: TextStyle(
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily),
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                'Pregnancy loss',
                                style: TextStyle(
                                    color: CustomColors.customBlue1Color,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${babyModelController.selectedPregnancy}" ?? "",
                                style: TextStyle(
                                    fontSize: 10.px,
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Mode of  delivery',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${babyModelController.deliveryCase}" ?? "",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Number of Babies',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${babyModelController.noOfBabies}" ?? "",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date of delivery',
                                        style: TextStyle(
                                            color:
                                                CustomColors.customBlackColor,
                                            fontFamily:
                                                MyConstants.mediumFontFamily,
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/dateimage.svg'),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            "${_formatTimestamp(babyModelController.selectedDate1)}" ?? "",
                                            style: TextStyle(
                                                fontSize: 10.px,
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Time of Delivery',
                                        style: TextStyle(
                                            color:
                                                CustomColors.customBlackColor,
                                            fontFamily:
                                                MyConstants.mediumFontFamily,
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/timeImage.svg'),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            "${babyModelController.selectedTime}" ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 10.px,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Baby’s Gender',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${babyModelController.Gender}" ?? "",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                "Baby's weight",
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${babyModelController.bodyWeight}" ?? "",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: constantText.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: index == 0 ? 1.h : 0.6.h),
                                    child: Text(
                                      constantText[index],
                                      style: index == 0
                                          ? TextStyle(
                                              color: CustomColors
                                                  .customDarkBlackColor,
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : TextStyle(
                                              color:
                                                  CustomColors.customBlackColor,
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000).withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab1.value == true
                                      ? EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                      horizontal: 1.5.w, vertical: 1.h),
                                  child:widget.title=='Admin'?SizedBox.shrink(): Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab1.value == true) {
                                            isTab1.value = false;
                                          } else {
                                            isTab1.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab1.value
                                                ? SvgPicture.asset(
                                                'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontFamily:
                                                  MyConstants.mediumFontFamily,
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xff9086FF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab1.value == true
                                            ? EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                            horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: CustomColors.customGreyBoldColor,
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab1.value == true
                                          ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:superVisoraddCommentControllerTab1
                                            .CommentList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    topRight: Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: 1.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w,
                                                      vertical: 1.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.CommentList[index],
                                                    style:
                                                    TextStyle(fontSize: 10.px),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    bottomLeft: Radius.circular(12),
                                                    bottomRight:
                                                    Radius.circular(12),
                                                  ),
                                                  color: const Color(0xffFFFFFF),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xff000000)
                                                          .withOpacity(0.15),
                                                      blurRadius: 8,
                                                      offset: const Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                margin: EdgeInsets.only(
                                                    right: 1.w,
                                                    left: 11.9.w,
                                                    top: .2.h),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.5.w,
                                                      vertical: .5.h),
                                                  child: Text(
                                                    superVisoraddCommentControllerTab1.senderNameList[index],
                                                    style: TextStyle(
                                                        fontFamily: MyConstants
                                                            .mediumFontFamily,
                                                        fontSize: 10.px,
                                                        color: const Color(
                                                            0xff9086FF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              SizedBox(
                                                height: 1.4.h,
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                          : const SizedBox.shrink(),
                                      isTab1.value == true
                                          ? Container(
                                          alignment: Alignment.centerLeft,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: const Color(0xffFFFFFF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.12),
                                                blurRadius: 8,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.5.w, vertical: 1.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                      keyboardType:
                                                      TextInputType.text,
                                                      controller:addCommentController.addCommentControllerTab1
                                                      ,
                                                      style:
                                                      TextStyle(fontSize: 13.px),
                                                      // focusNode: focusNode,
                                                      autofocus: true,
                                                      decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText:
                                                          'Write message...',
                                                          hintStyle: TextStyle(
                                                              fontFamily: MyConstants
                                                                  .regularFontFamily,
                                                              fontSize: 10.px,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: CustomColors
                                                                  .customLightGreyColor))),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    log('This is SuperVisor Name ${ signUpController.superVisorName}');
                                                    log('This is superVisorId ${ signUpController.superVisorId}');
                                                    if(widget.title=='SuperVisor'){
                                                      addCommentController.addCommentToFireStore(
                                                          signUpController.superVisorName,
                                                          signUpController.superVisorId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }else{
                                                      addCommentController.addCommentToFireStore(
                                                          signUPCaretakerController.careTakerName,
                                                          signUPCaretakerController.careTakerId,
                                                          addCommentController.addCommentControllerTab1.text,
                                                          widget.patientId
                                                      );
                                                      superVisoraddCommentControllerTab1.getSenderData(widget.patientId);

                                                    }

                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                        const Color(0xffA69EFF),
                                                        borderRadius:
                                                        BorderRadius.circular(8)),
                                                    height: 3.h,
                                                    width: 6.h,
                                                    child: Center(
                                                      child: Text(
                                                        'Send',
                                                        style: TextStyle(
                                                            fontFamily: MyConstants
                                                                .regularFontFamily,
                                                            color: Colors.white,
                                                            fontSize: 10.px,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ) // ListView.builder(itemCount: questions.length,
              //   itemBuilder: (context, index) {
              //
              // },)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> showMyDialog() async {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Patient Discharge", style: TextStyle(fontSize: 20,
                fontFamily: MyConstants.boldFontFamily,
                fontWeight: FontWeight.bold,
                color: CustomColors.mainAppColor)),
            content: Text(
              "Are you sure to discharge the patient ?", style: TextStyle(
              color: CustomColors.customDarkBlackColor,
              fontFamily: MyConstants.mediumFontFamily,
              fontSize: 12.px,
              fontWeight: FontWeight.w500,),),
            actions: [
              TextButton(style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.mainAppColor,
                  fixedSize: Size(10, 4)),
                  onPressed: () {
                    dischargePatient();
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes", style: TextStyle(color: Colors.white),)),
              TextButton(style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.mainAppColor,
                  fixedSize: Size(10, 4)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text("No", style: TextStyle(color: Colors.white),))
            ],
          );
        });
  }

  void dischargePatient() async {

    try {
      await FirebaseFirestore.instance.collection("patient_data")
          .where("status", isEqualTo: "pending")
          .limit(1)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.update({"status": "complete"});
        });
      });

      Navigator.push(context, MaterialPageRoute(builder: (_)=>CaretakerBottomNavigationScreen()));
    } catch (e) {
      print("Error discharging patient: $e");
      // Handle error
    }
  }
}
