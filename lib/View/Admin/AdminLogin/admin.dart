import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';

import 'package:kama_app/View/Widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../ViewModel/AdminController/admin_login_controller.dart';
import '../../Supervisor/supervisor_login_screen.dart';
import 'admin_login.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int selectedContainer = 0;
  AdminLoginController adminLoginController =Get.find(tag: "adminLoginController");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/backgroundsplash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SvgPicture.asset("assets/svg/splashnew.svg"),
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
                  height: 5.h,
                ),
                Text(
                  "WHO ARE YOU",
                  style: TextStyle(
                    fontFamily: MyConstants.boldFontFamily,
                    fontSize: 20,
                    color: CustomColors.customBlackColor,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Select your role",
                  style: TextStyle(
                    fontFamily: MyConstants.regularFontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.customBlackColor,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:3.h,right: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildRoleContainer(0, "Admin"),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            buildRoleContainer(1, "User"),
                          ],
                        ),
                      ),
                      Transform.scale(scale: 0.7,
                          child: Image.asset("assets/png/child1.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomElevatedButton(
                  buttonText: "Next",
                  buttonColor: CustomColors.mainAppColor,
                  onPressed: () { if (selectedContainer ==0){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>AdminSignIn()));
                  }else if (selectedContainer ==1){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SupervisorLoginScreen()));
                  }

                  },
                ),
              ],
            ),
          ),
        ),
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
            height: 3.h,
            width: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
              ),
            ),
            child: Center(
              child: Container(
                height: 1.5.h,
                width: 1.5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? CustomColors.mainAppColor : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 3.h),
        Text(
          role,textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: MyConstants.boldFontFamily,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
          ),
        ),
      ],
    );
  }
}
