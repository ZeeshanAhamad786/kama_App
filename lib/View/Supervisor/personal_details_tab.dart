import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import '../Widgets/SupervisorWidget/custom_personal_widget.dart';

class PersonalDetailsTab extends StatefulWidget {
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
  const PersonalDetailsTab(
      {Key? key,
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
      this.userTimeStamp})
      : super(key: key);

  @override
  State<PersonalDetailsTab> createState() => _PersonalDetailsTabState();
}

class _PersonalDetailsTabState extends State<PersonalDetailsTab> {
  PatientPersonalDetailsController patientPersonalDetailsController =
      Get.find(tag: "patientPersonalDetailsController");
  final TextEditingController messageController1 = TextEditingController();
  final RxBool isFirstContainerVisible = true.obs;
  final RxBool isTab1 = false.obs;
  var chatList = [].obs;

  final SignUpController signUpController = Get.find(tag: 'signUpController');
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
      Get.find(tag: 'supervisorAddCommentController');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpController.getSuperVisorData();

  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
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
                  CustomSupervisorPersonalWidget(
                      label: 'Name', answer: widget.userName),
                  CustomSupervisorPersonalWidget(
                      label: 'Initials', answer: widget.Initial),
                  CustomSupervisorPersonalWidget(
                      label: 'Last period(First day), full date ',
                      answer: widget.lastPeriod),
                  CustomSupervisorPersonalWidget(
                      label: 'Previous pregnancies',
                      answer: widget.previousPregnancies),
                  CustomSupervisorPersonalWidget(
                      label:
                          'Mode of deliveries (vaginal delivery or operative delivery)',
                      answer: widget.vaginalDelivery),
                  CustomSupervisorPersonalWidget(
                      label: 'Marital status', answer: widget.maritalStatus),
                  CustomSupervisorPersonalWidget(
                      label: 'Level of education',
                      answer: widget.levelOfEducation),
                  CustomSupervisorPersonalWidget(
                      label: 'Religion and source of income',
                      answer: widget.religionAndSourceOfIncome),
                  CustomSupervisorPersonalWidget(
                      label: 'Ethnicity', answer: widget.ethnicity),
                  CustomSupervisorPersonalWidget(
                      label: 'Any known medical condition',
                      answer: widget.medicalCondition),
                  CustomSupervisorPersonalWidget(
                      label: 'No of children and year of delivery',
                      answer: widget.noOfChildrenAndYearOfDelivery),
                  SizedBox(
                    height: 2.h,
                  ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        isTab1.value
                                            ? SvgPicture.asset(
                                                'assets/svg/circleminus.svg')
                                            : SvgPicture.asset(
                                                'assets/svg/circle.svg'),
                                        SizedBox(
                                          width: 2.w,
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
                                  SizedBox(
                                    width: 14.h,
                                  ),
                                  SvgPicture.asset("assets/svg/referimage.svg"),
                                  Text(
                                    "Refer >>",
                                    style: TextStyle(
                                      color: CustomColors.mainAppColor,
                                      fontFamily: MyConstants.regularFontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
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
                                                    color:
                                                        const Color(0xff000000)
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
                                                  superVisoraddCommentControllerTab1
                                                      .CommentList[index]??"",
                                                  style: TextStyle(
                                                      fontSize: 10.px),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                ),
                                                color: const Color(0xffFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xff000000)
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
                                                child:  Text(
                                                  superVisoraddCommentControllerTab1.senderNameList[index]??"",

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
                                                keyboardType:
                                                    TextInputType.text,
                                                controller:
                                                    superVisoraddCommentControllerTab1
                                                        .superVisoraddCommentControllerTab1,
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
                                              superVisoraddCommentControllerTab1
                                                  .getSenderData(widget.userId);
                                              superVisoraddCommentControllerTab1
                                                  .supervisorAddCommentToFireStore(
                                                      signUpController
                                                          .superVisorName,
                                                      signUpController
                                                          .superVisorId,
                                                      superVisoraddCommentControllerTab1
                                                          .superVisoraddCommentControllerTab1
                                                          .text,
                                                      widget.userId);
                                              //   log("This is Id ${superVisoraddCommentControllerTab1.patientId}");
                                              //

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
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ]),
          ),
        ));
  }
}
