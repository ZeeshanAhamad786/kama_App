import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/Supervisor/personal_details_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import 'medical_details_tab.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.mainAppColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 3.h),
              ),
              Text(
                "Ali",
                style: TextStyle(
                    fontFamily: MyConstants.boldFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
                width: 30,
              )
            ],
          )),
      body: Column(children: [
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 5.h,
          margin: EdgeInsets.symmetric(horizontal: 5.h),
          decoration: BoxDecoration(
              color: CustomColors.customTabBackgroundColor,
              borderRadius: BorderRadius.circular(32)),
          child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  color: CustomColors.mainAppColor,
                  borderRadius: BorderRadius.circular(32)),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: CustomColors.customTabGreyColor ,
              labelStyle:TextStyle(
              color: Colors.white,
              fontSize: 13.px,
              fontWeight: FontWeight.w500,
              fontFamily: MyConstants.mediumFontFamily),
           dividerColor: Colors.transparent,



            tabs: [
                Text("Personal Details",),
                Text("Medical Details",
                ),
              ]),
        ),
      Expanded(
        child:  TabBarView(controller: _tabController,
                children: [
              PersonalDetailsTab(),

              MedicalDetailsTab(),
        ]),
      )
      ]),
    );
  }
}
