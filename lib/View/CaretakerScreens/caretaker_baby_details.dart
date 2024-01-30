import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Constant/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/Colors/Colors.dart';
import 'caretaker_after_baby_add.dart';

class CaretakerBabyDetails extends StatelessWidget {
  TextEditingController commentController = TextEditingController();
  TextEditingController babyNumberController = TextEditingController();
  TextEditingController babyWeightController = TextEditingController();

  CaretakerBabyDetails({super.key});

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

  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String time = DateFormat('HH:mm a').format(DateTime.now());
  RxString formatedDate = ''.obs;

  RxString formatedTime = ''.obs;

  Rx<TimeOfDay> initialTime = TimeOfDay.now().obs;

  Future<void> pickedTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime.value,
    );

    if (pickedTime != null && pickedTime != TimeOfDay.now()) {
      // Convert pickedTime to a DateTime
      DateTime dateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );

      // Format the DateTime to a string
      formatedTime.value = DateFormat('HH:mm a').format(dateTime);
    }
  }

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<String> gender = 'Male'.obs;

  Future<void> pickedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialDate: selectedDate.value,
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      formatedDate.value = DateFormat('dd/MM/yyyy').format(selectedDate.value);
    }
  }

  final RxString _selectedOutcome = 'Pregnancy loss'.obs;

  final RxString selectedDelivery = 'Vaginal Delivery'.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold( backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: const Color(0xffFFFFFF),
                size: 3.h,
              )),
          backgroundColor: const Color(0xffA69EFF),
          title: const Text(
            'Add Baby Details',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: MyConstants.boldFontFamily),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text('Baby Details',
                    style: TextStyle(
                        fontSize: 13.px,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.customBlue1Color,
                        fontFamily: MyConstants.mediumFontFamily)),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Outcome of pregnancy',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customNewBlackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      value: _selectedOutcome.value,
                      borderRadius: BorderRadius.circular(10.px),
                      items: [
                        DropdownMenuItem(
                          value: 'Pregnancy loss',
                          child: Text('Pregnancy loss',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff837AE8))),
                        ),
                        DropdownMenuItem(
                          value: 'Live Delivery',
                          child: Text('Live Delivery',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff837AE8))),
                        ),
                      ],
                      underline: Container(),
                      onChanged: (String? selectedValue) {
                        _selectedOutcome.value = selectedValue!;
                      }),
                ),
                SizedBox(
                  height: 1.3.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Add comment',
                          style: TextStyle(
                              fontSize: 11.px,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff757575)),
                        ),
                        TextFormField(
                          controller: commentController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: 11.px,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff757575)),
                          maxLines: 1,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Mode of  delivery',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customNewBlackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                      ),
                      value: selectedDelivery.value,
                      borderRadius: BorderRadius.circular(10.px),
                      items: [
                        DropdownMenuItem(
                          value: 'Vaginal Delivery',
                          child: Text('Vaginal Delivery',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff837AE8))),
                        ),
                        DropdownMenuItem(
                          value: 'Cesarean Delivery',
                          child: Text('Cesarean Delivery',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff837AE8))),
                        ),
                      ],
                      underline: Container(),
                      onChanged: (String? selectedValue) {
                        selectedDelivery.value = selectedValue!;
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Number of Babies',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customNewBlackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: babyNumberController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 11.px,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff757575)),
                      maxLines: 1,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of delivery',
                          style: TextStyle(
                              fontSize: 10.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyConstants.mediumFontFamily,
                              color: CustomColors.customNewBlackColor),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () {
                            pickedDate(context);
                          },
                          child: Container(
                            width: 100,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: const Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/dateimage.svg'),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    formatedDate.value.isEmpty
                                        ? date
                                        : formatedDate.value,
                                    style: TextStyle(
                                        fontSize: 10.px,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time of Delivery',
                          style: TextStyle(
                              fontSize: 10.px,
                              fontWeight: FontWeight.w500,
                              fontFamily: MyConstants.mediumFontFamily,
                              color: CustomColors.customNewBlackColor),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () {
                            pickedTime(context);
                          },
                          child: Container(
                            width: 100,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: const Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/timeImage.svg'),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    formatedTime.value.isEmpty
                                        ? time
                                        : formatedTime.value,
                                    style: TextStyle(
                                        fontSize: 10.px,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Baby’s Gender',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customNewBlackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                      isExpanded: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.5.w,
                      ),
                      value: gender.value,
                      borderRadius: BorderRadius.circular(10.px),
                      items: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff837AE8))),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female',
                              style: TextStyle(
                                  fontSize: 10.px,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff837AE8))),
                        ),
                      ],
                      underline: Container(),
                      onChanged: (String? selectedValue) {
                        gender.value = selectedValue!;
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Baby's weight",
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      color: CustomColors.customNewBlackColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: const Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: babyWeightController,
                      keyboardType: TextInputType.streetAddress,
                      style: TextStyle(
                          fontSize: 11.px,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff757575)),
                      maxLines: 1,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
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
                                fontSize: 13.px,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyConstants.mediumFontFamily,
                                color: CustomColors.customNewBlackColor)
                            : TextStyle(
                                fontSize: 10.px,
                                fontWeight: FontWeight.w500,
                                fontFamily: MyConstants.mediumFontFamily,
                                color: CustomColors.customNewBlackColor),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xff9086FF)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CaretakerAfterBabyAddScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 13.px,
                              fontWeight: FontWeight.w500,fontFamily: MyConstants.mediumFontFamily,
                              color: const Color(0xffFFFFFF)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
