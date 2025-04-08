class PatientDataListModel {
  List<dynamic>? patientDataList;

  PatientDataListModel({this.patientDataList});

  PatientDataListModel.fromJson(Map<String, Object?> json)
      : this(patientDataList: json["patientDataList"] as List<dynamic>);

  Map<String, Object?> toJson() {
    return {
      "patientDataList": patientDataList ?? [],
    };
  }
}
