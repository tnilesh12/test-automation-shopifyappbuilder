abstract class ChatZendeskEvent {

}


class MessageSentZendeskEvent extends ChatZendeskEvent{
  String message;
  MessageSentZendeskEvent(this.message);
}