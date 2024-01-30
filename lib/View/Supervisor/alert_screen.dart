import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kama_app/Utils/Constant/constant.dart';
import 'package:kama_app/View/Supervisor/personal_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key, }) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          centerTitle: true,
          title: Text(
            "Alert",
            style: TextStyle(
                fontSize: 16,
                fontFamily: MyConstants.boldFontFamily,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Lahore center", style: TextStyle(
              fontFamily: MyConstants.regularFontFamily,
              color: CustomColors.customBlackColor,fontWeight: FontWeight.w400,fontSize: 10)),
              SizedBox(
                width: 1.h,
              ),
              Expanded(
                  child: Divider(
                color: CustomColors.customLightGreyColor,
              )),
              SizedBox(
                width: 1.h,
              ),
              Text("12:30 AM" ,style: TextStyle(
                  fontFamily: MyConstants.regularFontFamily,
                  color: CustomColors.customBlackColor,fontWeight: FontWeight.w400,fontSize: 10))
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>PersonalDetails()));
          },
            child: Container(
              height: 8.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: CustomColors.customBlackColor.withOpacity(0.15),
                    offset: const Offset(0, 1),
                    blurRadius: 8)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("BP",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.customDarkRedColor,
                                    fontSize: 13,
                                    fontFamily: MyConstants.mediumFontFamily)),
                            Text("Mohsin",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.customBlackColor,
                                    fontSize: 10,
                                    fontFamily: MyConstants.regularFontFamily)),
                          ]),
                    ),
                    Text("200+",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.customDarkRedColor,
                            fontSize: 16,
                            fontFamily: MyConstants.boldFontFamily)),
                    SizedBox(
                      width: 0.4.h,
                    ),
                    SvgPicture.asset("assets/svg/triangle.svg")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Islamabad center", style: TextStyle(
              fontFamily: MyConstants.regularFontFamily,
              color: CustomColors.customBlackColor,fontWeight: FontWeight.w400,fontSize: 10)),
              SizedBox(
                width: 1.h,
              ),
              Expanded(
                  child: Divider(
                color: CustomColors.customLightGreyColor,
              )),
              SizedBox(
                width: 1.h,
              ),
              Text("01:30 PM", style: TextStyle(
                  fontFamily: MyConstants.regularFontFamily,
                  color: CustomColors.customBlackColor,fontWeight: FontWeight.w400,fontSize: 10))
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          InkWell(onTap:  () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>PersonalDetails()));
          },
            child: Container(
              height: 8.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: CustomColors.customBlackColor.withOpacity(0.15),
                    offset: Offset(0, 1),
                    blurRadius: 8)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sugar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.customDarkRedColor,
                                    fontSize: 13,
                                    fontFamily: MyConstants.mediumFontFamily)),
                            Text("Ali",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.customBlackColor,
                                    fontSize: 10,
                                    fontFamily: MyConstants.regularFontFamily)),
                          ]),
                    ),
                    Text("287+",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.customDarkRedColor,
                            fontSize: 16,
                            fontFamily: MyConstants.boldFontFamily)),
                    SizedBox(
                      width: 0.4.h,
                    ),
                    SvgPicture.asset("assets/svg/triangle.svg")
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
