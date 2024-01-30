import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../Utils/Colors/Colors.dart';
import '../../Utils/Constant/Constant.dart';

class ReferOtherScreen extends StatefulWidget {
  const ReferOtherScreen({Key? key,}) : super(key: key);

  @override
  State<ReferOtherScreen> createState() => _ReferOtherScreenState();
}

class _ReferOtherScreenState extends State<ReferOtherScreen> {
  String? selectedModel;
  List<String> models = ['1', '2', '3', '4'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 24,
              ),
            ),
            Text(
              "Refer to other center",
              style: TextStyle(
                fontFamily: MyConstants.boldFontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
              width: 30,
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "Choose community center",
                style: TextStyle(
                  fontFamily: MyConstants.regularFontFamily,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.customBlackColor,
                ),
              ),
              Container(

                height: 5.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 2.h, right: 2.h),
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(10),

                    boxShadow: [
                      BoxShadow(
                          color:
                           CustomColors.customBlackColor.withOpacity(0.15),
                          blurRadius: 4,
                          offset: const Offset(0, 1))
                    ],
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint:  Text(
                      'None',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff575757),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: models
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff575757),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedModel,
                    onChanged: (String? value) {
                      setState(() {
                        selectedModel = value!;
                      });
                    },
                    iconStyleData: const IconStyleData(
                      icon:Icon(Icons.arrow_drop_down_sharp),
                      iconSize: 14,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: MediaQuery.of(context).size.width/1.18,
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),

                          boxShadow: [
                            BoxShadow(
                                color:
                                CustomColors.customBlackColor.withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 1))
                          ],
                          color: Colors.white),
                      offset: const Offset(-15, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility:
                        MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),
              const Text(
                "Reason",
                style: TextStyle(
                  fontFamily: MyConstants.regularFontFamily,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.customBlackColor,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.customBlackColor.withOpacity(0.15),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: TextFormField(
                  cursorColor: CustomColors.mainAppColor,
                  maxLines: 3,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(16.h, 4.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: CustomColors.mainAppColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Refer",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: MyConstants.mediumFontFamily,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
