import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/Supervisor/supervisor_change_password.dart';
import 'package:kama_app/View/Supervisor/supervisor_login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingSupervisorScreen extends StatefulWidget {
  const SettingSupervisorScreen({Key? key,}) : super(key: key);

  @override
  State<SettingSupervisorScreen> createState() => _SettingSupervisorScreenState();
}

class _SettingSupervisorScreenState extends State<SettingSupervisorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          centerTitle: true,
          title: Text(
            "Setting",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: MyConstants.boldFontFamily,
                fontSize: 16),
          )),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: 5.h,),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SupervisorChangePassword()));
              },
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: MyConstants.regularFontFamily,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.customBlackColor),
                ),
              ),
              SizedBox(height: 2.h,),
              Divider(color: CustomColors.customLightGreyColor,),
              SizedBox(height: 2.h,),
              Text(
                "Change Email",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: MyConstants.regularFontFamily,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.customBlackColor),
              ),
              SizedBox(height: 2.h,),
              Divider(color: CustomColors.customLightGreyColor,),
              SizedBox(height: 2.h,),
              GestureDetector(onTap:  () async{
                await FirebaseAuth.instance.signOut();
                log("sign out");
                Get.offAll(()=>SupervisorLoginScreen());
              },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: MyConstants.regularFontFamily,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.customBlackColor),
                ),
              ),
              SizedBox(height: 2.h,),
              Divider(color: CustomColors.customLightGreyColor,)
            ]),
      ),
    );
  }
}
