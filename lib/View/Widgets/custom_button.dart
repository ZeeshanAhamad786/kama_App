import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;
   // final  RxBool? loading;


  CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    // this.loading,

  });


  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(fixedSize: Size(18.h, 3.6.h),
        primary: buttonColor, // Button color

        // Text color
      ),
      child: Text(buttonText,textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.white)),
    );

  }
}