import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Supervisor/refer_other_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';

class PersonalDetailsTab extends StatefulWidget {
  const PersonalDetailsTab({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsTab> createState() => _PersonalDetailsTabState();
}

class _PersonalDetailsTabState extends State<PersonalDetailsTab> {
  final TextEditingController messageController1 =TextEditingController();
  final RxBool isFirstContainerVisible = true.obs;
  final RxBool isTab1 =false.obs;
  var chatList =[].obs;
  List<String> labelname = [
    "Name",
    "Initials",
    "Last period(First day), full date ",
    "Previous pregnancies",
    "Mode of deliveries (vaginal delivery or operative delivery)",
    "Marital status",
    "Level of education",
    "Religion and source of income",
    "Ethnicity",
    "Any known medical condition",
    "No of children and year of delivery",
  ];
  List<String> titletext = [
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
    "Answer",
  ];

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
                padding: EdgeInsets.symmetric(horizontal: 6.h),
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  itemCount: labelname.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(labelname[index],
                              style: TextStyle(
                                  fontSize: 10.px,
                                  color: CustomColors.customBlackColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: MyConstants.mediumFontFamily)),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(titletext[index],
                              style: TextStyle(
                                  fontSize: 10.px,
                                  color: CustomColors.customDarkBlackColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: MyConstants.mediumFontFamily)),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: CustomColors.customGreyBoldColor,
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 2.h,
              ),




              Padding(
                padding:  EdgeInsets.symmetric(horizontal:5.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadiusDirectional.circular(8),
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
                  child: Padding(
                    padding: isTab1.value == true
                        ? EdgeInsets.symmetric(
                        horizontal: 1.5.w, vertical: 1.5.h)
                        : EdgeInsets.symmetric(
                        horizontal: 1.5.w, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ReferOtherScreen()));
                        },
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                                      style: TextStyle(fontFamily:  MyConstants.mediumFontFamily,
                                          fontSize: 13.px,
                                          fontWeight: FontWeight.w500,
                                          color:
                                          const Color(0xff9086FF)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 14.h,),
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
                            ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: chatList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment:
                                  Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius
                                        .only(
                                      topLeft:
                                      Radius.circular(
                                          12),
                                      topRight:
                                      Radius.circular(
                                          12),
                                    ),
                                    color: const Color(
                                        0xffFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff000000).withOpacity(0.15), blurRadius: 8,
                                        offset: const Offset(0, 1),),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(right: 1.w, left: 11.9.w, top: 1.h),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                    child: Text(
                                      chatList[index],
                                      style: TextStyle(
                                          fontSize: 10.px),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment:
                                  Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius
                                        .only(
                                      bottomLeft:
                                      Radius.circular(
                                          12),
                                      bottomRight:
                                      Radius.circular(
                                          12),
                                    ),
                                    color: const Color(
                                        0xffFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(
                                            0xff000000)
                                            .withOpacity(
                                            0.15),
                                        blurRadius: 8,
                                        offset:
                                        const Offset(
                                            0, 1),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 1.w,
                                      left: 11.9.w,
                                      top: .2.h),
                                  child: Padding(
                                    padding: EdgeInsets
                                        .symmetric(
                                        horizontal:
                                        1.5.w,
                                        vertical: .5.h),
                                    child: Text(
                                      'Caretaker',
                                      style: TextStyle(fontFamily: MyConstants.mediumFontFamily,
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
                              borderRadius:
                              BorderRadius.circular(8),
                              color: const Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  const Color(0xff000000)
                                      .withOpacity(0.12),
                                  blurRadius: 8,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.5.w,
                                  vertical: 1.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: messageController1,
                                        style:
                                        TextStyle(
                                            fontSize:
                                            13.px),
                                        // focusNode: focusNode,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                            border:
                                            InputBorder
                                                .none,
                                            hintText:
                                            'Write message...',
                                            hintStyle: TextStyle(fontFamily: MyConstants.regularFontFamily,
                                                fontSize: 10.px,fontWeight: FontWeight.w400,
                                                color: CustomColors.customLightGreyColor))),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      chatList.add(messageController1.text);messageController1.clear();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(
                                              0xffA69EFF),
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              8)),
                                      height: 3.h,
                                      width: 6.h,
                                      child: Center(
                                        child: Text(
                                          'Send',
                                          style: TextStyle(fontFamily:MyConstants.regularFontFamily ,
                                              color: Colors
                                                  .white,
                                              fontSize: 10.px,
                                              fontWeight:
                                              FontWeight
                                                  .w400),
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
