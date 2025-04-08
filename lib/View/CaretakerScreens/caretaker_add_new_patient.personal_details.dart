import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/AdminController/new_center_add_controller.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Care_taker/sign_up_caretaker_controller.dart';
import '../Widgets/custom_text_field.dart';
import 'caretaker_add_new_patient_medical_details.dart';

class CaretakerAddNewPatientPersonalDetails extends StatefulWidget {
  const CaretakerAddNewPatientPersonalDetails({Key? key}) : super(key: key);

  @override
  State<CaretakerAddNewPatientPersonalDetails> createState() =>
      _CaretakerAddNewPatientPersonalDetailsState();
}

class _CaretakerAddNewPatientPersonalDetailsState
    extends State<CaretakerAddNewPatientPersonalDetails> {
  AddNewCenterController addNewCenterController =Get.find(tag: "addNewCenterController");
  SignUPCaretakerController signUPCaretakerController=Get.find(tag: 'signUPCaretakerController');


  RxBool isLoading = false.obs;
  PatientPersonalDetailsController patientPersonalDetailsController = Get.find(
      tag: "patientPersonalDetailsController");
  String? userVaginalDelivery;
  List<String> models = ['Vaginal ', 'Caesarean Delivery',];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUPCaretakerController.getCareTakerData();
    patientPersonalDetailsController.getPatientData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: () {
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
         Obx(()=> Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 height: 3.5.h,
               ),
               Text(
                 "Personal Details",
                 style: TextStyle(
                     color: CustomColors.customBlue1Color,
                     fontSize: 13,
                     fontFamily: MyConstants.mediumFontFamily,
                     fontWeight: FontWeight.w500),
               ),
               SizedBox(
                 height: 3.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userNameController,
                 label: "Name",
                 keyboardType: TextInputType.streetAddress,
               ),

               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userInitialController,
                 label: "Initials",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userLastPeriodController,
                 label: "Last period(First day), full date ",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userPreviousPregnanciesController,
                 label: "Previous pregnancies",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               Container(
                 height: 6.h,
                 width: MediaQuery
                     .of(context)
                     .size
                     .width,
                 padding: EdgeInsets.only(left: 2.h, right: 2.h),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                           color: CustomColors.customBlackColor
                               .withOpacity(0.15),
                           blurRadius: 4,
                           offset: const Offset(0, 1))
                     ],
                     color: Colors.white),
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton2<String>(
                     isExpanded: true,
                     hint: Text(
                       'Vaginal Delivery',
                       style: TextStyle(
                           fontSize: 10,
                           color: CustomColors.mainAppColor,
                           fontFamily: MyConstants.mediumFontFamily

                       ),
                       overflow: TextOverflow.ellipsis,
                     ),
                     items: models
                         .map((String item) =>
                         DropdownMenuItem<String>(
                           value: item,
                           child: Text(
                             item,
                             style: const TextStyle(
                                 fontSize: 10,
                                 color: CustomColors.mainAppColor,
                                 fontFamily: MyConstants.mediumFontFamily
                             ),
                             overflow: TextOverflow.ellipsis,
                           ),
                         ))
                         .toList(),
                     value: userVaginalDelivery,
                     onChanged: (String? value) {
                       setState(() {
                         userVaginalDelivery = value!;
                       });
                     },
                     iconStyleData: const IconStyleData(
                       icon: Icon(Icons.arrow_drop_down_outlined),
                       iconSize: 14,
                     ),
                     dropdownStyleData: DropdownStyleData(
                       maxHeight: 200,
                       width: MediaQuery
                           .of(context)
                           .size
                           .width / 1.3,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                               bottomRight: Radius.circular(10),
                               bottomLeft: Radius.circular(10)),
                           boxShadow: [
                             BoxShadow(
                                 color: CustomColors.customBlackColor
                                     .withOpacity(0.15),
                                 blurRadius: 4,
                                 offset: const Offset(0, 1))
                           ],
                           color: Colors.white),
                       offset: const Offset(-15, 0),
                       scrollbarTheme: ScrollbarThemeData(
                         radius: const Radius.circular(40),
                         thickness: MaterialStateProperty.all<double>(6),
                         thumbVisibility:
                         MaterialStateProperty.all<bool>(true),
                       ),
                     ),
                     menuItemStyleData: const MenuItemStyleData(
                       height: 40,
                       padding: EdgeInsets.only(left: 14, right: 14),
                     ),
                   ),
                 ),
               ),


               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userMaritalStatusController,
                 label: "Marital status",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userLevelOfEducationController,
                 label: "Level of education",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userReligionController,
                 label: "Religion",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userSourceOfIncomeController,
                 label: "Source of income",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userAgeController,
                 label: "Age",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userEthnicityController,
                 label: "Ethnicity",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userMedicalConditionController,
                 label: "Any known medical condition",
                 keyboardType: TextInputType.streetAddress,
               ),
               SizedBox(
                 height: 2.h,
               ),
               CustomTextField(controller: patientPersonalDetailsController
                   .userNoOfChildrenAndYearOfDeliveryController,
                 label: "No of children and year of delivery",
                 keyboardType: TextInputType.streetAddress,
               ),

               SizedBox(
                 height: 4.h,
               ),
               patientPersonalDetailsController.isLoading.value
                   ? Center(
                 child: CircularProgressIndicator(
                   backgroundColor: CustomColors.mainAppColor,
                   color: Colors.white,),
               ):
               Center(
                 child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         fixedSize: Size(14.h, 4.h),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                         backgroundColor: CustomColors.mainAppColor),
                     onPressed: () {

                       Navigator.push(context, MaterialPageRoute(builder: (_)=>
                           CaretakerAddNewPatientMedicalDetails(
                             centerName: signUPCaretakerController.careTakerCenterName,
                              veginalDelivery: userVaginalDelivery.toString(), )));
                     },
                     child: Text(
                       "Next",
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontFamily: MyConstants.mediumFontFamily,
                           fontSize: 13,
                           color: Colors.white),
                     )),
               ),
               SizedBox(height: 1.h, width: 1.h,)
             ]),)
        ),
      ),
    );
  }
}
