
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/BottomNavigationBar/caretaker_bottom_navigation_screen.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_add_new_patient.personal_details.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_alert_screen.dart';
import 'package:kama_app/View/CaretakerScreens/caretaker_personal_details.dart';
import 'package:kama_app/View/CaretakerScreens/complete_patient.dart';
import 'package:kama_app/View/CaretakerScreens/pending_patient.dart';
import 'package:kama_app/View/CaretakerScreens/total_patients.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ViewModel/Care_taker/baby_controller.dart';
import '../../ViewModel/Care_taker/get_user_data_personal_details.dart';
import '../../ViewModel/Care_taker/patient_personal_details_controller.dart';
import '../../ViewModel/Supervisor/supervisor_comment_controller.dart';
import '../Supervisor/patient_screen.dart';
import 'caretaker_after_baby_add.dart';

class CaretakerHomeScreen extends StatefulWidget {
  const CaretakerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CaretakerHomeScreen> createState() => _CaretakerHomeScreenState();
}

class _CaretakerHomeScreenState extends State<CaretakerHomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  PatientPersonalDetailsController patientPersonalDetailsController =
  Get.find(tag: "patientPersonalDetailsController");
  GetUserDataPersonalDetails getUserDataPersonalDetails =
  Get.find(tag: "getUserDataPersonalDetails");
  BabyModelController babyModelController =Get.find(tag: "babyModelController");

  final SupervisorAddCommentController superVisoraddCommentControllerTab1 =
  Get.find(tag: 'supervisorAddCommentController');
  RxInt totalPatientCount=0.obs;
  RxInt patientPending=0.obs;
  RxInt patientComplete=0.obs;
  @override
  void initState(){
    super.initState();
    fetchPatients();
log('These are ids ${babyModelController.babyDataList}');
  }
  Future<void> fetchPatients() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('patient_data').get();

    totalPatientCount.value = snapshot.size;

    snapshot.docs.forEach((DocumentSnapshot document) {
      var data = document.data() as Map<String, dynamic>;
      var status = data['status'];

      if (status == 'pending') {
        patientPending.value++;
      } else if (status == 'complete') {
        patientComplete.value++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        backgroundColor: Colors.white,
        key: _globalKey,
        drawer: Drawer(
          width: 30.h,
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.white)),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  SizedBox(
                    height: 8.h,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: CustomColors.mainAppColor,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/svg/BURGER.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildDrawerItem(
                    icon: "assets/svg/splashnew.svg",
                    title: "Home",
                    onTap: () => Get.offAll(CaretakerBottomNavigationScreen(currentIndex: 0)),
                  ),
                  buildDrawerItem(
                    icon: "assets/svg/alert.svg",
                    title: "Alert",
                    onTap: () => Get.offAll(CaretakerBottomNavigationScreen(currentIndex: 1)),
                  ),
                  buildDrawerItem(
                    icon: "assets/svg/refer.svg",
                    title: "Refer",
                    onTap: () => Get.offAll(CaretakerBottomNavigationScreen(currentIndex: 2)),
                  ),
                  buildDrawerItem(
                    icon: "assets/svg/hospital.svg",
                    title: "Center",
                    onTap: () => Get.offAll(CaretakerBottomNavigationScreen(currentIndex: 3)),
                  ),
                  buildDrawerItem(
                    icon: "assets/svg/setting.svg",
                    title: "Setting",
                    onTap: () => Get.offAll(CaretakerBottomNavigationScreen(currentIndex: 4)),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/solar_logout.svg"),
                      SizedBox(width: 2.h),
                      const Text("Logout",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: MyConstants.mediumFontFamily,
                              fontWeight: FontWeight.w500,
                              color: CustomColors.customBlackColor)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.mainAppColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      _globalKey.currentState!.openDrawer();
                    },
                    child: SvgPicture.asset("assets/svg/BURGER.svg")),
                const Text(
                  "KAMA Care",
                  style: TextStyle(
                      fontFamily: MyConstants.boldFontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                  width: 30,
                )
              ],
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Column(children: [
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Caretaker",
                      style: TextStyle(
                          color: CustomColors.customBlackColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: MyConstants.boldFontFamily,
                          fontSize: 20),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: CustomColors.customBlackColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: MyConstants.regularFontFamily,
                          fontSize: 13),
                    ),
                  ],
                ),
                GestureDetector(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CaretakerAlertScreen()));
                },
                    child: SvgPicture.asset("assets/svg/bellicon.svg"))
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(onTap: () {
              Get.to(()=>TotalPatients());
            },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/png/backgroundImage.png"))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Today's Patients",
                        style: TextStyle(
                          color: CustomColors.customBlackColor,
                          fontSize: 20,
                          fontFamily: MyConstants.mediumFontFamily,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      width: 1.h,
                    ),
                     Text("${totalPatientCount.toString()}",
                        style: TextStyle(
                          color: CustomColors.customBlackColor,
                          fontSize: 25,
                          fontFamily: MyConstants.boldFontFamily,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {
                  Get.to(()=>PendingPatient());
                },
                  child: Container(
                    alignment: Alignment.center,
                    height: 20.h,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/png/pinkbackground.png"))),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${patientPending.toString()}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.customBlackColor,
                              fontSize: 25,
                              fontFamily: MyConstants.boldFontFamily,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("Pending Patients ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.customBlackColor,
                              fontSize: 16,
                              fontFamily: MyConstants.regularFontFamily,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                GestureDetector(onTap: (){
                  Get.to(()=>CompletePatient());
                },
                  child: Container(
                    alignment: Alignment.center,
                    height: 20.h,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/png/greenbackground.png"))),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${patientComplete.toString()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.customBlackColor,
                              fontSize: 25,
                              fontFamily: MyConstants.boldFontFamily,
                              fontWeight: FontWeight.w600,
                            )),
                        Text("Complete Patients ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.customBlackColor,
                              fontSize: 16,
                              fontFamily: MyConstants.regularFontFamily,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recent patient added",
                    style: TextStyle(
                        color: CustomColors.customBlackColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 10),
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SuperVisorPatientName()));
                  },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: CustomColors.customBlueColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),

            Expanded(child: StreamBuilder(
              stream: patientPersonalDetailsController.userPatientData.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasError){
                  return Text("Something went wrong");
                }else if (snapshot.connectionState ==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else if(!snapshot.hasData){
                  return Text("No data found");
                }else if(snapshot.hasData){
                  return ListView.builder(
                    physics:  BouncingScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        babyModelController.getBabyData(snapshot.data.docs[index]["userId"]);

                        return GestureDetector(onTap: () {
                          babyModelController.getBabyData(snapshot.data.docs[index]["userId"]);
                          if(babyModelController.babyDataList.contains(snapshot.data.docs[index]["userId"])  ){
                            superVisoraddCommentControllerTab1.getSenderData(snapshot.data.docs[index]["userId"]);

                            Get.to(CaretakerAfterBabyAddScreen(
                              userName: snapshot.data.docs[index]["userName"],
                              patientId: snapshot.data.docs[index]["userId"],
                              userNoOfChildrenAndYearOfDelivery: snapshot.data.docs[index]["noOfChildrenAndYearOfDelivery"],
                              userMedicalCondition: snapshot.data.docs[index]["medicalCondition"],
                              userEthnicity: snapshot.data.docs[index]["userEthnicity"],
                              userReligion: snapshot.data.docs[index]["userReligion"],
                              userSourceOfIncome: snapshot.data.docs[index]["userSourceOfIncome"],
                              userAge: snapshot.data.docs[index]["userAge"],
                              userLevelOfEducation: snapshot.data.docs[index]["levelOfEducation"],
                              userMaritalStatus: snapshot.data.docs[index]["maritalStatus"],
                              userVaginalDelivery: snapshot.data.docs[index]["vaginalDelivery"],
                              userPreviousPregnancies: snapshot.data.docs[index]["previousPregnancies"],
                              userLastPeriod: snapshot.data.docs[index]["lastPeriod"],
                              userInitial: snapshot.data.docs[index]["Initial"],
                              selectedDate: snapshot.data.docs[index]["selectedDate"]?.toDate() != null
                                  ? DateFormat('dd/MM/yyyy').format(snapshot.data.docs[index]["selectedDate"].toDate())
                                  : null,
                              estimatedGestationalAge: snapshot.data.docs[index]["estimatedGestationalAge"],
                              sFH: snapshot.data.docs[index]["sFH"],
                              fetalHeartRate: snapshot.data.docs[index]["fetalHeartRate"],
                              weight: snapshot.data.docs[index]["weight"],
                              height: snapshot.data.docs[index]["height"],
                              bMI: snapshot.data.docs[index]["bMI"],
                              bP: snapshot.data.docs[index]["bP"],
                              urineTest: snapshot.data.docs[index]["urineTest"],
                              glucoseLevel: snapshot.data.docs[index]["glucoseLevel"],
                              bloodLevel: snapshot.data.docs[index]["bloodLevel"],
                              temperature: snapshot.data.docs[index]["temperature"],
                              tTAndiPT: snapshot.data.docs[index]["tTAndiPT"],
                              title: 'CareTaker',





                            ));
                          }else{

                            Get.to(CaretakerPersonalDetails(
                              userName: snapshot.data.docs[index]["userName"],
                              patientId: snapshot.data.docs[index]["userId"],
                              userNoOfChildrenAndYearOfDelivery: snapshot.data.docs[index]["noOfChildrenAndYearOfDelivery"],
                              userMedicalCondition: snapshot.data.docs[index]["medicalCondition"],
                              userEthnicity: snapshot.data.docs[index]["userEthnicity"],
                              userReligion: snapshot.data.docs[index]["userReligion"],
                              userSourceOfIncome: snapshot.data.docs[index]["userSourceOfIncome"],
                              userAge: snapshot.data.docs[index]["userAge"],
                              userLevelOfEducation: snapshot.data.docs[index]["levelOfEducation"],
                              userMaritalStatus: snapshot.data.docs[index]["maritalStatus"],
                              userVaginalDelivery: snapshot.data.docs[index]["vaginalDelivery"],
                              userPreviousPregnancies: snapshot.data.docs[index]["previousPregnancies"],
                              userLastPeriod: snapshot.data.docs[index]["lastPeriod"],
                              userInitial: snapshot.data.docs[index]["Initial"],
                              selectedDate: snapshot.data.docs[index]["selectedDate"]?.toDate() != null
                                  ? DateFormat('dd/MM/yyyy').format(snapshot.data.docs[index]["selectedDate"].toDate())
                                  : null,
                              estimatedGestationalAge: snapshot.data.docs[index]["estimatedGestationalAge"],
                              sFH: snapshot.data.docs[index]["sFH"],
                              fetalHeartRate: snapshot.data.docs[index]["fetalHeartRate"],
                              weight: snapshot.data.docs[index]["weight"],
                              height: snapshot.data.docs[index]["height"],
                              bMI: snapshot.data.docs[index]["bMI"],
                              bP: snapshot.data.docs[index]["bP"],
                              urineTest: snapshot.data.docs[index]["urineTest"],
                              glucoseLevel: snapshot.data.docs[index]["glucoseLevel"],
                              bloodLevel: snapshot.data.docs[index]["bloodLevel"],
                              temperature: snapshot.data.docs[index]["temperature"],
                              tTAndiPT: snapshot.data.docs[index]["tTAndiPT"], title: 'CareTaker',




                            ));
                          }

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
          floatingActionButton: Padding(
            padding:  EdgeInsets.only(bottom: 8.h),
            child: FloatingActionButton(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              backgroundColor: CustomColors.mainAppColor,
              child: const Icon(Icons.add, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CaretakerAddNewPatientPersonalDetails()));
              },
            ),
          )
      ),
    );
  }

  Widget buildDrawerItem(
      {required String icon, required String title, required Function()? onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: SvgPicture.asset(
              icon,
              height: 25,
              width: 25,
              color: CustomColors.customLightGreyColor,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: MyConstants.mediumFontFamily,
                color: CustomColors.customLightGreyColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: const Divider(
            color: Color(0xffDDD9FF),
            thickness: 1.5,
            height: 1,
          ),
        ),
      ],
    );
  }
}
