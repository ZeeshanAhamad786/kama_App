import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/HomePage/center_screen.dart';
import 'package:kama_app/View/HomePage/setting_screen.dart';
import 'package:kama_app/View/Supervisor/alert_screen.dart';
import 'package:kama_app/View/Supervisor/center_name_screen.dart';
import 'package:kama_app/View/Supervisor/refer_other_screen.dart';
import 'package:kama_app/View/Supervisor/refer_screen.dart';
import 'package:kama_app/View/Supervisor/setting_supervisor_screen.dart';
import 'package:kama_app/View/Supervisor/supervisor_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupervisorBottomNavigationScreen extends StatefulWidget {
  int? currentIndex;

  SupervisorBottomNavigationScreen({
    Key? key,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<SupervisorBottomNavigationScreen> createState() =>
      _SupervisorBottomNavigationScreenState();
}

class _SupervisorBottomNavigationScreenState
    extends State<SupervisorBottomNavigationScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentIndex = widget.currentIndex ?? 0;
    });
  }

  static List<Widget> widgetOptions = <Widget>[
    const SupervisorHomeScreen(),
    const AlertScreen(),
    const ReferScreen(),
    const CenterNameScreen(),
    const SettingSupervisorScreen(),
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
              CurvedNavigationBar(
                height: 9.h,
                color: CustomColors.mainAppColor,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: CustomColors.mainAppColor,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: currentIndex,
                items: [
                  SvgPicture.asset("assets/svg/splashnew.svg",
                      color: currentIndex == 0 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/alert.svg",
                      color: currentIndex == 1 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/refer.svg",
                      color: currentIndex == 2 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/hospital.svg",
                      color: currentIndex == 3 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
                  SvgPicture.asset("assets/svg/setting.svg",
                      color: currentIndex == 4 ? Colors.white : Colors.white70,
                      height: 3.h,
                      width: 3.h),
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
                            color: currentIndex == 0
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("     Alert",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 1
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("    Refer",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 2
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("  Center",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 3
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
                    Text("Setting",
                        style: TextStyle(
                            fontSize: 10.px,
                            color: currentIndex == 4
                                ? Colors.white
                                : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontFamily: MyConstants.boldFontFamily)),
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
