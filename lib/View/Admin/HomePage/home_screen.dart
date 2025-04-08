import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/Admin/HomePage/admin_complete_patient.dart';
import 'package:kama_app/View/Admin/HomePage/admin_pending_patient.dart';
import 'package:kama_app/View/BottomNavigationBar/bottom_navigation_bar_screen.dart';
import 'package:kama_app/View/Admin/HomePage/add_new_center.dart';
import 'package:kama_app/View/Supervisor/center_name_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../ViewModel/AdminController/new_center_add_controller.dart';
import 'admin_total_patient.dart';
import 'center_patient_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  AddNewCenterController addNewCenterController =Get.find(tag: "addNewCenterController");
  int _selectedDrawerItem = 0; // Default: Home is selected

  void _onDrawerItemSelected(int index) {
    setState(() {
      _selectedDrawerItem = index;
    });
  }
  RxInt totalPatientCount=0.obs;
  RxInt patientPending=0.obs;
  RxInt patientComplete=0.obs;
  @override
  void initState(){
    super.initState();
    fetchPatients();

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
    return
     Obx(()=> Scaffold(backgroundColor: Colors.white,
         key: _globalKey,
         drawer: Drawer(width: 30.h,
           shape: OutlineInputBorder(
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
                       onTap: ()=>Get.offAll(BottomNavigationBarScreen(currentIndex: 0,))
                   ),
                   buildDrawerItem(
                       icon: "assets/svg/hospital.svg",
                       title: "Center",
                       onTap: ()=>Get.offAll(BottomNavigationBarScreen(currentIndex: 1,))
                   ),
                   buildDrawerItem(
                       icon: "assets/svg/setting.svg",
                       title: "Setting",
                       onTap: ()=>Get.offAll(BottomNavigationBarScreen(currentIndex: 2,))
                   ),
                 ]),
                 Padding(
                   padding: const EdgeInsets.all(16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SvgPicture.asset("assets/svg/logout.svg"),
                       SizedBox(width: 2.h),
                       const Text("Logout",
                           style: TextStyle(
                               fontSize: 13,
                               fontFamily: MyConstants.mediumFontFamily,
                               fontWeight: FontWeight.w500,
                               color: CustomColors.customRedColor)),
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
           child:
           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             SizedBox(
               height: 3.h,
             ),
             const Text(
               "Hello Admin",
               style: TextStyle(
                   color: CustomColors.customBlackColor,
                   fontWeight: FontWeight.w600,
                   fontFamily: MyConstants.boldFontFamily,
                   fontSize: 20),
             ),
             const Text(
               "Welcome Back",
               style: TextStyle(
                   color: CustomColors.customBlackColor,
                   fontWeight: FontWeight.w400,
                   fontFamily: MyConstants.regularFontFamily,
                   fontSize: 13),
             ),
             SizedBox(
               height: 2.h,
             ),
             GestureDetector(onTap: () {
               Get.to(()=>TotalPatientsAdmin());
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
                   Get.to(()=>AdminPendingPatient());
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
                 GestureDetector(onTap: () {
                   Get.to(()=>AdminCompletePatient());
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
               padding:  EdgeInsets.symmetric(horizontal: 1.h),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     "Recent center added",
                     style: TextStyle(
                         color: CustomColors.customBlackColor,
                         fontWeight: FontWeight.w500,
                         fontFamily: MyConstants.mediumFontFamily,
                         fontSize: 10),
                   ),
                   InkWell(onTap: () => Get.to(CenterNameScreen(title: 'viewAll',)),
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
                       physics: BouncingScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: snapshot.data.docs.length,
                       itemBuilder: (BuildContext context, int index) {

                         return GestureDetector(onTap: () {
                           Get.to(CenterPatientNameAdmin(centerName1:snapshot.data.docs[index]["centerName"]
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
                   MaterialPageRoute(builder: (_) =>  AddNewCenterScreen()));
             },
           ),
         )));
  }

  Widget buildDrawerItem(
      {required String icon, required String title, required Function() onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: SvgPicture.asset(
              icon,
              height: 25,
              width: 25,
              color: CustomColors.customGreyBoldColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: MyConstants.mediumFontFamily,
                color: CustomColors.customGreyBoldColor,
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
