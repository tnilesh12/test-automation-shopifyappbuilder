abstract class ChatGorgiasEvent {

}


class MessageSentEvent extends ChatGorgiasEvent{
  String message;
  MessageSentEvent(this.message);
}