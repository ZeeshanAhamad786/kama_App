class AddCommentModel {
  String? senderName;
  String? senderId;
  String? comment;
  String? patientId;
  AddCommentModel(
      {this.senderName, this.senderId, this.comment, this.patientId});
  AddCommentModel.fromJson(Map<String, dynamic> json)
      : this(
            senderName: json["senderName"] as String,
            senderId: json["senderId"] as String,
            comment: json["comment"] as String,
            patientId: json["patientId"] as String);
  Map<String, dynamic> tojson() {
    return {
      "senderName": senderName ?? "",
      "senderId": senderId ?? "",
      "comment": comment ?? "",
      "patientId": patientId ?? "",
    };
  }
}
