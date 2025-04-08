import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart'; // Import the Sizer library for responsive UI

class CustomTextFieldMedical extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final Widget? PrefixIcon;
  final Widget?  suffixIcon;
  final controller;
  final String? Function(String?)? validator;

  const CustomTextFieldMedical({
    Key? key,
    required this.label,
    required this.keyboardType, this.PrefixIcon, this.controller, this.validator, this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            fontFamily: MyConstants.mediumFontFamily,
            color: CustomColors.customBlackColor,
          ),
        ),
        SizedBox(height: 0.5.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: TextFormField(controller: controller,
            cursorColor: CustomColors.mainAppColor,
            keyboardType: keyboardType,
            style: TextStyle(
                fontSize: 12, fontFamily: MyConstants.regularFontFamily),
            decoration: InputDecoration(
              prefixIcon: Transform.scale(scale: 0.5,
                  child: PrefixIcon),
           suffixIcon: Transform.scale(scale: 0.8,
               child: suffixIcon),
              contentPadding: EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.08),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.08),
                ),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}



//
class CustomPatientWidget extends StatelessWidget {
  final String label;
  final answer;

  const CustomPatientWidget({
    Key? key,
    required this.label,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
//





class CustomPatientMedicalWidget extends StatelessWidget {
  final String labelName;
  final String tabImage;
  final  titleText;

  const CustomPatientMedicalWidget({
    Key? key,
    required this.labelName,
    required this.tabImage,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
