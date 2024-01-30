import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/Utils/Colors/colors.dart';
import 'package:kama_app/View/BottomNavigationBar/bottom_navigation_bar_screen.dart';
import 'package:kama_app/View/HomePage/home_screen.dart';
import 'package:kama_app/View/LoginScreens/AdminLogin/forgot_password.dart';
import 'package:kama_app/View/Widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Constant/Constant.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
        
          Padding(
            padding: EdgeInsets.only(left: 2.h, top: 10.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell( onTap:(){
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
            height: 11.5.h,
          ),
          const Text(
            "Admin Iogin",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: CustomColors.mainAppColor,
                fontFamily: MyConstants.boldFontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 7.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.08)))),
                  ),
                ),
                SizedBox(
                  height: 3.h,
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
                 SizedBox(height: 1.h,),
                 Align(alignment: Alignment.centerRight,
                   child: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const ForgotPassword()));
                   },
                     child: const Text(
                      "Forgot password",
                      style: TextStyle(
                          fontFamily: MyConstants.regularFontFamily,
                          fontWeight: FontWeight.w400,fontSize: 10,color: CustomColors.mainAppColor),
                                   ),
                   ),
                 ),
                SizedBox(height: 7.h,),
                Center(
                  child: CustomElevatedButton(buttonText: ("Login"),buttonColor: CustomColors.mainAppColor,
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BottomNavigationBarScreen()));
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
