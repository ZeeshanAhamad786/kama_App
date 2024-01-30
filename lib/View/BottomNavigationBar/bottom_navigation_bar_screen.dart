import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/HomePage/center_screen.dart';
import 'package:kama_app/View/HomePage/setting_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../HomePage/home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  int? currentIndex;

  BottomNavigationBarScreen({Key? key, this.currentIndex,}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  setState(() {
    currentIndex=widget.currentIndex ?? 0;
  });
  }

  static List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const CenterScreen(),
    const SettingScreen(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          widgetOptions.elementAt(currentIndex),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CurvedNavigationBar(height: 9.h,
                color: CustomColors.mainAppColor,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: CustomColors.mainAppColor,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: currentIndex,
                items: [
                  SvgPicture.asset("assets/svg/splashnew.svg",color: currentIndex ==0? Colors.white: CustomColors.customGreyBoldColor,
                      height: 3.h, width: 3.h),
                  SvgPicture.asset("assets/svg/hospital.svg",color: currentIndex == 1? Colors.white:CustomColors.customGreyBoldColor,
                      height: 3.h, width: 3.h),
                  SvgPicture.asset("assets/svg/setting.svg",color: currentIndex ==2?Colors.white:CustomColors.customGreyBoldColor,
                      height: 3.h, width: 3.h),
                ],
                onTap: (index) => onTap(index),
              ),
              Positioned(
                bottom: 0.6.h,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Home",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex==0?Colors.white:CustomColors.customGreyBoldColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily)),
                    Text("  Center",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex ==1? Colors.white:CustomColors.customGreyBoldColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily)),
                    Text("Setting",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex ==2 ?Colors.white:CustomColors.customGreyBoldColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: MyConstants.mediumFontFamily)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
