import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Supervisor/refer_other_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';

class MedicalDetailsTab extends StatefulWidget {
  const MedicalDetailsTab({Key? key}) : super(key: key);

  @override
  State<MedicalDetailsTab> createState() => _MedicalDetailsTabState();
}

class _MedicalDetailsTabState extends State<MedicalDetailsTab> {
  final TextEditingController messageController2 =TextEditingController();
  final RxBool isFirstContainerVisible=true.obs;
  final RxBool isTab2 =false.obs;
  var chatList =[].obs;
  String? selectedModel;
  List<String> models = ['10/12/2024', '13/12/2024', '1/12/2024', '11/12/2024'];
  List<String> labelname = [
    "Date",
    "Estimated Gestational Age",
    "SFH",
    "Fatal Heart Rate (FHR)",
    "Weight",
    "Height",
    "BMI",
    "BP",
    "Urine Test",
    "Glucose level",
    "Blood level",
    "Temperature",
    "TT & IPT",
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
    "Answer",
    "Answer",
  ];
  List<String> tabImage = [
    "assets/svg/1image.svg",
    "assets/svg/2image.svg",
    "assets/svg/3image.svg",
    "assets/svg/4image.svg",
    "assets/svg/5image.svg",
    "assets/svg/6image.svg",
    "assets/svg/7image.svg",
    "assets/svg/8image.svg",
    "assets/svg/9image.svg",
    "assets/svg/10ten.svg",
    "assets/svg/10image.svg",
    "assets/svg/11image.svg",
    "assets/svg/12image.svg",
  ];

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
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                        fontFamily: MyConstants.mediumFontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: CustomColors.customBlue1Color,
                      ),
                    ),
                    SizedBox(width: 5 .h,),
                    Container(
                      width: 100.px,
                      height: 4.h,

                      padding: EdgeInsets.only(left: 1.h, right: 2.h),
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),

                          boxShadow: [
                            BoxShadow(
                                color:
                                CustomColors.customBlackColor.withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 1))
                          ],
                          color: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint:  Text(
                            '10/12/2024',
                            style: TextStyle(
                                fontSize: 10,fontWeight: FontWeight.w600,
                                color:CustomColors.customBlue1Color
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          items: models
                              .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 10,fontWeight: FontWeight.w600,
                                  color:CustomColors.customBlue1Color
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedModel,
                          onChanged: (String? value) {
                            setState(() {
                              selectedModel = value!;
                            });
                          },
                          iconStyleData: const IconStyleData(
                            icon:Icon(Icons.arrow_drop_down_sharp),
                            iconSize: 14,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width/2.8,
                            decoration: BoxDecoration(
                                borderRadius:  BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),

                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      CustomColors.customBlackColor.withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1))
                                ],
                                color: Colors.white),
                            offset: const Offset(-10, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder( physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(tabImage[index]),
                              SizedBox(
                                width: 0.5.h,
                              ),
                              Text(titletext[index],
                                  style: TextStyle(
                                      fontSize: 10.px,
                                      color: CustomColors.customDarkBlackColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                      MyConstants.mediumFontFamily)),
                            ],
                          ),
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
                    padding: isTab2.value == true
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
                                  if (isTab2.value == true) {
                                    isTab2.value = false;
                                  } else {
                                    isTab2.value = true;
                                  }
                                },
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    isTab2.value
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
                          padding: isTab2.value == true
                              ? EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: 1.h)
                              : EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: 0),
                          child: const Divider(
                            color: CustomColors.customGreyBoldColor,
                          ),
                        ),
                        // isPressed.value==true?
                        isTab2.value == true
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
                        isTab2.value == true
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
                                        controller: messageController2,
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
                                      chatList.add(messageController2.text);messageController2.clear();
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
