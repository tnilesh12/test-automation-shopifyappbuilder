
import 'package:shopify_code/plugin/gorgias/msg_gorgias_model.dart';

abstract class ChatGorgiasState {

}

class ChatGorgiasInitialState extends ChatGorgiasState {

}


class ChatSuccessState extends ChatGorgiasState {
  List<ChatDataGorgias> msgData;
  ChatSuccessState(this.msgData);

}

class ChatFailedState extends ChatGorgiasState {
String msg;
ChatFailedState(this.msg);
}

class LoadingChatState extends ChatGorgiasState {

}