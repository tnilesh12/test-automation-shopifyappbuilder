class MsgDataModel {
  List<ChatDataGorgias> data;
  MsgDataModel(this.data);

  factory MsgDataModel.fromJson(Map<dynamic, dynamic> json) {
    return MsgDataModel(List<ChatDataGorgias>.from(
        (json["data"] ?? []).map((x) => ChatDataGorgias.fromJson(x))));
  }
}

class Sender {
  int id;
  String email;
  String name;
  String firstname;
  String lastname;

  Sender(this.id, this.email, this.name, this.firstname, this.lastname);

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(json['id'] ?? 0, json['email'] ?? '', json['name'] ?? '',
        json['firstname'] ?? '', json['lastname'] ?? '');
  }
}

class ChatDataGorgias {
  String id;
  String body_text;
  String body_html;
  String stripped_text;
  String created_datetime;
  String sent_datetime;
  Sender sender;
  Sender receiver;

  ChatDataGorgias(this.id, this.body_text, this.body_html, this.stripped_text,
      this.created_datetime, this.sent_datetime, this.sender, this.receiver);

  factory ChatDataGorgias.fromJson(Map<String, dynamic> json) {
    return ChatDataGorgias(
      json['_id'] ?? '',
      json['body_text'] ?? '',
      json['body_html'] ?? '',
      json['stripped_text'] ?? '',
      json['created_datetime'] ?? '',
      json['sent_datetime'] ?? '',
      Sender.fromJson(json['sender'] ?? {}),
      Sender.fromJson(json['receiver'] ?? {}),
    );
  }
}
