class BabyModel{
  String? selectedPregnancy;
  String? addTextComment;
  String? deliveryCase;
  String? noOfBabies;
  DateTime? selectedDate1;
  String? selectedTime;
  String? Gender;
  String? bodyWeight;
  String? userId;
  String? baby;
  String? patientId;


  BabyModel({
    this.selectedPregnancy,
    this.addTextComment,
    this.deliveryCase,
    this.noOfBabies,
    this.selectedDate1,
    this.selectedTime,
    this.Gender,
    this.bodyWeight,
    this.userId,
    this.baby,
    this.patientId,
  });

  BabyModel.fromJson(Map<String, Object?> json):this(
    selectedPregnancy:json["selectedPregnancy"] as String,
    addTextComment:json["addTextComment"] as String,
    deliveryCase:json["deliveryCase"] as String,
    selectedDate1:json["selectedDate"] as DateTime,
    selectedTime:json["selectedTime"] as String,
    Gender:json["gender"] as String,
    bodyWeight:json["bodyWeight"] as String,
    noOfBabies:json["noOfBabies"] as String,
    userId:json["userId"] as String,
    baby:json["baby"] as String,
    patientId:json["patientId"] as String,
  );

  Map<String, Object?> tojson(){
    return{
      "selectedPregnancy":selectedPregnancy ?? "",
      "addTextComment":addTextComment ?? "",
      "deliveryCase":deliveryCase ?? "",
      "selectedDate":selectedDate1 ?? "",
      "noOfBabies":noOfBabies ?? "",
      "selectedTime":selectedTime ?? "",
      "gender":Gender ?? "",
      "bodyWeight":bodyWeight ?? "",
      "userId":userId ?? "",
      "baby":baby ?? "",
      "patientId":patientId ?? "",
    };
  }





}