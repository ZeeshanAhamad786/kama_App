import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/Utils/Data/toast_message.dart';
import 'package:kama_app/View/Supervisor/supervisor_login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
class SupervisorSignUpScreen extends StatefulWidget {

  const SupervisorSignUpScreen({Key? key,}) : super(key: key);

  @override
  State<SupervisorSignUpScreen> createState() => _SupervisorSignUpScreenState();
}

class _SupervisorSignUpScreenState extends State<SupervisorSignUpScreen> {
  final SignUpController signUpController =Get.find(tag: "signUpController") ;
  final RxBool loading =false.obs;
String? selectedState;
List<String> state=["Lahore","karachi","faisalabad","islamabad"];
  String? selectedModel;
  List<String> models = ['1', '2', '3', '4'];
  RxBool firstButton = true.obs;
  RxBool secondButton = false.obs;
  int selectedContainer = 0;



  @override
  Widget build(BuildContext context) {
    print("hello world");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Obx(()=> Column(children: [
          SizedBox(
            height: 8.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_new, size: 24)),
                Text("Sign -up",
                    style: TextStyle(
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.mainAppColor)),
                SizedBox(
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.h),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: CustomColors.customBlackColor.withOpacity(0.15),
                  offset: Offset(0, 1),
                  blurRadius: 8)
            ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: firstButton.value==true
                                  ? CustomColors.customFilterBlueColor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8)))),
                          onPressed: (){
                            firstButton.value=true;
                            secondButton.value=false;
                          },
                          child: Text(
                            "Supervisor",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: MyConstants.mediumFontFamily,
                                color: firstButton.value==true
                                    ? Colors.white
                                    : CustomColors.customLightGreyColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.5.h,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: secondButton.value==true
                                    ?CustomColors.customFilterBlueColor: Colors.white
                                ,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)))),
                            onPressed: (){
                              secondButton.value=true;
                              firstButton.value=false;
                            },

                            child: Text(
                              "Care-taker",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: MyConstants.mediumFontFamily,
                                  color: secondButton.value==true
                                      ?
                                  Colors.white:CustomColors.customLightGreyColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),

                  firstButton.value ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      height: 6.h,
                      width: MediaQuery.of(context).size.width,
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
                            'CHEW (Community Health Extension Worker)',
                            style: TextStyle(
                                fontSize: 10,
                                color: CustomColors.mainAppColor,
                                fontFamily: MyConstants.mediumFontFamily

                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          items: models
                              .map((String item) => DropdownMenuItem<String>(
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
                          value: selectedModel,
                          onChanged: (String? value) {
                            setState(() {
                              selectedModel = value!;
                            });
                          },
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            iconSize: 14,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width / 1.3,
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
                    CustomTextField(
                      controller: signUpController.userNameOfStaffController,

                      label: 'Name of staff',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(controller: signUpController.userFacilityPracticeController,

                      label: 'Facility of practice',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userCadreOfSupervisorController,

                      label: 'Cadre of Supervisor',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userAddressController,

                      label: 'Address',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userLocalGovtController,

                      label: 'Local Government Area',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(alignment: Alignment.centerLeft,
                      child: Text("State",  style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: MyConstants.mediumFontFamily,
                        color: CustomColors.customBlackColor,
                      ),),
                    ),
                      SizedBox(
                        height: 0.6.h,
                      ),
                    Container(
                      height: 6.h,
                      width: MediaQuery.of(context).size.width,
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
                            'state',
                            style: TextStyle(
                                fontSize: 10,
                                color: CustomColors.mainAppColor,
                                fontFamily: MyConstants.mediumFontFamily

                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          items: state
                              .map((String item) => DropdownMenuItem<String>(
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
                          value: selectedState,
                          onChanged: (String? value) {
                            setState(() {
                              selectedState = value!;
                            });
                          },
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            iconSize: 14,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width / 1.3,
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
                    CustomTextField(controller: signUpController.userChoChargeController,

                      label: 'CHO in charge',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userApexOicController,

                      label: 'Apex or OIC',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userHeadOfUnitController,

                      label: 'Head of Unit',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userPhoneNumberController,

                      label: 'Phone number',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userEmailController,

                      label: 'Email',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: signUpController.userAlternateController,

                      label: 'Alternate contact',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(controller: signUpController.userPasswordController,

                      label: 'Password',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(controller: signUpController.userConfirmPasswordController,

                      label: 'Confirm Password',
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                 signUpController.loading.value?CircularProgressIndicator(
                   color: Colors.blue,
                 ) :  CustomElevatedButton(
                        buttonText: ("Sign up"),
                        buttonColor: CustomColors.mainAppColor,
                        onPressed: () {
                          signUpController.signUpHandler(
                              userNameOfStaff: signUpController.userNameOfStaffController.text.trim(),
                              userFacilityOfPractice: signUpController.userFacilityPracticeController.text.trim(),
                              userCadreOfSupervisor: signUpController.userCadreOfSupervisorController.text.trim(),
                              userAddress: signUpController.userAddressController.text.trim(),
                              userLocalGovtArea: signUpController.userLocalGovtController.text.trim(),
                              selectedState: selectedState,
                              userChoInCharge: signUpController.userChoChargeController.text.trim(),
                              userApexOic: signUpController.userApexOicController.text.trim(),
                              userHeadOfUnit: signUpController.userHeadOfUnitController.text.trim(),
                              userPhoneNumber: signUpController.userPhoneNumberController.text.trim(),
                              userEmailName: signUpController.userEmailController.text.trim(),
                              userAlternatePassword: signUpController.userAlternateController.text.trim(),
                              userPassword: signUpController.userPasswordController.text.trim(),
                              userConfirmPassword: signUpController.userConfirmPasswordController.text.trim(),
                              userId:FirebaseAuth.instance.currentUser!.uid,
                              selectedModel:selectedModel


                          );

                          // supervisorsignup();
                          // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          //     SupervisorBottomNavigationScreen(currentIndex: 0,)));
                        }),

                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I don't have any account ?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: CustomColors.customBlackColor,
                                fontSize: 13,
                                fontFamily: MyConstants.regularFontFamily)),
                        SizedBox(
                          width: 0.5.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>SupervisorLoginScreen()));
                          },
                          child: Text("Sign-in ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.customBlueColor,
                                  fontSize: 13,
                                  fontFamily: MyConstants.regularFontFamily)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    )],)
                  //otherwise
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Choose community center ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),

                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 6.h,
                        width: MediaQuery.of(context).size.width,
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
                              'None',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColors.customLightBlackColor,
                                  fontFamily: MyConstants.mediumFontFamily,
                                  fontWeight: FontWeight.w500

                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: models
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: CustomColors.customLightBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontWeight: FontWeight.w500
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedModel,
                            onChanged: (String? value) {
                              setState(() {
                                selectedModel = value!;
                              });
                            },
                            iconStyleData: const IconStyleData(
                              icon: Icon(Icons.arrow_drop_down_outlined),
                              iconSize: 14,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: MediaQuery.of(context).size.width / 1.3,
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
                      SizedBox(height: 2.h,),
                      Text(
                        "Community Maternal Care Provider",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(height: 1.5.h,),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildRoleContainer(0, "Traditional Birth Attendant"),
                          SizedBox(
                            width: 0.8.h,
                          ),
                          Expanded(child: buildRoleContainer(1, "Faith Based Birth Attendant")),

                        ],
                      ),



                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily,
                            color: CustomColors.customBlackColor),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ]),
                        child: TextFormField(
                          cursorColor: CustomColors.mainAppColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black
                                          .withOpacity(0.08)))),
                        ),
                      ),


                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                        child: CustomElevatedButton(
                            buttonText: ("Sign up"),
                            buttonColor: CustomColors.mainAppColor,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                  CaretakerBottomNavigationScreen()));
                            }),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I don't have any account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.customBlackColor,
                                  fontSize: 13,
                                  fontFamily:
                                  MyConstants.regularFontFamily)),
                          SizedBox(
                            width: 0.5.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          SupervisorLoginScreen()));
                            },
                            child: Text("Sign-in ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.customBlueColor,
                                    fontSize: 13,
                                    fontFamily:
                                    MyConstants.regularFontFamily)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5, width: 5,)
                    ],
                  )

                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
          )
        ]),)
      ),
    );
  }
  Widget buildRoleContainer(int index, String role) {
    bool isSelected = selectedContainer == index;

    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedContainer = index;
            });
          },
          child: Container(
            height: 2.h,
            width: 2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
              ),
            ),
            child: Center(
              child: Container(
                height: 1.2.h,
                width: 1.2.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? CustomColors.mainAppColor : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 0.8.h),
        Text(
          role,textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: MyConstants.mediumFontFamily,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: isSelected ? CustomColors.mainAppColor : CustomColors.customGreyColor,
          ),
        ),
      ],
    );
  }
}
