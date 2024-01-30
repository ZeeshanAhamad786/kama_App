import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_medical_details_tab.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_personal_details_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import 'caretaker_baby_details.dart';


class CaretakerPersonalDetails extends StatefulWidget {
  const CaretakerPersonalDetails({Key? key}) : super(key: key);

  @override
  State<CaretakerPersonalDetails> createState() => _CaretakerPersonalDetailsState();
}

class _CaretakerPersonalDetailsState extends State<CaretakerPersonalDetails>
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
              InkWell(onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_)=>CaretakerBabyDetails()));
              },
                child: Text(
                  "+ Add baby",
                  style: TextStyle(
                      fontFamily: MyConstants.boldFontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.white),
                ),
              ),

            ],
          )),
      body: Column(children: [
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 5.h,
          margin: EdgeInsets.symmetric(horizontal: 4.h),
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
                CaretakerPersonalDetailsTab(),

                CaretakerMedicalDetailsTab(),
              ]),
        )
      ]),
    );
  }
}
