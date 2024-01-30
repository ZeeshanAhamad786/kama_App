class UserModel{
  String?  userNameOfStaff;
  String?  userFacilityOfPractice;
  String?  userCadreOfSupervisor;
  String?  userAddress;
  String?  userLocalGovtArea;
  String?  selectedState;
  String?  userChoInCharge;
  String?  userApexOic;
  String?  userHeadOfUnit;
  String?  userPhoneNumber;
  String?  userEmailName;
  String?  userAlternatePassword;
  String?  userPassword;
  String?  userConfirmPassword;
  String?  userId;
  String?  userTimestamp;
  String?  selectedModel;

  UserModel({
  this.userNameOfStaff,
  this.userFacilityOfPractice,
  this.userCadreOfSupervisor,
  this.userAddress,
  this.userLocalGovtArea,
  this.selectedState,
  this.userChoInCharge,
  this.userApexOic,
  this.userHeadOfUnit,
  this.userPhoneNumber,
  this.userEmailName,
  this.userAlternatePassword,
  this.userPassword,
  this.userConfirmPassword,
  this.userId,
  this.userTimestamp,
    this.selectedModel
});

  UserModel.fromJson(Map<String , Object?> json):
      this(
        userNameOfStaff:  json["nameOfStaff"] as String?,
        userFacilityOfPractice: json["facilityOfPractice"] as String?,
        userCadreOfSupervisor: json["cadreOfSupervisor"] as String?,
        userAddress: json["address"] as String?,
        userLocalGovtArea: json["localGovtArea"] as String?,
        selectedState: json["selectedState"] as String?,
        userChoInCharge: json["choInCharge"] as String?,
        userApexOic: json["apexOic"] as String?,
        userHeadOfUnit: json["headOfUnit"] as String?,
        userPhoneNumber: json["phoneNumber"] as String?,
        userEmailName: json["emailName"] as String?,
        userAlternatePassword: json["alternatePassword"] as String?,
        userPassword: json["passwordNumber"] as String?,
        userConfirmPassword: json["confirmPassword"] as String?,
        userId: json["userId"] as String?,
        userTimestamp: json["timeStamp"] as String?,
        selectedModel: json["selectedModel"] as String?,
      );

  Map<String , Object?> toJson(){
    return{
      "nameOfStaff": userNameOfStaff ?? "",
      "facilityOfPractice": userFacilityOfPractice ?? "",
      "cadreOfSupervisor": userCadreOfSupervisor ?? "",
      "address": userAddress ?? "",
      "localGovtArea": userLocalGovtArea ?? "",
      "selectedState": selectedState ?? "",
      "choInCharge": userChoInCharge ?? "",
      "apexOic": userApexOic ?? "",
      "headOfUnit": userHeadOfUnit ?? "",
      "phoneNumber": userPhoneNumber ?? "",
      "emailName": userEmailName ?? "",
      "alternatePassword": userAlternatePassword ?? "",
      "passwordNumber": userPassword ?? "",
      "confirmPassword": userConfirmPassword ?? "",
      "userId": userId ?? "",
      "timeStamp": userTimestamp ?? "",
      "selectedModel": selectedModel ?? "",
    };
  }



}

