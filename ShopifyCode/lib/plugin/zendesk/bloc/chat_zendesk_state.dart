import '../msg_zendesk_model.dart';

abstract class ChatZendeskState {}

class ChatZendeskInitialZendeskState extends ChatZendeskState {}

class ChatSuccessZendeskState extends ChatZendeskState {
  List<ChatDataZendesk> msgData;
  ChatSuccessZendeskState(this.msgData);
}

class ChatFailedZendeskState extends ChatZendeskState {
  String msg;
  ChatFailedZendeskState(this.msg);
}

class LoadingChatZendeskState extends ChatZendeskState {}
