import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/Supervisor/supervisor_signup_screen.dart';
import 'package:kama_app/View/Widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';
import '../../../Utils/Constant/Constant.dart';
import '../../ViewModel/Supervisor/sign_up_controller.dart';
import '../../notification_services/notification_services.dart';
import '../BottomNavigationBar/supervisor_bottom_naviagtion_screen.dart';

class OtpScreenSupervisor extends StatefulWidget {
  final String VerificationId;
  // Map data={};
   OtpScreenSupervisor({Key? key, required this.VerificationId,}) : super(key: key);
  @override
  State<OtpScreenSupervisor> createState() => _OtpScreenSupervisorState();
}
class _OtpScreenSupervisorState extends State<OtpScreenSupervisor> {
  final SignUpController signUpController = Get.find(tag: "signUpController");
  final SupervisorSignUpScreen supervisorSignUpScreen = Get.find(tag: "supervisorSignUpScreen");

  final TextEditingController otpController =TextEditingController();
  String? selectedState;
  String? selectedModel;
  var isLoading=false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return
     Obx(() =>  Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Column(children: [
           Padding(
             padding: EdgeInsets.only(left: 2.h, top: 10.5.h),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 InkWell(
                   onTap: () {
                     Get.back();
                   },
                   child: const Icon(
                     Icons.arrow_back_ios_new,
                     color: CustomColors.customBlackColor,
                     size: 24,
                   ),
                 ),
                 SvgPicture.asset(
                   "assets/svg/splashnew.svg",
                 ),
                 const SizedBox(
                   height: 48,
                   width: 48,
                 )
               ],
             ),
           ),
           SizedBox(
             height: 1.h,
           ),
           RichText(
             text: const TextSpan(
               text: 'KAMA ',
               style: TextStyle(
                 fontSize: 24,
                 color: CustomColors.mainAppColor,
                 fontWeight: FontWeight.w600,
                 fontFamily: MyConstants.boldFontFamily,
               ),
               children: <TextSpan>[
                 TextSpan(
                   text: 'CARE',
                   style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w600,
                     color: CustomColors.customPinkColor,
                     fontFamily: MyConstants.boldFontFamily,
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(
             height: 0.4.h,
           ),
           const Text(
             "Keep All Mothers Alive",
             style: TextStyle(
               fontFamily: MyConstants.regularFontFamily,
               fontSize: 12,
               fontWeight: FontWeight.w400,
               color: CustomColors.customBlackColor,
             ),
           ),
           SizedBox(
             height: 5.h,
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 4.h),
             decoration: BoxDecoration(boxShadow: [
               BoxShadow(
                   color: Colors.black.withOpacity(0.15),
                   blurRadius: 8,
                   offset: const Offset(0, 1))
             ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
             child: Column(children: [
               SizedBox(
                 height: 2.h,
               ),
               SvgPicture.asset("assets/svg/otpImage.svg"),
               SizedBox(
                 height: 1.h,
               ),
               const Text("Enter Verification Code",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: CustomColors.mainAppColor,
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                       fontFamily: MyConstants.regularFontFamily)),
               SizedBox(
                 height: 3.h,
               ),
               const Text(
                 "We have sent OTP on your Email",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     color: CustomColors.mainAppColor,
                     fontFamily: MyConstants.regularFontFamily,
                     fontWeight: FontWeight.w300,
                     fontSize: 16),
               ),
               SizedBox(
                 height: 2.h,
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 2.h),
                 child: PinCodeTextField(
                   onCompleted: (v){
                     otpController.text=v;
                   },
                   length: 6,
                   keyboardType:
                   const TextInputType.numberWithOptions(decimal: true),
                   cursorColor: CustomColors.mainAppColor,
                   pinTheme: PinTheme(
                       shape: PinCodeFieldShape.box,
                       borderRadius: BorderRadius.circular(8),
                       fieldHeight: 45,
                       fieldWidth: 40,
                       selectedColor: CustomColors.customBlueColor,
                       activeFillColor: Colors.white,
                       inactiveColor:
                       CustomColors.customBlackColor.withOpacity(0.1),
                       activeColor: CustomColors.mainAppColor),
                   animationDuration: const Duration(milliseconds: 200),

                   onChanged: (value) {
                     log(value.toString());
                   },
                   beforeTextPaste: (text) {
                     log("Allowing to paste $text");
                     return true;
                   },
                   appContext: context, // Provide the context here
                 ),
               ),
               SizedBox(
                 height: 2.h,
               ),
               isLoading.value?Center(child: CircularProgressIndicator(
                 backgroundColor: CustomColors.mainAppColor,
               )):
               CustomElevatedButton(
                 buttonText: "Next",
                 buttonColor: CustomColors.mainAppColor,
                 onPressed: () async {
                   print(widget.VerificationId);
                   print("this is otp controller: ${otpController.text}");
                   try {
                     isLoading.value=true;
                     final credential =   PhoneAuthProvider.credential(
                       verificationId: widget.VerificationId, // Ensure correct verificationId
                       smsCode: otpController.text, // Ensure correct OTP entered by the user
                     );
                     isLoading.value=false;
                     await FirebaseAuth.instance.signInWithCredential(credential).then((value)  {
                       NotificationServices notificationServices = NotificationServices();
                       notificationServices.getDeviceToken().then((value) {
                         String userType = "supervisor";
                         signUpController.signUpHandler(
                           userNameOfStaff: signUpController
                               .userNameOfStaffController.text
                               .trim(),
                           userFacilityOfPractice: signUpController
                               .userFacilityPracticeController.text
                               .trim(),
                           userCadreOfSupervisor: signUpController
                               .userCadreOfSupervisorController
                               .text
                               .trim(),
                           userAddress: signUpController
                               .userAddressController.text
                               .trim(),
                           userLocalGovtArea: signUpController
                               .userLocalGovtController.text
                               .trim(),
                           selectedState: selectedState,
                           userChoInCharge: signUpController
                               .userChoChargeController.text
                               .trim(),
                           userApexOic: signUpController
                               .userApexOicController.text
                               .trim(),
                           userHeadOfUnit: signUpController
                               .userHeadOfUnitController.text
                               .trim(),
                           userEmailName: signUpController
                               .userEmailController.text
                               .trim(),
                           userAlternateContact: signUpController
                               .userAlternateController.text
                               .trim(),
                           userPassword: signUpController
                               .userPasswordController.text
                               .trim(),
                           userConfirmPassword: signUpController
                               .userConfirmPasswordController.text
                               .trim(),
                           userId: FirebaseAuth
                               .instance.currentUser?.uid,
                           selectedModel: selectedModel,
                           userType: userType,
                           deviceToken: value.toString(),


                         );

                       });
                     });

                     Get.offAll(SupervisorBottomNavigationScreen());
                    //  Navigator.push(context, MaterialPageRoute(builder: (_) => SupervisorBottomNavigationScreen()));
                       // NotificationServices notificationServices = NotificationServices();
                       // notificationServices.getDeviceToken().then((value) {
                       //   String userType = "supervisor";
                       //   signUpController.signUpHandler(
                       //     userNameOfStaff: signUpController
                       //         .userNameOfStaffController.text
                       //         .trim(),
                       //     userFacilityOfPractice: signUpController
                       //         .userFacilityPracticeController.text
                       //         .trim(),
                       //     userCadreOfSupervisor: signUpController
                       //         .userCadreOfSupervisorController
                       //         .text
                       //         .trim(),
                       //     userAddress: signUpController
                       //         .userAddressController.text
                       //         .trim(),
                       //     userLocalGovtArea: signUpController
                       //         .userLocalGovtController.text
                       //         .trim(),
                       //     selectedState: selectedState,
                       //     userChoInCharge: signUpController
                       //         .userChoChargeController.text
                       //         .trim(),
                       //     userApexOic: signUpController
                       //         .userApexOicController.text
                       //         .trim(),
                       //     userHeadOfUnit: signUpController
                       //         .userHeadOfUnitController.text
                       //         .trim(),
                       //     userPhoneNumber: signUpController
                       //         .userPhoneNumberController.text
                       //         .trim(),
                       //     userEmailName: signUpController
                       //         .userEmailController.text
                       //         .trim(),
                       //     userAlternatePassword: signUpController
                       //         .userAlternateController.text
                       //         .trim(),
                       //     userPassword: signUpController
                       //         .userPasswordController.text
                       //         .trim(),
                       //     userConfirmPassword: signUpController
                       //         .userConfirmPasswordController.text
                       //         .trim(),
                       //     userId: FirebaseAuth
                       //         .instance.currentUser?.uid,
                       //     selectedModel: selectedModel,
                       //     userType: userType,
                       //     deviceToken: value.toString(),
                       //   );
                       //
                       // });
                   } catch (e) {
                     isLoading.value=false;
                     Get.snackbar(
                       backgroundColor: CustomColors.mainAppColor,
                       "Error",
                       "Please enter correct otp",
                       colorText: Colors.white,
                     );
                     print("Error signing in: $e");
                   }
                 },
               ),

               SizedBox(
                 height: 2.h,width: 2.h,
               ),
             ]),
           ),
         ]),
       ),
     ));
  }
}
