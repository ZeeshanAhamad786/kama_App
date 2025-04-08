import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kama_app/Utils/Colors/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/admin/new_center_add_model.dart';

class AddNewCenterController extends GetxController {
  TextEditingController centerNameController = TextEditingController();
  TextEditingController centerAddressController = TextEditingController();
  TextEditingController centerStateController = TextEditingController();
  TextEditingController centerRegNumberController = TextEditingController();
  TextEditingController centerDOEController = TextEditingController();
  TextEditingController centerPPPYController = TextEditingController();
  TextEditingController centerEDPYController = TextEditingController();
  TextEditingController centerStaffNumberController = TextEditingController();
  TextEditingController centerFounderController = TextEditingController();
  TextEditingController centerPhoneNumberController = TextEditingController();
  TextEditingController centerEmailController = TextEditingController();
  var loading = false.obs;
  DateTime? dateTime;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString formatedDate = ''.obs;

  Future<void> pickedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialDate: selectedDate.value,
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      formatedDate.value = DateFormat('dd/MM/yyyy').format(selectedDate.value);
      centerDOEController.text = formatedDate.value;
    }
  }

// set firestore data to model
  final centerData = FirebaseFirestore.instance
      .collection("Centers")
      .withConverter<CenterModel>(
      fromFirestore: (snapshot, options) =>
          CenterModel.fromJson(snapshot.data()!),
      toFirestore: (CenterModel, context) => CenterModel.toJson());
  void formatDate() {
    String dateString = centerDOEController.text;
    dateTime = DateFormat("dd/MM/yyyy").parse(dateString);
  }

  Future<void> addNewCenter(
      {centerName,
        centerAddress,
        centerState,
        centerRegNumber,
        centerDOE,
        centerPPPY,
        centerEDPY,
        centerStaffNumber,
        centerFounder,
        centerPhoneNumber,
        centerEmail}) async {
    try {
      formatDate();
      if (centerNameController.text.isNotEmpty &&
          centerAddressController.text.isNotEmpty &&
          centerStateController.text.isNotEmpty &&
          centerRegNumberController.text.isNotEmpty &&
          centerDOEController.text.isNotEmpty &&
          centerPPPYController.text.isNotEmpty &&
          centerEDPYController.text.isNotEmpty &&
          centerStateController.text.isNotEmpty &&
          centerFounderController.text.isNotEmpty &&
          centerPhoneNumberController.text.isNotEmpty &&
          centerEmailController.text.isNotEmpty) {
        //Regular Expressions
        RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

        if (!emailRegex.hasMatch(centerEmailController.text)) {
          Get.snackbar('Invalid', 'invalid email !please try again',
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white);
        } else {
          loading.value = true;

          return await centerData
              .doc()
              .set(CenterModel(
            centerName: centerNameController.text,
            centerAddress: centerAddressController.text,
            centerState: centerStateController.text,
            regNumber: int.parse(centerRegNumberController.text),
            dateEstablishment: dateTime,
            ppp: int.parse(centerPPPYController.text),
            nDPY: int.parse(centerEDPYController.text),
            sNumber: int.parse(centerStaffNumberController.text),
            founder: centerFounderController.text,
            PhoneNumber: int.parse(centerPhoneNumberController.text),
            email: centerEmailController.text,
          ))
              .then((value) {
            loading.value = false;

            Get.snackbar('Successfully', 'Congratulation Data Add Successfully',
                backgroundColor: CustomColors.mainAppColor,
                colorText: Colors.white);
            centerNameController.clear();
            centerAddressController.clear();
            centerStateController.clear();
            centerRegNumberController.clear();
            centerPPPYController.clear();
            centerEDPYController.clear();
            centerStaffNumberController.clear();
            centerFounderController.clear();
            centerPhoneNumberController.clear();
            centerEmailController.clear();
          });
        }
      } else {
        loading.value = false;

        Get.snackbar('Sorry', 'All Fields are required',
            backgroundColor: CustomColors.mainAppColor,
            colorText: Colors.white);
      }
    } catch (e) {
      loading.value = false;

      log('Error Occurred${e.toString()}');
      Get.snackbar('Sorry', 'Sorry Something went Wrong',
          backgroundColor: CustomColors.mainAppColor, colorText: Colors.white);
    }
  }
RxList integerList=[].obs;
  Future<void> saveIntegerList(List integerList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert the list of integers to a JSON string
    String jsonList = jsonEncode(integerList);
    // Save the JSON string in shared preferences
    await prefs.setString('integerList', jsonList);
  }
  Future<void> loadIntegerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the JSON string from shared preferences
    String? jsonList = prefs.getString('integerList');
    if (jsonList != null) {
      // Parse the JSON string into a list of integers
      List<dynamic> decodedList = jsonDecode(jsonList);
      // Convert the dynamic list to a list of integers

        integerList.value = decodedList.cast<int>();
        log('This is the length ${ integerList.length}');
    }
  }


}