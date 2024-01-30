import 'package:flutter/material.dart';
import 'package:kama_app/Utils/Constant/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';

class CaretakerReferScreen extends StatefulWidget {
  const CaretakerReferScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CaretakerReferScreen> createState() => _CaretakerReferScreenState();
}

class _CaretakerReferScreenState extends State<CaretakerReferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          centerTitle: true,
          title: Text(
            "Refer",
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
              Text("Refer to center name",
                  style: TextStyle(
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
              Text("12:30 AM",style: TextStyle(
                  fontFamily: MyConstants.regularFontFamily,
                  color: CustomColors.customBlackColor,fontWeight: FontWeight.w400,fontSize: 10))
            ],
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 7.h,
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

                  Text("Mohsin",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: CustomColors.customBlackColor,
                          fontSize: 10,
                          fontFamily: MyConstants.regularFontFamily)),

                ],
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
              Text("Refer from center name", style: TextStyle(
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
          Container(
            height: 7.h,
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

                  Text("Ali",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: CustomColors.customBlackColor,
                          fontSize: 10,
                          fontFamily: MyConstants.regularFontFamily)),

                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
