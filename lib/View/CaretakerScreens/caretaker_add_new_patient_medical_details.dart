import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Widgets/custom_textfield_medical.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../Widgets/custom_text_field.dart';

class CaretakerAddNewPatientMedicalDetails extends StatefulWidget {
  const CaretakerAddNewPatientMedicalDetails({Key? key}) : super(key: key);

  @override
  State<CaretakerAddNewPatientMedicalDetails> createState() => _CaretakerAddNewPatientMedicalDetailsState();
}

class _CaretakerAddNewPatientMedicalDetailsState extends State<CaretakerAddNewPatientMedicalDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: (){
                Get.back();
              },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text(
                "Add New patient",
                style: TextStyle(
                    fontFamily: MyConstants.boldFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
                width: 30,
              )
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: SingleChildScrollView(
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.5.h,
                ),
                Text(
                  "Medical Details",
                  style: TextStyle(
                      color: CustomColors.customBlue1Color,
                      fontSize: 13,
                      fontFamily: MyConstants.mediumFontFamily,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldMedical(
                  label: "Date",
PrefixIcon: SvgPicture.asset("assets/svg/1image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Estimated Gestational Age",
                  PrefixIcon: SvgPicture.asset("assets/svg/2image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "SFH",
                  PrefixIcon: SvgPicture.asset("assets/svg/3image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Fatal Heart Rate (FHR)",
                  PrefixIcon: SvgPicture.asset("assets/svg/4image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Weight",
                  PrefixIcon: SvgPicture.asset("assets/svg/5image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Height",
                  PrefixIcon: SvgPicture.asset("assets/svg/6image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "BMI",
                  PrefixIcon: SvgPicture.asset("assets/svg/7image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "BP",
                  PrefixIcon: SvgPicture.asset("assets/svg/8image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Urine Test",
                  PrefixIcon: SvgPicture.asset("assets/svg/9image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Glucose level",
                  PrefixIcon: SvgPicture.asset("assets/svg/10ten.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Blood level",
                  PrefixIcon: SvgPicture.asset("assets/svg/10image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "Temperature",
                  PrefixIcon: SvgPicture.asset("assets/svg/11image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFieldMedical(
                  label: "TT & IPT",
                  PrefixIcon: SvgPicture.asset("assets/svg/12image.svg"),
                  keyboardType: TextInputType.streetAddress,
                ),

                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(14.h, 4.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: CustomColors.mainAppColor),
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,fontSize: 13,color: Colors.white),
                      )),
                ),
                SizedBox(height: 1.h,width: 1.h,)
              ]),
        ),
      ),
    );
  }
}
