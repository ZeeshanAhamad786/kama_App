import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/AdminController/new_center_add_controller.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../Admin/HomePage/center_patient_name.dart';
class CaretakerCenterPatientName extends StatefulWidget {
  const CaretakerCenterPatientName({Key? key}) : super(key: key);

  @override
  State<CaretakerCenterPatientName> createState() => _CaretakerCenterPatientNameState();
}

class _CaretakerCenterPatientNameState extends State<CaretakerCenterPatientName> {
  PatientPersonalDetailsController patientPersonalDetailsController =Get.
  find(tag: "patientPersonalDetailsController");
 final AddNewCenterController addNewCenterController=Get.find(tag: 'addNewCenterController');
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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: StreamBuilder(
              stream:addNewCenterController.centerData.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasError){
                  return Text("Something went wrong");
                }else if(snapshot.connectionState ==ConnectionState.waiting){
                  return Text("No data found");
                }else if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else if(snapshot.hasData){
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context,index){

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
                      });
                }
                return Container();
              },

            ),
          ),
        ]),
      ),
    );
  }
}