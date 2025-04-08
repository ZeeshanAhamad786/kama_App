import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';
import '../../../ViewModel/AdminController/new_center_add_controller.dart';
import '../../Widgets/custom_text_field.dart';
import '../AdminLogin/custom_textfield_admin.dart';


class AddNewCenterScreen extends StatefulWidget {
  AddNewCenterScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCenterScreen> createState() => _AddNewCenterScreenState();
}

class _AddNewCenterScreenState extends State<AddNewCenterScreen> {
  AddNewCenterController addNewCenterController=Get.find(tag: 'addNewCenterController');

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
        padding: EdgeInsets.symmetric(horizontal: 2.7.h),
        child: SingleChildScrollView(
          child:
          Obx(()=>
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
                    CustomTextFieldAdmin(controller: addNewCenterController.centerNameController,
                      label: "Center name",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerAddressController,
                      label: "Center address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerStateController,
                      label: "Local government (state) ",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerRegNumberController,
                      label: "Registration number",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerDOEController,
                      readOnly: true,onTap: () => addNewCenterController.pickedDate(context),
                      hintText: addNewCenterController.centerDOEController.text,
                      label: "Date of establishment",
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerPPPYController,
                      label: "Estimated number of pregnant patients per year",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerEDPYController,
                      label: "Estimated number of deliveries per year",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerStaffNumberController,
                      label: "Staff number",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerFounderController,
                      label: "Founder",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(
                      controller: addNewCenterController.centerPhoneNumberController,
                      label: "Phone number",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFieldAdmin(controller: addNewCenterController.centerEmailController,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    addNewCenterController.loading.value==true?Center(child: CircularProgressIndicator(color: CustomColors.mainAppColor,)):
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(fixedSize: Size(14.h, 4.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: CustomColors.mainAppColor),
                          onPressed: () {

                            addNewCenterController.addNewCenter(
                            );
                          },
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
      ),
    );
  }
}