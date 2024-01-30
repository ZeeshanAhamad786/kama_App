import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/BottomNavigationBar/bottom_navigation_bar_screen.dart';
import 'package:kama_app/View/LoginScreens/AdminLogin/admin_login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';
class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: CustomColors.customBlackColor,
                    size: 24,
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/splashnew.svg",
                ),
                const SizedBox(
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
            text: const TextSpan(
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
          const Text(
            "Keep All Mothers Alive",
            style: TextStyle(
              fontFamily: MyConstants.regularFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: CustomColors.customBlackColor,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "Reset Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: CustomColors.mainAppColor,
                    fontFamily: MyConstants.regularFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
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
                            offset: const Offset(0, 1))
                      ]),
                      child: TextFormField(
                        cursorColor: CustomColors.mainAppColor,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08)))),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      "Confirm Password",
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
                            offset: const Offset(0, 1))
                      ]),
                      child: TextFormField(
                        cursorColor: CustomColors.mainAppColor,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08)))),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.mainAppColor,
                              fixedSize: Size(18.h, 3.6.h)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLogin()));
                          },
                          child: const Text(
                            "Reset Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyConstants.mediumFontFamily),
                          )),
                    )
                  ],
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
