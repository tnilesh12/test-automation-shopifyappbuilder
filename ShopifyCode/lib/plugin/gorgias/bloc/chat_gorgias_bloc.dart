import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/gorgias/bloc/chat_gorgias_event.dart';
import 'package:shopify_code/plugin/gorgias/bloc/chat_gorgias_state.dart';
import '../../../session/session.dart';
import '../msg_gorgias_model.dart';
import '../ticket_gorgias_model.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class ChatGorgiasBloc extends Bloc<ChatGorgiasEvent, ChatGorgiasState> {
  Dio client = Dio();
  Timer? timer;
  late String
      adminEmail; // = globals.plugins[PluginsEnum.GORGIAS.name].secrets.email;
  late String
      password; // = globals.plugins[PluginsEnum.GORGIAS.name].secrets.appKey;
  String ticketId = "";
  int customerId = 0;
  List<ChatDataGorgias> msgData = [];
  late String
      gorgiasBaseUrl; // =globals.plugins[PluginsEnum.GORGIAS.name].secrets.baseUrl;

  ChatGorgiasBloc() : super(ChatGorgiasInitialState()) {
    loadData();
    // ticketGet();
    on<MessageSentEvent>((event, emit) {
      sendChatMsgAPI(event.message);
    });

    // timer = Timer.periodic(Duration(seconds: 10), (timer) {
    //   if (ticketId.isNotEmpty && timer.isActive) {
    //     loadChatAPI();
    //   }
    // });
  }

  loadData() async {
    await loadValue();
    ticketGet();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (ticketId.isNotEmpty && timer.isActive) {
        loadChatAPI();
      }
    });
  }

  loadValue() async {
    if (globals.plugins.containsKey(PluginsEnum.GORGIAS.name) &&
        globals.plugins[PluginsEnum.GORGIAS.name].secrets != null) {
      adminEmail = globals.plugins[PluginsEnum.GORGIAS.name].secrets.email;
      password = globals.plugins[PluginsEnum.GORGIAS.name].secrets.appKey;
      gorgiasBaseUrl =
          globals.plugins[PluginsEnum.GORGIAS.name].secrets.baseUrl;
    } else {
      emit(ChatFailedState(""));
      return;
    }
  }

  @override
  Future<void> close() {
    timer!.cancel();
    return super.close();
  }

  ticketGet() async {
    emit(LoadingChatState());
    ticketId = await Session().getTicketGorgias();
    String sendId = await Session().getSenderGorgias();
    if (sendId.isNotEmpty) {
      customerId = int.parse(sendId);
    }
    if (ticketId.isEmpty) {
      ticketCreationAPI();
    } else {
      loadChatAPI();
    }
  }

  ticketCreationAPI() async {
    try {
      ShopifyUser? shopifyUser = await Session().getLoginData();
      String userEmail = shopifyUser!.email!;
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$adminEmail:$password'));
      client.options.headers["authorization"] = basicAuth;
      String callingUrl = "${gorgiasBaseUrl}tickets";

      var jsonFromData = {
        "customer": {"email": userEmail},
        "messages": [
          {
            "sender": {"email": adminEmail},
            "body_html": "Hello,Need help? ",
            "body_text": "Hello,Need help?",
            "stripped_text": "Hello,Need help?",
            "channel": "api",
            "from_agent": true,
            "subject": "Admin Chat",
            "via": "api",
            "source": {
              "to": [
                {"address": userEmail}
              ],
              "from": {"address": adminEmail}
            },
          }
        ],
        "meta": {"meta": "Moblify"},
        "tags": [
          {"name": "Moblify"}
        ],
        "channel": "api",
        "from_agent": true,
        "status": "open",
        "via": "api"
      };

      var response = await client.post(callingUrl, data: jsonFromData);
      Map<String, dynamic> parsed = json.decode(response.toString());

      TicketGorgiasModel modelGorgias = TicketGorgiasModel.fromJson(parsed);

      Session().setTicketGorgias(modelGorgias.id.toString());
      Session().setSenderGorgias(modelGorgias.customer.id.toString());
      customerId = modelGorgias.customer.id.toInt();
      ticketId = modelGorgias.id.toString();
      loadChatAPI();
    } catch (e) {
      emit(ChatFailedState("Try again"));
    }
  }

  sendChatMsgAPI(String msg) async {
    // emit(LoadingChatState());
    ShopifyUser? shopifyUser = await Session().getLoginData();
    String userEmail = shopifyUser!.email!;
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$adminEmail:$password'));

    client.options.headers["authorization"] = basicAuth;
    String callingUrl = "${gorgiasBaseUrl}tickets/$ticketId/messages";

    var jsonFromData = {
      "sender": {"email": userEmail},
      "source": {
        "to": [
          {"address": adminEmail}
        ],
        "from": {"address": userEmail}
      },
      "body_html": "$msg",
      "body_text": "$msg",
      "stripped_text": "$msg",
      "channel": "email",
      "from_agent": false,
      "via": "api",
      "subject": "Moblify"
    };
    var response = await client.post(callingUrl, data: jsonFromData);
    print("debug gorgias Chat final --------------$response");
    loadChatAPI();
  }

  loadChatAPI() async {
    msgData = [];
    // emit(LoadingChatState());
    try {
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$adminEmail:$password'));

      client.options.headers["authorization"] = basicAuth;
      String callingUrl = "${gorgiasBaseUrl}tickets/$ticketId/messages";
      var response = await client.get(callingUrl);
      Map<String, dynamic> parsed = json.decode(response.toString());
      MsgDataModel modelGorgias = MsgDataModel.fromJson(parsed);
      msgData = modelGorgias.data;
      emit(ChatSuccessState(msgData.reversed.toList()));
      // print("debug gorgias  >>>>>>>>>>>>>>       $response");
    } catch (e) {
      emit(ChatFailedState("Try again"));
      print("debug gorgias time out--------------$e");
    }
  }
}
