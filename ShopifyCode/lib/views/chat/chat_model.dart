class ChatModel {
  bool status;
  String message;
  ChatData result;
  ChatModel(this.status, this.message, this.result);

  factory ChatModel.fromJson(Map<dynamic, dynamic> json) {
    return ChatModel(json['status'], json['message'],new ChatData.fromJson(json['result'] ?? {}));
  }
}

class SenderData {
  String name="";
  String id="";
  SenderData(this.name, this.id);
  factory SenderData.fromJson(Map<String, dynamic> json) {
    return SenderData(json['name']??"Guest", json['id']);
  }

}

class ChatData {
  String uid ;
  SenderData sender;
  SenderData receiver;
  List<MessageData> chat;


  ChatData(this.uid,this.sender, this.receiver,this.chat);


  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
        json['_id'] ?? ''
        ,new SenderData.fromJson(json['sender'] ?? {})
        ,new SenderData.fromJson(json['receiver'] ?? {}),
        List<MessageData>.from(
            (json["chat"]??[]).map((x) => MessageData.fromJson(x))));
  }

}

class MessageData{
  String msg ;
  String uid = "";
  String sendAt = "";
  String sendBy ;



  MessageData(this.msg,this.uid,this.sendAt,this.sendBy);


  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
        json['msg'] ?? '', json['_id'] ?? '', json['sendAt'] ?? '', json['sendBy'] ?? ''
       );
  }
}



