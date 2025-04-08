import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/Colors/Colors.dart';

class ApplyFilterCenterScreen extends StatefulWidget {
  const ApplyFilterCenterScreen({Key? key}) : super(key: key);

  @override
  State<ApplyFilterCenterScreen> createState() => _ApplyFilterCenterScreenState();
}

class _ApplyFilterCenterScreenState extends State<ApplyFilterCenterScreen> {
  List<String> centerName = [
    "Center Name",
    "Center Name",
    "Center Name",
    "Center Name",
    "Center Name",
  ];
  List<String> centerNumber = [
    "175",
    "200",
    "500",
    "600",
    "120",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          title: const Text("Center",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: MyConstants.boldFontFamily,
                  fontSize: 16,
                  color: Colors.white)),
          centerTitle: true),
      body: Column(children: [
        Container(
          height: 10.h,
          width: MediaQuery.of(context).size.width,
          decoration:
          const BoxDecoration(color: CustomColors.customLightBlueColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Center(
              child: TextFormField(
                cursorColor: CustomColors.mainAppColor,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/svg/search.svg",
                      ),
                    ),
                    prefixIconConstraints:
                    BoxConstraints.tightForFinite(height: 3.h, width: 5.h),
                    hintText: "Find the center",
                    hintStyle: const TextStyle(
                        fontSize: 13,
                        fontFamily: MyConstants.regularFontFamily,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.customLightGreyColor),
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.08),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.08)))),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.h,vertical: 1.h),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
       child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 1.8.h),
         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("Area Name",
                 style: TextStyle(
                   color: CustomColors.customBlackColor,
                   fontWeight: FontWeight.w500,
                   fontFamily: MyConstants.mediumFontFamily,
                   fontSize: 13,
                 )),

             SizedBox(
               width: 1.h,
             ),
             InkWell(onTap: () {
               Get.back();
             },
               child:  Text("Clear",
                   style: TextStyle(
                     color: CustomColors.customRedColor,
                     fontWeight: FontWeight.w500,
                     fontFamily: MyConstants.mediumFontFamily,
                     fontSize: 13,
                   )),
             ),
           ],
         ),
       ),
        ),

        Expanded(
          child: ListView.builder(                 padding: EdgeInsets.only(left: 3.h,right: 3.h,top: 1.h),


              shrinkWrap: true,
              itemCount: centerName.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    height: 6.5.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: CustomColors.customBlackColor
                                  .withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 1))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(centerName[index],
                              style: const TextStyle(
                                  fontFamily: MyConstants.mediumFontFamily,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.customBlackColor)),
                          Text(centerNumber[index],
                              style: const TextStyle(
                                  fontFamily: MyConstants.boldFontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.customBlackColor)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
