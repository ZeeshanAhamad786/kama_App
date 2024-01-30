import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import 'package:kama_app/View/Supervisor/supervisor_login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';
import '../Supervisor/forgot_screen_supervisor.dart';
import '../Supervisor/supervisor_signup_screen.dart';
import '../Widgets/custom_button.dart';
class Sign_Up_Caretaker extends StatefulWidget {
  const Sign_Up_Caretaker({Key? key}) : super(key: key);

  @override
  State<Sign_Up_Caretaker> createState() => _Sign_Up_CaretakerState();
}

class _Sign_Up_CaretakerState extends State<Sign_Up_Caretaker> {
  RxBool loading =false.obs;
  int selectedContainer = 0;
  String? selectedModel;
  List<String> models = ['1', '2', '3', '4'];
  bool firstButton =false;
  bool secondButton =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 8.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_new, size: 24)),
                Text("Sign -up",
                    style: TextStyle(
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.mainAppColor)),
                SizedBox(
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.h),

            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: CustomColors.customBlackColor.withOpacity(0.15),
                  offset: Offset(0, 1),
                  blurRadius: 8)
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: firstButton == true
                                  ? CustomColors.customFilterBlueColor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8)))),
                          onPressed: () {
                            setState(() {
                              firstButton = true;
                              secondButton = false;
                            });
                          },
                          child: Text(
                            "Supervisor",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: MyConstants.mediumFontFamily,
                                color: firstButton
                                    ? Colors.white
                                    : CustomColors.customLightGreyColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: secondButton == true
                                    ? CustomColors.customFilterBlueColor
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)))),
                            onPressed: () {
                              setState(() {
                                secondButton = true;
                                firstButton = false;
                              });
                            },
                            child: Text(
                              "Care-taker",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: MyConstants.mediumFontFamily,
                                  color: secondButton
                                      ? Colors.white
                                      : CustomColors.customLightGreyColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                  firstButton == true
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: MyConstants.boldFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: MyConstants.boldFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ForgotScreenSupervisor()));
                          },
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                                fontFamily: MyConstants.regularFontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: CustomColors.customBlackColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: CustomElevatedButton(
                            buttonText: ("Login"),
                            buttonColor: CustomColors.mainAppColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          SupervisorBottomNavigationScreen()));
                            }),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I don't have any account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.customBlackColor,
                                  fontSize: 13,
                                  fontFamily:
                                  MyConstants.regularFontFamily)),
                          SizedBox(
                            width: 0.5.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          SupervisorSignUpScreen()));
                            },
                            child: Text("Sign-up ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.customBlueColor,
                                    fontSize: 13,
                                    fontFamily:
                                    MyConstants.regularFontFamily)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                      )
                    ],
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Choose community center ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
        
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 6.h,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 2.h, right: 2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: CustomColors.customBlackColor
                                      .withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1))
                            ],
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'None',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColors.customLightBlackColor,
                                  fontFamily: MyConstants.mediumFontFamily,
                                fontWeight: FontWeight.w500
        
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: models
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: CustomColors.customLightBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontWeight: FontWeight.w500
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
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              iconSize: 14,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: CustomColors.customBlackColor
                                            .withOpacity(0.15),
                                        blurRadius: 4,
                                        offset: const Offset(0, 1))
                                  ],
                                  color: Colors.white),
                              offset: const Offset(-15, 0),
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
                      SizedBox(height: 2.h,),
                      Text(
                        "Community Maternal Care Provider",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(height: 1.5.h,),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildRoleContainer(0, "Traditional Birth Attendant"),
                          SizedBox(
                            width: 0.8.h,
                          ),
                          Expanded(child: buildRoleContainer(1, "Faith Based Birth Attendant")),

                        ],
                      ),
        
        
        
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
        
        
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomElevatedButton(
                          buttonText: ("Sign up"),
                          buttonColor: CustomColors.mainAppColor,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                        CaretakerBottomNavigationScreen()));
                          }),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I don't have any account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.customBlackColor,
                                  fontSize: 13,
                                  fontFamily:
                                  MyConstants.regularFontFamily)),
                          SizedBox(
                            width: 0.5.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          SupervisorLoginScreen()));
                            },
                            child: Text("Sign-in ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.customBlueColor,
                                    fontSize: 13,
                                    fontFamily:
                                    MyConstants.regularFontFamily)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5, width: 5,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
  Widget buildRoleContainer(int index, String role) {
    bool isSelected = selectedContainer == index;

    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedContainer = index;
            });
          },
          child: Container(
            height: 2.h,
            width: 2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
              ),
            ),
            child: Center(
              child: Container(
                height: 1.2.h,
                width: 1.2.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? CustomColors.mainAppColor : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 0.8.h),
        Text(
          role,textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: MyConstants.mediumFontFamily,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
          ),
        ),
      ],
    );
  }
}
