class ZendeskMsgDataModel {

  List<ChatDataZendesk> comments;
  ZendeskMsgDataModel( this.comments);

  factory ZendeskMsgDataModel.fromJson(Map<dynamic, dynamic> json) {
    return ZendeskMsgDataModel( List<ChatDataZendesk>.from(
    (json["comments"]??[]).map((x) => ChatDataZendesk.fromJson(x))));
  }
}





class ChatDataZendesk {
  String id ;
  String plain_body;
  int author_id;
  String body;
  String created_at;



  ChatDataZendesk(this.id,this.plain_body, this.author_id,this.body,this.created_at);


  factory ChatDataZendesk.fromJson(Map<String, dynamic> json) {
    return ChatDataZendesk(
        json['_id'] ?? '',
        json['plain_body'] ?? '',
        json['author_id'] ?? '',
        json['body'] ?? '',
        json['created_at'] ?? ''

     );
  }

}





