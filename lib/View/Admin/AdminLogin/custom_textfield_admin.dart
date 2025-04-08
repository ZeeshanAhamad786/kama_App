import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';

class CustomTextFieldAdmin extends StatelessWidget {
  final Callback? onTap;
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final bool readOnly;


  final  controller;

  const CustomTextFieldAdmin({
    Key? key,
    this.onTap,
    this.hintText,
    required this.label,
    this.readOnly=false,

    required this.keyboardType, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.px,
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
          child: TextFormField(readOnly:readOnly ,
            style: TextStyle(fontSize: 14.px),
            onTap: onTap,
            controller: controller,
            cursorColor: CustomColors.mainAppColor,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
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
          ),
        ),
      ],
    );
  }
}