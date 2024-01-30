import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Constant/Constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';

class CaretakerAfterBabyAddScreen extends StatefulWidget {
  CaretakerAfterBabyAddScreen({super.key});

  @override
  State<CaretakerAfterBabyAddScreen> createState() =>
      _CaretakerAfterBabyAddScreenState();
}

class _CaretakerAfterBabyAddScreenState
    extends State<CaretakerAfterBabyAddScreen> {
  List<String> personalQuestions = [
    'Name',
    'Initials',
    'Last period(First day), full date ',
    'Previous pregnancies',
    'Mode of deliveries (vaginal delivery or operative delivery)',
    'Marital status',
    'Level of education',
    'Religion and source of income',
    'Ethnicity',
    'Any known medical condition',
    'No of children and year of delivery',
  ];

  List<String> medicalQuestions = [
    'Date',
    'Estimated Gestational Age',
    'SFH',
    'Fatal Heart Rate (FHR)',
    'Weight',
    'Height',
    'BMI',
    'BP',
    'Urine Test',
    'Glucose level',
    'Blood level',
    'Temperature',
    'TT & IPT',
  ];

  List<String> constantText = [
    'VACCINATION SCHEDULE',
    'At Birth (BCG, Hepatitis B, OPV0)',
    '6 weeks  Pent 1, PCV1, OPV 1, Rotavirus 1',
    '10 weeks  Pent 2, PCV 2, OPV2, Rotavirus 2',
    '14 weeks  Pent 3, PCV 3, OPV3, IPV',
    '6 months Vitamin A1',
    "9 months Measles 1, Yellow fever, Meningitis vaccine",
    "12 months Vitamin A2",
  ];

  List<String> personalAnswer = [
    'Answer',
  ];

  List<String> medicalAnswer = [
    'Answer',
  ];

  List<String> svg = [
    'assets/svg/1image.svg',
    'assets/svg/2image.svg',
    'assets/svg/3image.svg',
    'assets/svg/4image.svg',
    'assets/svg/5image.svg',
    'assets/svg/6image.svg',
    'assets/svg/7image.svg',
    'assets/svg/8image.svg',
    'assets/svg/9image.svg',
    'assets/svg/10ten.svg',
    'assets/svg/10image.svg',
    'assets/svg/11image.svg',
    'assets/svg/12image.svg'
  ];

  var chatList = [].obs;

  String formatedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  String formatedTime = DateFormat('HH:mm:ss a').format(DateTime.now());

  TextEditingController messageControllerTab1 = TextEditingController();

  TextEditingController messageControllerTab2 = TextEditingController();

  TextEditingController messageControllerTab3 = TextEditingController();

  final RxString _selectedDate = '01/11/2003'.obs;

  // Initialize with a default value or appropriate starting value.
  RxInt currentIndex = 0.obs;

  RxBool isTab1 = false.obs;
  RxBool isTab2 = false.obs;
  RxBool isTab3 = false.obs;

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffA69EFF),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: const Color(0xffFFFFFF),
                  size: 3.h,
                )),
            title: const Text(
              'Ali',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: MyConstants.boldFontFamily,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: const Color(
                        0xffEBEBEB,
                      ),
                      borderRadius: BorderRadius.circular(32)),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    onTap: (value) {
                      currentIndex.value = value;
                    },
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: MyConstants.mediumFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                    indicator: currentIndex.value == 0
                        ? const ShapeDecoration(
                            color: Color(0xffA69EFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    bottomLeft: Radius.circular(32))))
                        : currentIndex.value == 1
                            ? const ShapeDecoration(
                                color: Color(0xffA69EFF),
                                shape: RoundedRectangleBorder())
                            : currentIndex.value == 2
                                ? const ShapeDecoration(
                                    color: Color(0xffA69EFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(32),
                                            bottomRight: Radius.circular(32))))
                                : const ShapeDecoration(
                                    color: Color(0xffA69EFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Text(
                        'Personal Details',
                      ),
                      Text('Medical Details'),
                      Text('Baby Details'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Personal Details',
                                  style: TextStyle(
                                    fontSize: 13.px,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    color: CustomColors.customBlue1Color,
                                    fontWeight: FontWeight.w500,
                                  )),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: personalQuestions.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          personalQuestions[index],
                                          style: TextStyle(
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              color:
                                                  CustomColors.customBlackColor,
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          personalAnswer[0],
                                          style: TextStyle(
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              color: CustomColors
                                                  .customDarkBlackColor,
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        index == 10
                                            ? const SizedBox.shrink()
                                            : const Divider(
                                                color: Color(0xffBFBFBF),
                                              ),
                                        index == 10
                                            ? SizedBox(
                                                height: 2.h,
                                              )
                                            : SizedBox(
                                                height: 1.h,
                                              ),
                                      ],
                                    );
                                  }),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab1.value == true
                                      ? EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab1.value == true) {
                                            isTab1.value = false;
                                          } else {
                                            isTab1.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab1.value
                                                ? SvgPicture.asset(
                                                    'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                    'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff837AE8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab1.value == true
                                            ? EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab1.value == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: chatList.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: 1.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 1.w,
                                                                vertical: 1.h),
                                                        child: Text(
                                                          chatList[index],
                                                          style: TextStyle(
                                                              fontSize: 10.px),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: .2.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.5.w,
                                                                vertical: .5.h),
                                                        child: Text(
                                                          'Caretaker',
                                                          style: TextStyle(
                                                              fontSize: 10.px,
                                                              color: const Color(
                                                                  0xff9086FF)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    SizedBox(
                                                      height: 1.4.h,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : SizedBox.shrink(),
                                      isTab1.value == true
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xffFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xff000000)
                                                            .withOpacity(0.12),
                                                    blurRadius: 8,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.5.w,
                                                    vertical: 1.h),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              messageControllerTab1,
                                                          style:
                                                              TextStyle(
                                                                  fontSize:
                                                                      13.px),
                                                          // focusNode: focusNode,
                                                          autofocus: true,
                                                          decoration: InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Write message...',
                                                              hintStyle: TextStyle(
                                                                  fontSize:
                                                                      10.px,
                                                                  color: const Color(
                                                                      0xff757575)))),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        chatList.add(
                                                            messageControllerTab1
                                                                .text);
                                                        messageControllerTab1
                                                            .clear();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xffA69EFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        height: 2.8.h,
                                                        width: 14.w,
                                                        child: Center(
                                                          child: Text(
                                                            'Send',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Medical Details',
                                      style: TextStyle(
                                          fontSize: 13.px,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff837AE8))),
                                  Container(
                                    height: 4.5.h,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      color: const Color(0xffFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.15),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Obx(
                                      () => DropdownButton(
                                        borderRadius:
                                            BorderRadius.circular(10.px),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        underline: Container(),
                                        iconSize: 24,
                                        isExpanded: true,
                                        value: _selectedDate.value ?? 'Default',
                                        // Provide a default value if _selectedDate.value is null
                                        items: [
                                          DropdownMenuItem(
                                            value: '01/11/2003',
                                            child: Text('01/11/2003',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/12/2005',
                                            child: Text('01/09/2005',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),

                                          DropdownMenuItem(
                                            value: '01/04/2004',
                                            child: Text('01/04/2004',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/04/2009',
                                            child: Text('01/04/2009',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          DropdownMenuItem(
                                            value: '01/04/2010',
                                            child: Text('01/04/2010',
                                                style: TextStyle(
                                                    fontSize: 10.px,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff837AE8))),
                                          ),
                                          // Add similar DropdownMenuItem entries for other dates
                                        ],
                                        onChanged: (String? selectedDate) {
                                          _selectedDate.value = selectedDate ??
                                              'Default'; // Update the selected date using _selectedDate.value
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: medicalQuestions.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          medicalQuestions[index],
                                          style: TextStyle(
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(svg[index]),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              medicalAnswer[0],
                                              style: TextStyle(
                                                  fontSize: 10.px,
                                                  fontWeight: FontWeight.w400,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        index == 10
                                            ? const SizedBox.shrink()
                                            : const Divider(
                                                color: Color(0xffBFBFBF),
                                              ),
                                        index == 10
                                            ? SizedBox(
                                                height: 2.h,
                                              )
                                            : SizedBox(
                                                height: 1.h,
                                              ),
                                      ],
                                    );
                                  }),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab2.value == true
                                      ? EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab2.value == true) {
                                            isTab2.value = false;
                                          } else {
                                            isTab2.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab2.value
                                                ? SvgPicture.asset(
                                                    'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                    'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff837AE8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab2.value == true
                                            ? EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab2.value == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: chatList.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: 1.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 1.w,
                                                                vertical: 1.h),
                                                        child: Text(
                                                          chatList[index],
                                                          style: TextStyle(
                                                              fontSize: 10.px),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: .2.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.5.w,
                                                                vertical: .5.h),
                                                        child: Text(
                                                          'Caretaker',
                                                          style: TextStyle(
                                                              fontSize: 10.px,
                                                              color: const Color(
                                                                  0xff9086FF)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    SizedBox(
                                                      height: 1.4.h,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                      isTab2.value == true
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xffFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xff000000)
                                                            .withOpacity(0.12),
                                                    blurRadius: 8,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.5.w,
                                                    vertical: 1.h),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              messageControllerTab2,
                                                          style:
                                                              TextStyle(
                                                                  fontSize:
                                                                      13.px),
                                                          // focusNode: focusNode,
                                                          autofocus: true,
                                                          decoration: InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Write message...',
                                                              hintStyle: TextStyle(
                                                                  fontSize:
                                                                      10.px,
                                                                  color: const Color(
                                                                      0xff757575)))),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        chatList.add(
                                                            messageControllerTab2
                                                                .text);
                                                        messageControllerTab2
                                                            .clear();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xffA69EFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        height: 2.8.h,
                                                        width: 14.w,
                                                        child: Center(
                                                          child: Text(
                                                            'Send',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),

                      //
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Baby Details',
                                  style: TextStyle(
                                      fontSize: 13.px,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.customBlue1Color,
                                      fontFamily:
                                          MyConstants.mediumFontFamily)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Outcome of pregnancy',
                                style: TextStyle(
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily),
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                'Pregnancy loss',
                                style: TextStyle(
                                    color: CustomColors.customBlue1Color,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Detail explain what's happened",
                                style: TextStyle(
                                    fontSize: 10.px,
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Mode of  delivery',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Vaginal Delivery",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Number of Babies',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Date of delivery',
                                        style: TextStyle(
                                            color:
                                                CustomColors.customBlackColor,
                                            fontFamily:
                                                MyConstants.mediumFontFamily,
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/dateimage.svg'),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            formatedDate.toString(),
                                            style: TextStyle(
                                                fontSize: 10.px,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Time of Delivery',
                                        style: TextStyle(
                                            color:
                                                CustomColors.customBlackColor,
                                            fontFamily:
                                                MyConstants.mediumFontFamily,
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/timeImage.svg'),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            formatedTime,
                                            style: TextStyle(
                                                fontSize: 10.px,
                                                fontWeight: FontWeight.w500,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                'Baby’s Gender',
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(
                                color: Color(0xffBFBFBF),
                              ),
                              Text(
                                "Baby's weight",
                                style: TextStyle(
                                    color: CustomColors.customBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Answer",
                                style: TextStyle(
                                    color: CustomColors.customDarkBlackColor,
                                    fontFamily: MyConstants.mediumFontFamily,
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: constantText.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: index == 0 ? 1.h : 0.6.h),
                                    child: Text(
                                      constantText[index],
                                      style: index == 0
                                          ? TextStyle(
                                              color: CustomColors
                                                  .customDarkBlackColor,
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : TextStyle(
                                              color:
                                                  CustomColors.customBlackColor,
                                              fontFamily:
                                                  MyConstants.mediumFontFamily,
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8),
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: isTab3.value == true
                                      ? EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.5.h)
                                      : EdgeInsets.symmetric(
                                          horizontal: 1.5.w, vertical: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (isTab3.value == true) {
                                            isTab3.value = false;
                                          } else {
                                            isTab3.value = true;
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            isTab3.value
                                                ? SvgPicture.asset(
                                                    'assets/svg/circleminus.svg')
                                                : SvgPicture.asset(
                                                    'assets/svg/circle.svg'),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff837AE8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: isTab3.value == true
                                            ? EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 1.h)
                                            : EdgeInsets.symmetric(
                                                horizontal: 1.w, vertical: 0),
                                        child: const Divider(
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                      // isPressed.value==true?
                                      isTab3.value == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: chatList.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: 1.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 1.w,
                                                                vertical: 1.h),
                                                        child: Text(
                                                          chatList[index],
                                                          style: TextStyle(
                                                              fontSize: 10.px),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: const Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.15),
                                                            blurRadius: 8,
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                          ),
                                                        ],
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          right: 1.w,
                                                          left: 11.9.w,
                                                          top: .2.h),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.5.w,
                                                                vertical: .5.h),
                                                        child: Text(
                                                          'Caretaker',
                                                          style: TextStyle(
                                                              fontSize: 10.px,
                                                              color: const Color(
                                                                  0xff9086FF)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    SizedBox(
                                                      height: 1.4.h,
                                                    ),
                                                  ],
                                                );
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                      isTab3.value == true
                                          ? Container(
                                              alignment: Alignment.centerLeft,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xffFFFFFF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xff000000)
                                                            .withOpacity(0.12),
                                                    blurRadius: 8,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.5.w,
                                                    vertical: 1.h),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              messageControllerTab3,
                                                          style:
                                                              TextStyle(
                                                                  fontSize:
                                                                      13.px),
                                                          // focusNode: focusNode,
                                                          autofocus: true,
                                                          decoration: InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Write message...',
                                                              hintStyle: TextStyle(
                                                                  fontSize:
                                                                      10.px,
                                                                  color: const Color(
                                                                      0xff757575)))),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        chatList.add(
                                                            messageControllerTab3
                                                                .text);
                                                        messageControllerTab3
                                                            .clear();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xffA69EFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        height: 2.8.h,
                                                        width: 14.w,
                                                        child: Center(
                                                          child: Text(
                                                            'Send',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ) // ListView.builder(itemCount: questions.length,
              //   itemBuilder: (context, index) {
              //
              // },)
            ],
          ),
        ),
      ),
    );
  }
}
