import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/View/Supervisor/personal_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
class CenterPatientName extends StatefulWidget {
  const CenterPatientName({Key? key}) : super(key: key);

  @override
  State<CenterPatientName> createState() => _CenterPatientNameState();
}

class _CenterPatientNameState extends State<CenterPatientName> {
  final SupervisorAddCommentController superVisoraddCommentControllerTab1=Get.find(tag: 'supervisorAddCommentController');

  PatientPersonalDetailsController patientPersonalDetailsController=
  Get.find(tag: "patientPersonalDetailsController");
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(leading:  InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(Icons.arrow_back_ios_new,
          color: Colors.white, size: 3.h),
    ),
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.mainAppColor,
        centerTitle: true,
        title:  Text(
          "Patient Name",
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


          Expanded(child: StreamBuilder(
            stream: patientPersonalDetailsController.userPatientData.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasError){
                return Text("Something went wrong");
              }else if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(backgroundColor: CustomColors.mainAppColor,));
              }else if(!snapshot.hasData){
                return  Text("No data found");
              }else if(snapshot.hasData){
                return  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {

                      return GestureDetector(onTap: () {
                        superVisoraddCommentControllerTab1.getSenderData(
                            snapshot.data.docs[index]["userId"]
                        );

                        Get.to(PersonalDetails(
                          userName: snapshot.data.docs[index]["userName"],
                          Initial: snapshot.data.docs[index]["Initial"],
                          lastPeriod: snapshot.data.docs[index]["lastPeriod"],
                          previousPregnancies: snapshot.data.docs[index]["previousPregnancies"],
                          vaginalDelivery: snapshot.data.docs[index]["vaginalDelivery"],
                          maritalStatus: snapshot.data.docs[index]["maritalStatus"],
                          levelOfEducation: snapshot.data.docs[index]["levelOfEducation"],
                          religionAndSourceOfIncome: snapshot.data.docs[index]["religionSourceOfIncome"],
                          ethnicity: snapshot.data.docs[index]["userEthnicity"],
                          medicalCondition: snapshot.data.docs[index]["medicalCondition"],
                          noOfChildrenAndYearOfDelivery: snapshot.data.docs[index]["noOfChildrenAndYearOfDelivery"],
                          userId: snapshot.data.docs[index]["userId"],
                          userTimeStamp: snapshot.data.docs[index]["userTimeStamp"],
                          selectedDate: snapshot.data.docs[index]["selectedDate"]?.toDate() != null
                              ? DateFormat('dd/MM/yyyy').format(snapshot.data.docs[index]["selectedDate"].toDate())
                              : null,
                          estimatedGestationalAge: snapshot.data.docs[index]["estimatedGestationalAge"],
                          sFH: snapshot.data.docs[index]["sFH"],
                          fetalHeartRate: snapshot.data.docs[index]["fetalHeartRate"],
                          weight: snapshot.data.docs[index]["fetalHeartRate"],
                          height: snapshot.data.docs[index]["weight"],
                          bMI: snapshot.data.docs[index]["height"],
                          bP: snapshot.data.docs[index]["bMI"],
                          urineTest: snapshot.data.docs[index]["bP"],
                          glucoseLevel: snapshot.data.docs[index]["urineTest"],
                          bloodLevel: snapshot.data.docs[index]["glucoseLevel"],
                          temperature: snapshot.data.docs[index]["bloodLevel"],
                          tTAndiPT: snapshot.data.docs[index]["temperature"],
                        ));
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
                                  Text(snapshot.data.docs[index]["userName"],
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
            },))
        ]),
      ),
    );
  }
}
