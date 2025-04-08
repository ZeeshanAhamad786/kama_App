
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';

import 'package:kama_app/View/Supervisor/supervisor_login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../ViewModel/AdminController/new_center_add_controller.dart';
import '../../ViewModel/Care_taker/sign_up_caretaker_controller.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import 'otp_screen_supervisor.dart';

class SupervisorSignUpScreen extends StatefulWidget {
  const SupervisorSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SupervisorSignUpScreen> createState() => _SupervisorSignUpScreenState();
}

class _SupervisorSignUpScreenState extends State<SupervisorSignUpScreen> {
  final _auth = FirebaseAuth.instance;
  var userphoneNumber = "";
  var _vId = "";
  final SignUpController signUpController = Get.find(tag: "signUpController");
  final SignUPCaretakerController signUPCaretakerController =
      Get.find(tag: "signUPCaretakerController");
  AddNewCenterController addNewCenterController =
      Get.find(tag: "addNewCenterController");
  var loading = false.obs;
  final RxBool isLoading = false.obs;
  String? selectedState;
  List<String> state = ["Lahore", "karachi", "faisalabad", "islamabad"];
  String? selectedModel;
  List<String> models = ['1', '2', '3', '4'];
  String? chooseCommunity;
  List<String> community = ["A", "B", "C", "D"];
  RxBool firstButton = true.obs;
  RxBool secondButton = false.obs;
  int selectedContainer = 0;
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Obx(() => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
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
                                backgroundColor: firstButton.value == true
                                    ? CustomColors.customFilterBlueColor
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)))),
                            onPressed: () {
                              firstButton.value = true;
                              secondButton.value = false;
                            },
                            child: Text(
                              "Supervisor",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: MyConstants.mediumFontFamily,
                                  color: firstButton.value == true
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
                                  backgroundColor: secondButton.value == true
                                      ? CustomColors.customFilterBlueColor
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)))),
                              onPressed: () {
                                secondButton.value = true;
                                firstButton.value = false;
                              },
                              child: Text(
                                "Care-taker",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    color: secondButton.value == true
                                        ? Colors.white
                                        : CustomColors.customLightGreyColor,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ],
                    ),
                    firstButton.value
                        ? Column(
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
                                    fontFamily:
                                    MyConstants.mediumFontFamily),
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
                                          color:
                                          CustomColors.mainAppColor,
                                          fontFamily: MyConstants
                                              .mediumFontFamily),
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
                                width:
                                MediaQuery.of(context).size.width / 1.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: CustomColors
                                              .customBlackColor
                                              .withOpacity(0.15),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1))
                                    ],
                                    color: Colors.white),
                                offset: const Offset(-15, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                  MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding:
                                EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userNameOfStaffController,
                          label: 'Name of staff',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller: signUpController
                              .userFacilityPracticeController,
                          label: 'Facility of practice',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller: signUpController
                              .userCadreOfSupervisorController,
                          label: 'Cadre of Supervisor',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userAddressController,
                          label: 'Address',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userLocalGovtController,
                          label: 'Local Government Area',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "State",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyConstants.mediumFontFamily,
                              color: CustomColors.customBlackColor,
                            ),
                          ),
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
                                    fontFamily:
                                    MyConstants.mediumFontFamily),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: state
                                  .map((String item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color:
                                          CustomColors.mainAppColor,
                                          fontFamily: MyConstants
                                              .mediumFontFamily),
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
                                width:
                                MediaQuery.of(context).size.width / 1.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: CustomColors
                                              .customBlackColor
                                              .withOpacity(0.15),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1))
                                    ],
                                    color: Colors.white),
                                offset: const Offset(-15, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                  MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding:
                                EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userChoChargeController,
                          label: 'CHO in charge',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userApexOicController,
                          label: 'Apex or OIC',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userHeadOfUnitController,
                          label: 'Head of Unit',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: Offset(0, 1))
                          ]),
                          child: IntlPhoneField(
                            onChanged: (value) {
                              setState(() {
                                userphoneNumber=value.completeNumber;
                                print("on Change value : ${value.completeNumber}");
                              });
                            },
                            controller: numberController,
                            cursorColor: CustomColors.mainAppColor,
                            keyboardType: TextInputType.phone,
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
                        // CustomTextField(
                        //   controller:
                        //       signUpController.userPhoneNumberController,
                        //   label: 'Phone number',
                        //   keyboardType: TextInputType.number,
                        // ),
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
                          controller:
                          signUpController.userAlternateController,
                          label: 'Alternate contact',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller:
                          signUpController.userPasswordController,
                          label: 'Password',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller: signUpController
                              .userConfirmPasswordController,
                          label: 'Confirm Password',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        loading.value
                            ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        )
                            : CustomElevatedButton(
                            buttonText: ("Sign up"),
                            buttonColor: CustomColors.mainAppColor,
                            onPressed: ()
                            async {
                              if (
                              userphoneNumber.isNotEmpty&&
                                  signUpController.userNameOfStaffController.text.isNotEmpty &&
                                  signUpController.  userFacilityPracticeController.text.isNotEmpty &&
                                  signUpController.  userCadreOfSupervisorController.text.isNotEmpty &&
                                  signUpController.  userAddressController.text.isNotEmpty &&
                                  signUpController.  userLocalGovtController.text.isNotEmpty &&
                                  signUpController.  userChoChargeController.text.isNotEmpty &&
                                  signUpController.  userApexOicController.text.isNotEmpty &&
                                  signUpController.  userHeadOfUnitController.text.isNotEmpty &&
                                  signUpController. userEmailController.text.isNotEmpty &&
                                  signUpController.  userAlternateController.text.isNotEmpty &&
                                  signUpController.  userPasswordController.text.isNotEmpty &&
                                  signUpController.  userConfirmPasswordController.text.isNotEmpty) {
                                if ( signUpController.userPasswordController.text.length >= 8) {
                                  if ( signUpController.userPasswordController.text ==  signUpController.userConfirmPasswordController.text) {

                                        RegExp emailRegex =
                                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                        if (emailRegex.hasMatch( signUpController.userEmailController.text)) {
                                          try {
                                            loading.value = true;
                                            await _auth.verifyPhoneNumber(
                                              phoneNumber: userphoneNumber,
                                              verificationCompleted: (PhoneAuthCredential credential) {
                                                // Handle auto-verification if needed
                                              },
                                              verificationFailed: (FirebaseAuthException e) {
                                                loading.value = false;
                                                print("Verification failed: ${e.message}");
                                              },
                                              codeSent: (String verificationId, int? resendToken) {
                                                setState(() {
                                                  print("Verification code sent successfully");
                                                  _vId = verificationId;
                                                });

                                                Get.to(() => OtpScreenSupervisor( VerificationId: verificationId,));
                                              },
                                              codeAutoRetrievalTimeout: (String verificationId) {
                                                loading.value = false;
                                                // Auto-retrieval timeout, if needed
                                              },
                                            );

                                          } catch (e) {
                                            loading.value = false;
                                            print("Error: $e");
                                            // Handle error
                                          }
                                        } else {
                                          loading.value = false;
                                          Get.snackbar(
                                            backgroundColor: CustomColors.mainAppColor,
                                            "Invalid",
                                            "Invalid Email Address",
                                            colorText: Colors.white,
                                          );
                                        }
                                    //   } else {
                                    //     loading.value = false;
                                    //     Get.snackbar(
                                    //       backgroundColor: CustomColors.mainAppColor,
                                    //       "Invalid",
                                    //       "Invalid Phone Number",
                                    //       colorText: Colors.white,
                                    //     );
                                    //   }
                                    // } else {
                                    //   loading.value = false;
                                    //   Get.snackbar(
                                    //     backgroundColor: CustomColors.mainAppColor,
                                    //     "Invalid",
                                    //     "Invalid Alternate Number at least 11 digits",
                                    //     colorText: Colors.white,
                                    //   );
                                    // }
                                  } else {
                                    loading.value = false;
                                    Get.snackbar(
                                      backgroundColor: CustomColors.mainAppColor,
                                      "Sorry",
                                      "Password does not match",
                                      colorText: Colors.white,
                                    );
                                  }
                                } else {
                                  loading.value = false;
                                  Get.snackbar(
                                    backgroundColor: CustomColors.mainAppColor,
                                    "Sorry",
                                    "Weak Password! Please try again",
                                    colorText: Colors.white,
                                  );
                                }
                              } else {
                                loading.value = false;
                                Get.snackbar(
                                    backgroundColor: CustomColors.mainAppColor,
                                    colorText: Colors.white,
                                    "Error",
                                    "All fields are required");
                              }
                            }
                        ),
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
                        SizedBox(
                          height: 20,
                          width: 20,
                        )
                      ],
                    )
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
                            controller: signUPCaretakerController
                                .userNameController,
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
                        StreamBuilder(
                          stream:
                          addNewCenterController.centerData.snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                  CustomColors.mainAppColor,
                                ),
                              );
                            } else if (!snapshot.hasData) {
                              return Text("No data found");
                            } else {
                              List<QueryDocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              List<String> centerNames = [];
                              documents.forEach((doc) {
                                String? centerName = doc['centerName'];

                                if (centerName != null) {
                                  centerNames.add(centerName);
                                }
                              });

                              return Container(
                                height: 6.h,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                EdgeInsets.only(left: 2.h, right: 2.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.customBlackColor
                                          .withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text(
                                      chooseCommunity ?? 'Select Center',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: CustomColors
                                            .customLightBlackColor,
                                        fontFamily:
                                        MyConstants.mediumFontFamily,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: centerNames
                                        .map((String centerName) {
                                      return DropdownMenuItem<String>(
                                        value: centerName,
                                        child: Text(
                                          centerName,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: CustomColors
                                                .customLightBlackColor,
                                            fontFamily: MyConstants
                                                .mediumFontFamily,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        chooseCommunity = value!;
                                      });
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Community Maternal Care Provider",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyConstants.mediumFontFamily,
                              color: CustomColors.customBlackColor),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildRoleContainer(
                                0, "Traditional Birth Attendant"),
                            SizedBox(
                              width: 0.8.h,
                            ),
                            Expanded(
                                child: buildRoleContainer(
                                    1, "Faith Based Birth Attendant")),
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
                            controller: signUPCaretakerController
                                .userEmailController,
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
                            controller: signUPCaretakerController
                                .userPasswordController,
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
                            controller: signUPCaretakerController
                                .userConfirmPasswordController,
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
                        signUPCaretakerController.isLoading.value
                            ? Center(
                            child: CircularProgressIndicator(
                              color: CustomColors.mainAppColor,
                            ))
                            : Center(
                          child: CustomElevatedButton(
                              buttonText: ("Sign up"),
                              buttonColor: CustomColors.mainAppColor,
                              onPressed: () {
                                String userType = "caretaker";
                                signUPCaretakerController
                                    .signUpCaretakerHandler(
                                  userName: signUPCaretakerController
                                      .userNameController.text
                                      .trim(),
                                  userEmail: signUPCaretakerController
                                      .userEmailController.text
                                      .trim(),
                                  userPassword:
                                  signUPCaretakerController
                                      .userPasswordController.text
                                      .trim(),
                                  userConfirmPassword:
                                  signUPCaretakerController
                                      .userConfirmPasswordController
                                      .text
                                      .trim(),
                                  userId: FirebaseAuth
                                      .instance.currentUser,
                                  chooseCommunity: chooseCommunity,
                                  userType: userType,
                                );
                                // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                //     CaretakerBottomNavigationScreen()));
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
                        SizedBox(
                          height: 5,
                          width: 5,
                        )
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
          ]),

        ),
      ));
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
                color: isSelected
                    ? CustomColors.mainAppColor
                    : CustomColors.customGreyColor,
              ),
            ),
            child: Center(
              child: Container(
                height: 1.2.h,
                width: 1.2.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected
                      ? CustomColors.mainAppColor
                      : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 0.2.h),
        Text(
          role,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: MyConstants.mediumFontFamily,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? CustomColors.mainAppColor
                : CustomColors.customGreyColor,
          ),
        ),
      ],
    );
  }
}
