import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';

class CustomSupervisorPersonalWidget extends StatelessWidget {
  final String label;
  final  answer;

  CustomSupervisorPersonalWidget({

   required this.label, this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 10.px,
                color: CustomColors.customBlackColor,
                fontWeight: FontWeight.w500,
                fontFamily: MyConstants.mediumFontFamily),
          ),
          SizedBox(height: 0.5.h),
          Text(
            answer,
            style: TextStyle(
                fontSize: 10.px,
                color: CustomColors.customDarkBlackColor,
                fontWeight: FontWeight.w500,
                fontFamily: MyConstants.mediumFontFamily),
          ),
          SizedBox(height: 1.h),
          Divider(color: CustomColors.customGreyBoldColor),
        ],
      ),
    );
  }
}
