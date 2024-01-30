import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/View/OnBoardScreens/on_board_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration( seconds: 3),
        ()=> Get.offAll(()=>OnBoardScreen())
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/png/backgroundsplash.png"))),
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SvgPicture.asset("${MyConstants.svgImagePath}splash.svg"),
              SizedBox(height: 2.h,),
              RichText(
                text: TextSpan(
                  text: 'KAMA ',
                  style: TextStyle(
                      fontSize: 31,
                      color: CustomColors.mainAppColor,
                      fontFamily: MyConstants.boldFontFamily),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'CARE',
                        style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPinkColor,
                            fontFamily: MyConstants.boldFontFamily)),
                  ],
                ),
              ),
              SizedBox(height: 0.5.h,),
              Text(
                "Keep All Mothers Alive",
                style: TextStyle(
                    fontFamily: MyConstants.regularFontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.customBlackColor),
              )
            ],
          )),
    );
  }
}
