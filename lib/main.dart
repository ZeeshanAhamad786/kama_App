import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/Splash/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'ViewModel/Supervisor/sign_up_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext,orientation,ScreenType){
      Get.put(SignUpController(), tag: "signUpController");
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: SplashScreen(),

      );
    });
  }
}
