import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_personal_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
class CaretakerCenterPatientName extends StatefulWidget {
  const CaretakerCenterPatientName({Key? key}) : super(key: key);

  @override
  State<CaretakerCenterPatientName> createState() => _CaretakerCenterPatientNameState();
}

class _CaretakerCenterPatientNameState extends State<CaretakerCenterPatientName> {
  List<String> centerName = [
    "Patient Name",
    "Patient Name",
    "Patient Name",
    "Patient Name",
    "Patient Name",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.mainAppColor,
        centerTitle: true,
        title:  Text(
          "Center Name",
          style: TextStyle(
              fontFamily: MyConstants.boldFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white),
        )),
      body: Column(children: [
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>CaretakerPersonalDetails()));
          },
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 1.h),
                shrinkWrap: true,
                itemCount: centerName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
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

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
