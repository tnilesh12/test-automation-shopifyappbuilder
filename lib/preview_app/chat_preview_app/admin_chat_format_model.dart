class AdminChatFormatModel {
  bool status;
  String message;
  AdminChatDetails chatDetails;
  AdminChatFormatModel(this.status, this.message, this.chatDetails);

  factory AdminChatFormatModel.fromJson(Map<dynamic, dynamic> json) {
    return AdminChatFormatModel(json['status'], json['message'],
        new AdminChatDetails.fromJson(json['createdData'] ?? {}));
  }
}

class AdminChatDetails {
  String msg;
  String uid = "";
  String sender = "";
  String receiver = "";

  String senderName = "";
  String receiverName = "";
  String sendBy;

  AdminChatDetails(this.msg, this.uid, this.sender, this.sendBy, this.receiver,
      this.senderName, this.receiverName);
  factory AdminChatDetails.fromJson(Map<String, dynamic> json) {
    return AdminChatDetails(
        json['chat']['msg'] ?? '',
        json['chat']['_id'] ?? '',
        json['sender']['id'] ?? '',
        json['chat']['sendBy'] ?? '',
        json['receiver']['id'] ?? '',
        json['sender']['name'] ?? 'Guest',
        json['receiver']['name'] ?? 'Admin');
  }
}
