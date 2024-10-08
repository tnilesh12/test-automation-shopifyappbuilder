class ChatFormatModel {
  bool status;
  String message;
  ChatDetails chatDetails;
  ChatFormatModel(this.status, this.message, this.chatDetails);

  factory ChatFormatModel.fromJson(Map<dynamic, dynamic> json) {
    return ChatFormatModel(json['status'], json['message'],new ChatDetails.fromJson(json['createdData'] ?? {}));
  }


}

class ChatDetails {
  String msg ;
  String uid = "";
  String sender = "";
  String receiver = "";

  String senderName = "";
  String receiverName = "";
  String sendBy ;

  ChatDetails(this.msg,this.uid,this.sender,this.sendBy,this.receiver, this.senderName, this.receiverName);
  factory ChatDetails.fromJson(Map<String, dynamic> json) {
    return ChatDetails(
        json['chat']['msg'] ?? '', json['chat']['_id'] ?? '', json['sender']['id'] ?? ''
        , json['chat']['sendBy'] ?? ''
        , json['receiver']['id'] ?? ''
        , json['sender']['name'] ?? 'Guest'
        , json['receiver']['name'] ?? 'Admin'
       );
  }
}



