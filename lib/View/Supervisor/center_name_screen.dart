import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/Admin/HomePage/apply_filter_center.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../ViewModel/AdminController/new_center_add_controller.dart';
import '../Admin/HomePage/center_patient_name.dart';

class CenterNameScreen extends StatefulWidget {
   CenterNameScreen({Key? key,this.title}) : super(key: key);
String? title;
  @override
  State<CenterNameScreen> createState() => _CenterNameScreenState();
}

class _CenterNameScreenState extends State<CenterNameScreen> {
final AddNewCenterController addNewCenterController=Get.find(tag: 'addNewCenterController');

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
          centerTitle: true,leading: widget.title=='viewAll'?
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24,
          ),
        ):SizedBox.shrink(),
      ),
      body: Column(children: [
        Container(
          height: 8.h,
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
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 5.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: CustomColors.customFilterBlueColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 3.h,
                                top: 1.5.h,
                                bottom: 1.5.h,
                              ),
                              child: Text(
                                "Filter",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: MyConstants.boldFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h),
                              child: TextFormField(
                                cursorColor: CustomColors.mainAppColor,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                    hintText: "Find the Area",
                                    hintStyle: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: MyConstants.regularFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.customLightGreyColor,
                                    ),
                                    contentPadding: const EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.08),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.08),
                                      ),
                                    ),
                                    suffixIcon: SvgPicture.asset(
                                      "assets/svg/search.svg",
                                    ),
                                    suffixIconConstraints:
                                    BoxConstraints.tightForFinite(
                                        height: 3.h, width: 5.h)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                            side: BorderSide(color: CustomColors.mainAppColor)

                                        )),
                                    onPressed: () {
                                      Get.back();

                                    },
                                    child: Text(
                                      "Cancel",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: CustomColors.mainAppColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                        MyConstants.mediumFontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.h),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      CustomColors.mainAppColor,
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplyFilterCenterScreen()));
                                    },
                                    child: Text(
                                      "Apply",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                        MyConstants.mediumFontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [

                SvgPicture.asset("assets/svg/filter.svg"),
                SizedBox(
                  width: 1.h,
                ),
                Text("Filter",
                    style: TextStyle(
                      color: CustomColors.customBlackColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      fontSize: 13,
                    )),
              ],
            ),
          ),
        ),
        Expanded(child: StreamBuilder(
          stream: addNewCenterController.centerData.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasError){
              return Text("Something went wrong");
            }else if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(backgroundColor: CustomColors.mainAppColor,));
            }else if(!snapshot.hasData){
              return  Text("No data found");
            }else if(snapshot.hasData){
              return  ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 3.h),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(onTap: () {
                      Get.to(CenterPatientNameAdmin(centerName1: snapshot.data.docs[index]["centerName"],));
                    },
                      child: Padding(
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
                                Text(snapshot.data.docs[index]["centerName"],
                                    style: const TextStyle(
                                        fontFamily: MyConstants.mediumFontFamily,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.customBlackColor)),
                                Text("",
                                    style: const TextStyle(
                                        fontFamily: MyConstants.boldFontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: CustomColors.customBlackColor)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            }return Container();
          },)),
      ]),
    );
  }
}
