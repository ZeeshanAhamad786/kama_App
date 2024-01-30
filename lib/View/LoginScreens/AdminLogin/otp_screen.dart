import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/LoginScreens/AdminLogin/reset_password.dart';
import 'package:kama_app/View/Widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen> {
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
            height: 5.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              SizedBox(
                height: 2.h,
              ),
              SvgPicture.asset("assets/svg/otpImage.svg"),
              SizedBox(
                height: 1.h,
              ),
              const Text("Enter Verification Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CustomColors.mainAppColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: MyConstants.regularFontFamily)),
              SizedBox(
                height: 3.h,
              ),
              const Text(
                "We have sent OTP on your Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: CustomColors.mainAppColor,
                    fontFamily: MyConstants.regularFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: PinCodeTextField(
                  length: 6,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  cursorColor: CustomColors.mainAppColor,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 45,
                      fieldWidth: 40,
                      selectedColor: CustomColors.customBlueColor,
                      activeFillColor: Colors.white,
                      inactiveColor:
                          CustomColors.customBlackColor.withOpacity(0.1),
                      activeColor: CustomColors.mainAppColor),
                  animationDuration: const Duration(milliseconds: 200),

                  onChanged: (value) {
                    log(value.toString());
                  },
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                  appContext: context, // Provide the context here
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomElevatedButton(
                  buttonText: "Next",
                  buttonColor: CustomColors.mainAppColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetScreen()));
                  }),
              SizedBox(
                height: 2.h,width: 2.h,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
