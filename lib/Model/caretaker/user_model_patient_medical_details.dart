import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalDetailsModel{
  DateTime?    selectedDate;
  String? estimatedGestationalAge;
  String? sFH;
  String? fetalHeartRate;
  String? weight;
  String? height;
  String? bMI;
  String? bP;
  String? urineTest;
  String? glucoseLevel;
  String? bloodLevel;
  String? temperature;
  String? tTAndiPT;
  String? userId;
  String? myTime;


  MedicalDetailsModel({
    this.selectedDate,
    this.estimatedGestationalAge,
    this.sFH,
    this.fetalHeartRate,
    this.weight,
    this.height,
    this.bMI,
    this.bP,
    this.urineTest,
    this.glucoseLevel,
    this.bloodLevel,
    this.temperature,
    this.tTAndiPT,
    this.userId,
    this.myTime,

  });
  MedicalDetailsModel.fromJson(Map<String? , Object?> json):
        this(
        selectedDate: (json['selectedDate'] as Timestamp?)?.toDate(),
        estimatedGestationalAge:json["estimatedGestationalAge"] as String?,
        sFH:json["sFH"] as String?,
        fetalHeartRate:json["fetalHeartRate"] as String?,
        weight:json["weight"] as String?,
        height:json["height"] as String?,
        bMI:json["bMI"] as String?,
        bP:json["bP"] as String?,
        urineTest:json["urineTest"] as String?,
        glucoseLevel:json["glucoseLevel"] as String?,
        bloodLevel:json["bloodLevel"] as String?,
        userId:json["userId"] as String?,
        tTAndiPT:json["tTAndiPT"] as String?,
        temperature:json["temperature"] as String?,
        myTime:json["myTime"] as String?,
      );
  Map<String , Object?> toJson(){
    return{
      "selectedDate":selectedDate ?? "",
      "estimatedGestationalAge":estimatedGestationalAge ?? "",
      "sFH":sFH ?? "",
      "fetalHeartRate":fetalHeartRate ?? "",
      "weight":weight ?? "",
      "height":height ?? "",
      "bMI":bMI ?? "",
      "bP":bP ?? "",
      "urineTest":urineTest ?? "",
      "glucoseLevel":glucoseLevel ?? "",
      "bloodLevel":bloodLevel ?? "",
      "userId":userId ?? "",
      "tTAndiPT":tTAndiPT ?? "",
      "temperature":temperature ?? "",
      "myTime":myTime ?? "",

    };
  }

}