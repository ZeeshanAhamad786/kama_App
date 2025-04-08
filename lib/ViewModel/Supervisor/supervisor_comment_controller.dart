
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_app/Model/supervisor/add_comment_model.dart';

import '../../Utils/Colors/Colors.dart';

class SupervisorAddCommentController extends GetxController {
  String? patientId;
  List patientIds=[];
  String? Comment;
  RxList CommentList=[].obs;
  RxList senderNameList=[].obs;
  TextEditingController superVisoraddCommentControllerTab1 = TextEditingController();
  final commentData = FirebaseFirestore.instance
      .collection('Comments')
      .withConverter<AddCommentModel>(
    fromFirestore: (snapshot, options) =>
        AddCommentModel.fromJson(snapshot.data()!),
    toFirestore: (AddCommentModel, context) => AddCommentModel.tojson(),
  );
  Future<void> supervisorAddCommentToFireStore(
      var senderName,senderId,comment,  patientId,) async {
    if (superVisoraddCommentControllerTab1.text.isNotEmpty) {
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
          superVisoraddCommentControllerTab1.clear();
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

  Future<void> getSenderData(var userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Comments')
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Clear CommentList before adding new comments
        CommentList.clear();
        senderNameList.clear();
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data();

          String senderName = data['senderName'];
          String comment = data['comment'];
           patientId = data['patientId'];

          // Add comment  && senderName to List
          if(patientId==userId){
            CommentList.add(comment);
            senderNameList.add(senderName);
            patientIds.add(patientId);
          }else{
            log('There are No Match');
          }

          print('Comment: $comment, PatientId: $patientId');
        });
      }
    } catch (e) {
      Get.snackbar(
        "An Error ",
        e.toString(),
        backgroundColor: CustomColors.mainAppColor,
        colorText: Colors.white,
      );
    }
  }

}
