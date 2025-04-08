import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';

class CustomSupervisorMedicalWidget extends StatelessWidget {
  final String labelName;
  final String tabImage;
  final  titleText;

  const CustomSupervisorMedicalWidget({
    Key? key,
    required this.labelName,
    required this.tabImage,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelName,
            style: TextStyle(
              fontSize: 10,
              color: CustomColors.customBlackColor,
              fontWeight: FontWeight.w500,
              fontFamily: MyConstants.mediumFontFamily,
            ),
          ),
          SizedBox(height: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(tabImage),
              SizedBox(width: 0.5),
              Text(
                titleText,
                style: TextStyle(
                  fontSize: 10,
                  color: CustomColors.customDarkBlackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: MyConstants.mediumFontFamily,
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Divider(color: CustomColors.customGreyBoldColor),
        ],
      ),
    );
  }
}