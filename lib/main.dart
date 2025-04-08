import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Splash/splash_screen.dart';
import 'package:kama_app/ViewModel/Supervisor/change_password_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'View/CaretakerScreens/caretaker_baby_details.dart';
import 'View/Supervisor/supervisor_signup_screen.dart';
import 'ViewModel/AdminController/admin_login_controller.dart';
import 'ViewModel/AdminController/new_center_add_controller.dart';
import 'ViewModel/Care_taker/baby_controller.dart';
import 'ViewModel/Care_taker/caretaker_addcomment_controller.dart';
import 'ViewModel/Care_taker/get_user_data_medical details.dart';
import 'ViewModel/Care_taker/get_user_data_personal_details.dart';
import 'ViewModel/Care_taker/patient_medical_details_controller.dart';
import 'ViewModel/Care_taker/patient_personal_details_controller.dart';
import 'ViewModel/Care_taker/sign_in_caretaker_controller.dart';
import 'ViewModel/Care_taker/sign_up_caretaker_controller.dart';
import 'ViewModel/Supervisor/forgot_controller.dart';
import 'ViewModel/Supervisor/sign_in_controller.dart';
import 'ViewModel/Supervisor/sign_up_controller.dart';
import 'ViewModel/Supervisor/supervisor_comment_controller.dart';
import 'firebase_options.dart';
import 'notification_services/notification_services.dart';
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(SignUpController(), tag: "signUpController");
  Get.put(SignInController(), tag: "signInController");
  Get.put(ForgotController(), tag: "forgotController");
  Get.put(ChangePasswordController(), tag: "changePasswordController");
  Get.put(SignUPCaretakerController(), tag: "signUPCaretakerController");
  Get.put(SignInCaretakerController(), tag: "signInCaretakerController");
  Get.put(PatientPersonalDetailsController(), tag: "patientPersonalDetailsController");
  Get.put(PatientMedicalDetailsController(), tag: "patientMedicalDetailsController");
  Get.put(AddNewCenterController(), tag: "addNewCenterController");
  Get.put(AdminLoginController(), tag: "adminLoginController");
  Get.put(GetUserDataMedicalDetails(), tag: "getUserDataMedicalDetails");
  Get.put(GetUserDataPersonalDetails(), tag: "getUserDataPersonalDetails");
  Get.put(AddCommentController(), tag: "addCommentController");
  Get.put(SupervisorAddCommentController(), tag: "supervisorAddCommentController");
  Get.put(BabyModelController(), tag: "babyModelController");
  Get.put(CaretakerBabyDetails(), tag: "caretakerBabyDetails");
  Get.put(SupervisorSignUpScreen(), tag: "supervisorSignUpScreen");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext,orientation,ScreenType){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: SplashScreen(),

      );
    });
  }
}




