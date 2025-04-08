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
  String?  userAlternateContact;
  String?  userPassword;
  String?  userConfirmPassword;
  String?  userId;
  String?  userTimestamp;
  String?  selectedModel;
  String?  userType;
  String?  deviceToken;

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
  this.userAlternateContact,
  this.userPassword,
  this.userConfirmPassword,
  this.userId,
  this.userTimestamp,
    this.selectedModel,
    this. userType,
    this.deviceToken
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
        userPhoneNumber: json["userPhoneNumber"] as String?,
        userEmailName: json["emailName"] as String?,
        userAlternateContact: json["alternateContact"] as String?,
        userPassword: json["passwordNumber"] as String?,
        userConfirmPassword: json["confirmPassword"] as String?,
        userId: json["userId"] as String?,
        userTimestamp: json["timeStamp"] as String?,
        selectedModel: json["selectedModel"] as String?,
        userType: json["userType"] as String?,
        deviceToken: json["deviceToken"] as String?,
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
      "userPhoneNumber": userPhoneNumber ?? "",
      "emailName": userEmailName ?? "",
      "alternateContact": userAlternateContact ?? "",
      "passwordNumber": userPassword ?? "",
      "confirmPassword": userConfirmPassword ?? "",
      "userId": userId ?? "",
      "timeStamp": userTimestamp ?? "",
      "selectedModel": selectedModel ?? "",
      "userType": userType ?? "",
      "deviceToken": deviceToken ?? "",
    };
  }



}

