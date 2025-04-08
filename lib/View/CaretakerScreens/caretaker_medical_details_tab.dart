import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
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

class CaretakerMedicalDetailsTab extends StatefulWidget {
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
  final String patientId;
  final String? title;


  const CaretakerMedicalDetailsTab({Key? key,
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
     this.title,
    required this.patientId
  }) : super(key: key);

  @override
  State<CaretakerMedicalDetailsTab> createState() => _CaretakerMedicalDetailsTabState();
}

class _CaretakerMedicalDetailsTabState extends State<CaretakerMedicalDetailsTab> {
  final SignUpController signUpController = Get.find(tag: 'signUpController');

  AddCommentController addCommentController=Get.find(tag: 'addCommentController');
  SignUPCaretakerController signUPCaretakerController =Get.find(tag: "signUPCaretakerController");
  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
  final TextEditingController messageControllerTab2 =TextEditingController();
  var chatList =[].obs;
  String? selectedModel;
  List<String> models = ['10/12/2024', '13/12/2024', '1/12/2024', '11/12/2024'];


  final RxBool isFirstContainerVisible = true.obs;
  final RxBool isTab1 = false.obs;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUPCaretakerController.getCareTakerData();
    signUpController.getSuperVisorData();
    signUpController.getSuperVisor();


  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
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
                child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Medical Details",
                      style: TextStyle(
                        fontFamily: MyConstants.mediumFontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: CustomColors.customBlue1Color,
                      ),
                    ),
                    // SizedBox(width: 5 .h,),
                    // Container(
                    //    width:100.px ,
                    //   height: 4.h,
                    //
                    //   padding: EdgeInsets.only(left: 1.h, right: 2.h),
                    //   decoration: BoxDecoration(
                    //       borderRadius:  BorderRadius.circular(10),
                    //
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color:
                    //             CustomColors.customBlackColor.withOpacity(0.15),
                    //             blurRadius: 4,
                    //             offset: const Offset(0, 1))
                    //       ],
                    //       color: Colors.white),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton2<String>(
                    //       isExpanded: true,
                    //       hint:  Text(
                    //         '10/12/2024',
                    //         style: TextStyle(
                    //           fontSize: 10,fontWeight: FontWeight.w600,
                    //           color: CustomColors.customBlue1Color
                    //         ),
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //
                    //       items: models
                    //           .map((String item) => DropdownMenuItem<String>(
                    //         value: item,
                    //         child: Text(
                    //           item,
                    //           style: const TextStyle(
                    //               fontSize: 10,fontWeight: FontWeight.w600,
                    //               color: CustomColors.customBlue1Color
                    //           ),
                    //           overflow: TextOverflow.ellipsis,
                    //         ),
                    //       ))
                    //           .toList(),
                    //       value: selectedModel,
                    //       onChanged: (String? value) {
                    //         setState(() {
                    //           selectedModel = value!;
                    //         });
                    //       },
                    //       iconStyleData: const IconStyleData(
                    //         icon:Icon(Icons.arrow_drop_down_outlined),
                    //         iconSize: 14,
                    //       ),
                    //       dropdownStyleData: DropdownStyleData(
                    //         maxHeight: 200,
                    //         width: MediaQuery.of(context).size.width/2.8,
                    //         decoration: BoxDecoration(
                    //             borderRadius:  BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    //
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color:
                    //                   CustomColors.customBlackColor.withOpacity(0.15),
                    //                   blurRadius: 4,
                    //                   offset: const Offset(0, 1))
                    //             ],
                    //             color: Colors.white),
                    //         offset: const Offset(-10, 0),
                    //         scrollbarTheme: ScrollbarThemeData(
                    //           radius: const Radius.circular(40),
                    //           thickness: MaterialStateProperty.all<double>(6),
                    //           thumbVisibility:
                    //           MaterialStateProperty.all<bool>(true),
                    //         ),
                    //       ),
                    //       menuItemStyleData: const MenuItemStyleData(
                    //         height: 40,
                    //         padding: EdgeInsets.only(left: 14, right: 14),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

Padding(
  padding:  EdgeInsets.symmetric(horizontal: 5.h),
  child: Column(children: [
    CustomPatientMedicalWidget(
      labelName: "Date",
      tabImage: "assets/svg/1image.svg",
      titleText:widget.selectedDate,
    ),
    CustomPatientMedicalWidget(
      labelName: "Estimated Gestational Age",
      tabImage: "assets/svg/2image.svg",
      titleText: widget.estimatedGestationalAge,
    ),
    CustomPatientMedicalWidget(
      labelName:  "SFH",
      tabImage: "assets/svg/3image.svg",
      titleText: widget.sFH,
    ),
    CustomPatientMedicalWidget(
      labelName:  "Fetal Heart Rate (FHR)",
      tabImage: "assets/svg/4image.svg",
      titleText: widget.fetalHeartRate,
    ),
    CustomPatientMedicalWidget(
      labelName: "Weight",
      tabImage: "assets/svg/5image.svg",
      titleText: widget.weight,
    ),
    CustomPatientMedicalWidget(
      labelName:  "Height",
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
      labelName: "Glucose level" ,
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

  ],),
),


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
              ),
              SizedBox(
                height: 3.h,
              ),
            ]),
      ),
    ));

  }
}
