import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart'; // Import the Sizer library for responsive UI

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  final  controller;

  const CustomTextField({
    Key? key,
    required this.label,
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
            keyboardType: keyboardType,style: TextStyle(fontSize: 12,fontFamily: MyConstants.regularFontFamily),
            decoration: InputDecoration(
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
