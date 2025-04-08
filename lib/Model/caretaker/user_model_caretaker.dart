class userModelCaretaker{
  String? userName;
  String? chooseCommunity;
  String? traditionalBirthAttendant;
  String? userBirthAttended;
  String? userEmail;
  String? userPassword;
  String? userConfirmPassword;
  String? userId;
  String? userTimeStamp;
  String? userType;


  userModelCaretaker({
    this.userName,
    this.chooseCommunity,
    this.traditionalBirthAttendant,
    this.userBirthAttended,
    this.userEmail,
    this.userPassword,
    this.userConfirmPassword,
    this.userId,
    this.userTimeStamp,
    this.userType,
});

  userModelCaretaker.fromJson(Map<String , Object?> json)
      :this(
      userName:json["name"] as String?,
    chooseCommunity:json["chooseCommunity"] as String?,
    traditionalBirthAttendant:json["traditionalBirthAttendant"] as String?,
    userBirthAttended:json["birthAttended"] as String?,
    userEmail:json["emailName"] as String?,
    userPassword:json["passwordNumber"] as String?,
    userConfirmPassword:json["confirmPassword"] as String?,
    userId:json["userId"] as String?,
    userTimeStamp:json["timeStamp"] as String?,
    userType:json["userCaretaker"] as String?,
  );
  Map<String ,Object?>toJson(){
    return{
      "name":userName ?? "",
      "chooseCommunity":chooseCommunity ?? "",
      "traditionalBirthAttendant":traditionalBirthAttendant ?? "",
      "birthAttended":userBirthAttended ?? "",
      "emailName":userEmail ?? "",
      "passwordNumber":userPassword ?? "",
      "confirmPassword":userConfirmPassword ?? "",
      "userId":userId ?? "",
      "timeStamp":userTimeStamp ?? "",
      "userType":userType ?? "",
    };
  }

}