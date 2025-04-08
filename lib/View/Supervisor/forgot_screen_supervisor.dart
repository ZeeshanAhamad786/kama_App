
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/Supervisor/supervisor_login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';
import '../../ViewModel/Supervisor/forgot_controller.dart';
import '../Widgets/custom_button.dart';


class ForgotScreenSupervisor extends StatefulWidget {
  const ForgotScreenSupervisor({Key? key}) : super(key: key);

  @override
  State<ForgotScreenSupervisor> createState() => _ForgotScreenSupervisorState();
}

class _ForgotScreenSupervisorState extends State<ForgotScreenSupervisor> {
  ForgotController forgotController =Get.find(tag: "forgotController");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Obx(()=>Column(children: [
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
                    size: 24.px,
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
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            height: 40.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: Offset(0, 1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: CustomColors.mainAppColor,
                    fontFamily: MyConstants.regularFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
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
                        controller:forgotController.forgotEmailController,
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
                  forgotController.isLoading.value
                        ? Center(
                          child: CircularProgressIndicator(
                                                color: Colors.blue,
                                              ),
                        )
                        : Center(
                      child: CustomElevatedButton(
                          buttonText: ("Next"),
                          buttonColor: CustomColors.mainAppColor,
                          onPressed: () {
                            forgotController.forgotPassword();

                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SupervisorLoginScreen()));
                          }),
                    ),
                    SizedBox(
                      width: 5.h,
                      height: 5.h,
                    )
                  ],
                ),
              ),
            ]),
          )
        ]),)
      ),
    );
  }
}
