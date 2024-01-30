import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/View/Admin/admin.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Utils/Constant/Constant.dart';
import '../Widgets/custom_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/png/onboardbackground.png",
                ),
                fit: BoxFit.fitWidth)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: _controller,
                      onPageChanged: (int page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 12.h,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/onboard1.svg',
                                  width: 35.h,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Choose Your ',
                                        style: TextStyle(
                                          fontSize: 18.px,
                                          color: CustomColors.mainAppColor,
                                          fontFamily:
                                              MyConstants.boldFontFamily,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Role',
                                            style: TextStyle(
                                              fontSize: 18.px,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  CustomColors.customPinkColor,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.5.h),
                                      child: Text(
                                        'You play a crucial role in connecting community maternal care providers with health institutions and skilled health workers.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: CustomColors.customBlackColor,
                                          fontSize: 12.px,
                                          fontFamily:
                                              MyConstants.regularFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                  ],
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/svg/bottom.svg',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SvgPicture.asset(
                                'assets/svg/TOP.svg',
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                width: 15.h,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 12.h,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/onboard-two.svg',
                                  width: 35.h,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Community ',
                                        style: TextStyle(
                                          fontSize: 18.px,
                                          color: CustomColors.mainAppColor,
                                          fontFamily:
                                              MyConstants.boldFontFamily,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Support',
                                            style: TextStyle(
                                              fontSize: 18.px,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  CustomColors.customPinkColor,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.5.h),
                                      child: Text(
                                        'You can easily add and manage your pregnant patients under your community center profile.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: CustomColors.customBlackColor,
                                          fontSize: 12.px,
                                          fontFamily:
                                              MyConstants.regularFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(
                                'assets/svg/oboard2.svg',
                                fit: BoxFit.cover,
                                width: 17.h,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              child: SvgPicture.asset(
                                'assets/svg/get_started_top.svg',
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                width: 15.h,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 12.h,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/onboardthree.svg',
                                  width: 35.h,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Last Mile ',
                                        style: TextStyle(
                                          fontSize: 18.px,
                                          color: CustomColors.mainAppColor,
                                          fontFamily:
                                              MyConstants.boldFontFamily,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Health Care',
                                            style: TextStyle(
                                              fontSize: 18.px,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  CustomColors.customPinkColor,
                                              fontFamily:
                                                  MyConstants.boldFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.5.h),
                                      child: Text(
                                        'We bring quality antenatal care closer to remote areas and hard to reach communities.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: CustomColors.customBlackColor,
                                          fontSize: 12.px,
                                          fontFamily:
                                              MyConstants.regularFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: -3.h,
                              right: 0,
                              child: SvgPicture.asset(
                                'assets/svg/onboard3.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height - 66.h,
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            height: 0.5.h,
                            width: 1.5.h,
                            color: CustomColors.mainAppColor,
                            borderRadius: BorderRadius.circular(32.px),
                          ),
                          dotDecoration: DotDecoration(
                              height: 0.5.h,
                              width: 1.5.h,
                              color: CustomColors.customGreyColor,
                              borderRadius: BorderRadius.circular(32.px)),
                          // activeDotColor: CustomColors.mainAppColor,
                          // dotColor: CustomColors.customGreyColor,
                          // dotHeight: 0.6.h,
                          // dotWidth: 0.6.h,
                          spacing: 1.2.h,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height - 80.h,
                      child: CustomElevatedButton(
                        buttonText: currentPage == 2 ? 'Get Started' : 'Next',
                        buttonColor: CustomColors.mainAppColor,
                        onPressed: () {
                          currentPage == 2
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Admin()))
                              : _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                        },
                      ),
                    ),currentPage == 2
                        ? const SizedBox.shrink()
                        : Positioned(
                      top: 1.h,
                      right: 0.h,
                      child: TextButton(onPressed:() {
                        log("message");
                       Get.offAll( const Admin());
                      },
                        child: Text('Skip',
                            style: TextStyle(
                                color: CustomColors.mainAppColor,
                                fontSize: 14.px,
                                fontFamily:
                                MyConstants.regularFontFamily)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
