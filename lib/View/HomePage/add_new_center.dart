import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../Widgets/custom_text_field.dart';

class AddNewCenterScreen extends StatefulWidget {
  const AddNewCenterScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCenterScreen> createState() => _AddNewCenterScreenState();
}

class _AddNewCenterScreenState extends State<AddNewCenterScreen> {
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
                "Add New Center",
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
              "Center Details",
              style: TextStyle(
                  color: CustomColors.customBlue1Color,
                  fontSize: 13,
                  fontFamily: MyConstants.mediumFontFamily,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextField(
              label: "Center name",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Center address",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Local government (state) ",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Registration number",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Date of establishment",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Estimated number of pregnant patients per year",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Estimated number of deliveries per year",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Staff number",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Founder",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Phone number",
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              label: "Email",
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
