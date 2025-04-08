class CenterModel {
  String? centerName;
  String? centerAddress;
  String? centerState;
  int? regNumber;
  DateTime? dateEstablishment;
  int? ppp;
  int? nDPY;
  int? sNumber;
  String? founder;
  int? PhoneNumber;
  String? email;
  CenterModel(
      {this.centerName,
        this.centerAddress,
        this.centerState,
        this.regNumber,
        this.dateEstablishment,
        this.ppp,
        this.nDPY,
        this.sNumber,
        this.founder,
        this.PhoneNumber,
        this.email});
  CenterModel.fromJson(Map<String , Object?> json):
        this(
        centerName:  json["centerName"] as String?,
        centerAddress: json["centerAddress"] as String?,
        centerState: json["localState"] as String?,
        regNumber: json["registrationNumber"] as int?,
        dateEstablishment: json["dateOfEstablishment"] as DateTime?,
        ppp: json["pregnantPatientPerYear"] as int?,
        nDPY: json["numberOfDeliveryPerYear"] as int?,
        sNumber: json["staffNumber"] as int?,
        founder: json["founder"] as String?,
        PhoneNumber: json["phoneNumber"] as int?,
        email: json["email"] as String?,
      );

  Map<String , dynamic> toJson(){
    return {
      "centerName": centerName ?? "",
      "centerAddress": centerAddress ?? "",
      "centerState": centerState,
      "regNumber": regNumber ?? "",
      "dateEstablishment": dateEstablishment ?? "",
      "ppp": nDPY ?? "",
      "nDPY": sNumber ?? "",
      "sNumber": founder ?? "",
      "founder": PhoneNumber ?? "",
      "PhoneNumber": email ?? "",
      "email": email ?? "",


    };

}}