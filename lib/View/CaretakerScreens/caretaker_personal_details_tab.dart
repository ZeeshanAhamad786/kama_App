import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Widgets/custom_textfield_medical.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/caretaker_addcomment_controller.dart';
import '../../ViewModel/Care_taker/sign_up_caretaker_controller.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';

class CaretakerPersonalDetailsTab extends StatefulWidget {
  CaretakerPersonalDetailsTab({
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
    required this.patientId,
    this.userNoOfChildrenAndYearOfDelivery,
     this.title
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
  final String? title;
  @override
  State<CaretakerPersonalDetailsTab> createState() =>
      _CaretakerPersonalDetailsTabState();
}

class _CaretakerPersonalDetailsTabState
    extends State<CaretakerPersonalDetailsTab> {
  AddCommentController addCommentController =
      Get.find(tag: 'addCommentController');
  SignUPCaretakerController signUPCaretakerController =
      Get.find(tag: "signUPCaretakerController");
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
      Get.find(tag: 'supervisorAddCommentController');
  final RxBool isFirstContainerVisible = true.obs;
  final RxBool isTab1 = false.obs;
  final SignUpController signUpController = Get.find(tag: 'signUpController');

  var chatList = [].obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUPCaretakerController.getCareTakerData();
    signUpController.getSuperVisorData();
    signUpController.getSuperVisor();
    log('This is SuperVisorName ${signUpController.superVisorName}');
    log('This is superVisorId ${signUpController.superVisorId}');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.5.h),
                        child: const Text(
                          "Personal Details",
                          style: TextStyle(
                            fontFamily: MyConstants.mediumFontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: CustomColors.customBlue1Color,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomPatientWidget(
                                label: 'Name', answer: widget.userName),
                            CustomPatientWidget(
                                label: 'Initials', answer: widget.userInitial),
                            CustomPatientWidget(
                                label: 'Last period(First day), full date',
                                answer: widget.userLastPeriod),
                            CustomPatientWidget(
                                label: 'Previous pregnancies',
                                answer: widget.userPreviousPregnancies),
                            CustomPatientWidget(
                                label:
                                    'Mode of deliveries (vaginal delivery or operative delivery)',
                                answer: widget.userVaginalDelivery),
                            CustomPatientWidget(
                                label: 'Marital status',
                                answer: widget.userMaritalStatus),
                            CustomPatientWidget(
                                label: 'Level of education',
                                answer: widget.userLevelOfEducation),
                            CustomPatientWidget(
                                label: 'Religion',
                                answer: widget.userReligion),
                            CustomPatientWidget(
                                label: 'SourceOfIncome',
                                answer: widget.userSourceOfIncome),
                            CustomPatientWidget(
                                label: 'Age',
                                answer: widget.userAge),
                            CustomPatientWidget(
                                label: 'Ethnicity',
                                answer: widget.userEthnicity),
                            CustomPatientWidget(
                                label: 'Any known medical condition',
                                answer: widget.userMedicalCondition),
                            CustomPatientWidget(
                                label: 'No of children and year of delivery',
                                answer:
                                    widget.userNoOfChildrenAndYearOfDelivery),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: Container(
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
                                    : SvgPicture.asset('assets/svg/circle.svg'),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  'Comment',
                                  style: TextStyle(
                                      fontFamily: MyConstants.mediumFontFamily,
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
                              ? Obx(
                                  () => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        superVisoraddCommentControllerTab1
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
                                              child :Text(
                                                superVisoraddCommentControllerTab1
                                                    .CommentList[index],
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
                                              child:Text(
                                                superVisoraddCommentControllerTab1
                                                    .senderNameList[index],
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
                                  ),
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
                                              keyboardType: TextInputType.text,
                                              controller: addCommentController
                                                  .addCommentControllerTab1,
                                              style: TextStyle(fontSize: 13.px),
                                              // focusNode: focusNode,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Write message...',
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
                                                color: const Color(0xffA69EFF),
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
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ));
  }
}
