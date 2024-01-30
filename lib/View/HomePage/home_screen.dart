import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:kama_app/View/BottomNavigationBar/bottom_navigation_bar_screen.dart';
import 'package:kama_app/View/HomePage/add_new_center.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int _selectedDrawerItem = 0; // Default: Home is selected

  void _onDrawerItemSelected(int index) {
    setState(() {
      _selectedDrawerItem = index;

      // _globalKey.currentState?.openEndDrawer();
    });
  }

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
    return Scaffold(backgroundColor: Colors.white,
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
                  "Kama",
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
            Container(
              alignment: Alignment.center,
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/png/backgroundImage.png"))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Today's Patient",
                      style: TextStyle(
                        color: CustomColors.customBlackColor,
                        fontSize: 20,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    width: 1.h,
                  ),
                  const Text("175",
                      style: TextStyle(
                        color: CustomColors.customBlackColor,
                        fontSize: 25,
                        fontFamily: MyConstants.boldFontFamily,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20.h,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/png/pinkbackground.png"))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("45",
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
                Container(
                  alignment: Alignment.center,
                  height: 20.h,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/png/greenbackground.png"))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("102",
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
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 1.h),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recent center patient added",
                    style: TextStyle(
                        color: CustomColors.customBlackColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: MyConstants.mediumFontFamily,
                        fontSize: 10),
                  ),
                  InkWell(onTap: () => Get.to(BottomNavigationBarScreen(currentIndex: 1,)),
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
            Expanded(
              child: InkWell(onTap: () => Get.to(BottomNavigationBarScreen(currentIndex: 1,)),
                child: ListView.builder(
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
            ),
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
                  MaterialPageRoute(builder: (_) => const AddNewCenterScreen()));
            },
          ),
        ));
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
