import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  String? userName;
  String? userInitial;
  String? userLastPeriod;
  String? userPreviousPregnancies;
  String? userVaginalDelivery;
  String? userMaritalStatus;
  String? userLevelOfEducation;
  String? userReligion;
  String? userSourceOfIncome;
  String? userAge;
  String? userEthnicity;
  String? userMedicalCondition;
  String? userNoOfChildrenAndYearOfDelivery;
  String? userId;
  String? userTimeStamp;
  DateTime? selectedDate;
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
  String? myTime;
  String? centerName;
  String? vaginalDelivery;
  String? status;

  PatientModel({
    this.userName,
    this.userInitial,
    this.userLastPeriod,
    this.userPreviousPregnancies,
    this.userVaginalDelivery,
    this.userMaritalStatus,
    this.userLevelOfEducation,
    this.userReligion,
    this.userSourceOfIncome,
    this.userAge,
    this.userEthnicity,
    this.userMedicalCondition,
    this.userNoOfChildrenAndYearOfDelivery,
    this.userId,
    this.userTimeStamp,
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
    this.myTime,
    this.centerName,
    this.vaginalDelivery,
    this.status
  });

  PatientModel.fromJson(Map<String?, Object?> json)
      : this(
          userName: json["userName"] as String?,
          userInitial: json["Initial"] as String?,
          userLastPeriod: json["lastPeriod"] as String?,
          userPreviousPregnancies: json["previousPregnancies"] as String?,
          userVaginalDelivery: json["vaginalDelivery"] as String?,
          userMaritalStatus: json["maritalStatus"] as String?,
          userLevelOfEducation: json["levelOfEducation"] as String?,
          userReligion: json["userReligion"] as String?,
          userSourceOfIncome: json["userSourceOfIncome"] as String?,
          userAge: json["userAge"] as String?,
          userEthnicity: json["userEthnicity"] as String?,
          userMedicalCondition: json["medicalCondition"] as String?,
          userNoOfChildrenAndYearOfDelivery:
              json["noOfChildrenAndYearOfDelivery"] as String?,
          userId: json["userId"] as String?,
          userTimeStamp: json["userTimeStamp"] as String?,
          selectedDate: (json['selectedDate'] as Timestamp?)?.toDate(),
          estimatedGestationalAge: json["estimatedGestationalAge"] as String?,
          sFH: json["sFH"] as String?,
          fetalHeartRate: json["fetalHeartRate"] as String?,
          weight: json["weight"] as String?,
          height: json["height"] as String?,
          bMI: json["bMI"] as String?,
          bP: json["bP"] as String?,
          urineTest: json["urineTest"] as String?,
          glucoseLevel: json["glucoseLevel"] as String?,
          bloodLevel: json["bloodLevel"] as String?,
          tTAndiPT: json["tTAndiPT"] as String?,
          temperature: json["temperature"] as String?,
          myTime: json["myTime"] as String?,
          centerName: json["centerName"] as String?,
          status: json["status"] as String?,
        );

  Map<String, Object?> toJson() {
    return {
      "userName": userName ?? "",
      "Initial": userInitial ?? "",
      "lastPeriod": userLastPeriod ?? "",
      "previousPregnancies": userPreviousPregnancies ?? "",
      "vaginalDelivery": userVaginalDelivery ?? "",
      "maritalStatus": userMaritalStatus ?? "",
      "levelOfEducation": userLevelOfEducation ?? "",
      "userReligion": userReligion ?? "",
      "userSourceOfIncome": userSourceOfIncome ?? "",
      "userAge": userAge ?? "",
      "userEthnicity": userEthnicity ?? "",
      "medicalCondition": userMedicalCondition ?? "",
      "noOfChildrenAndYearOfDelivery": userNoOfChildrenAndYearOfDelivery ?? "",
      "userId": userId ?? "",
      "userTimeStamp": userTimeStamp ?? "",
      "selectedDate": selectedDate ?? "",
      "estimatedGestationalAge": estimatedGestationalAge ?? "",
      "sFH": sFH ?? "",
      "fetalHeartRate": fetalHeartRate ?? "",
      "weight": weight ?? "",
      "height": height ?? "",
      "bMI": bMI ?? "",
      "bP": bP ?? "",
      "urineTest": urineTest ?? "",
      "glucoseLevel": glucoseLevel ?? "",
      "bloodLevel": bloodLevel ?? "",
      "tTAndiPT": tTAndiPT ?? "",
      "temperature": temperature ?? "",
      "myTime": myTime ?? "",
      "centerName": centerName ?? "",
      "status": status ?? "",
    };
  }
}
