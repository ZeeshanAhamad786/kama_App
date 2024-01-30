import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/Utils/Colors/colors.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import 'package:kama_app/View/CaretakerScreens/signup_caretaker.dart';
import 'package:kama_app/View/Supervisor/supervisor_signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Constant/Constant.dart';
import '../BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';
import '../Widgets/custom_button.dart';
import 'forgot_screen_supervisor.dart';

class SupervisorLoginScreen extends StatefulWidget {
  const SupervisorLoginScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorLoginScreen> createState() => _SupervisorLoginScreenState();
}

class _SupervisorLoginScreenState extends State<SupervisorLoginScreen> {
  bool firstButton = true;
  bool secondButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h, top: 10.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: CustomColors.customBlackColor,
                    size: 24,
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/splashnew.svg",
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                )
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          RichText(
            text: TextSpan(
              text: 'KAMA ',
              style: TextStyle(
                fontSize: 24,
                color: CustomColors.mainAppColor,
                fontWeight: FontWeight.w600,
                fontFamily: MyConstants.boldFontFamily,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'CARE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.customPinkColor,
                    fontFamily: MyConstants.boldFontFamily,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.4.h,
          ),
          Text(
            "Keep All Mothers Alive",
            style: TextStyle(
              fontFamily: MyConstants.regularFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: CustomColors.customBlackColor,
            ),
          ),
          SizedBox(
            height: 6.5.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: CustomColors.customBlackColor.withOpacity(0.15),
                  offset: Offset(0, 1),
                  blurRadius: 8)
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
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
                              "Email",
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
                                                CaretakerBottomNavigationScreen()));
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
                                                Sign_Up_Caretaker()));
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
}
