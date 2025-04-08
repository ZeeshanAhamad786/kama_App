import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Model/supervisor/add_comment_model.dart';

import '../../Utils/Colors/Colors.dart';

class AddCommentController extends GetxController {

  TextEditingController addCommentControllerTab1 = TextEditingController();
  final commentData = FirebaseFirestore.instance
      .collection('Comments')
      .withConverter<AddCommentModel>(
        fromFirestore: (snapshot, options) =>
            AddCommentModel.fromJson(snapshot.data()!),
        toFirestore: (AddCommentModel, context) => AddCommentModel.tojson(),
      );
  Future<void> addCommentToFireStore(
      var senderName,senderId,comment,  patientId,) async {
    if (addCommentControllerTab1.text.isNotEmpty) {
      try {
        commentData
            .add(AddCommentModel(
              senderName:senderName ,
              senderId: senderId,
              comment: comment,
              patientId: patientId,
            ))
            .then((value){
           Get.snackbar(
              "Congratulation",
              "Comment Add Successfully",
              backgroundColor: CustomColors.mainAppColor,
              colorText: Colors.white,
           );
           addCommentControllerTab1.clear();
        }
        );
      } catch (e) {
         Get.snackbar(
            "An Error",
            e.toString(),
            backgroundColor: CustomColors.mainAppColor,
            colorText: Colors.white,
         );
      }
    }
  }
}
