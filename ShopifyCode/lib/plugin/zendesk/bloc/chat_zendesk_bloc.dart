import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import '../../../session/session.dart';
import '../msg_zendesk_model.dart';
import '../ticket_zendesk_model.dart';
import 'chat_zendesk_event.dart';
import 'chat_zendesk_state.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class ChatZendeskBloc extends Bloc<ChatZendeskEvent, ChatZendeskState> {
  Dio client = Dio();

  Timer? timer;
  late String
      adminName; // = globals.plugins[PluginsEnum.ZENDESK.name].secrets.email + "/token";

  late String
      adminEmail; // = globals.plugins[PluginsEnum.ZENDESK.name].secrets.email;
  late String
      password; // = globals.plugins[PluginsEnum.ZENDESK.name].secrets.appKey;
  String ticketId = "";
  int customerId = 0; // author or requester id submitter id

  late String zendeskBaseUrl;
  List<ChatDataZendesk> msgData = [];

  ChatZendeskBloc() : super(ChatZendeskInitialZendeskState()) {
    loadData();
    // ticketGet();
    on<MessageSentZendeskEvent>((event, emit) {
      sendChatMsgAPI(event.message);
    });

    // timer = Timer.periodic(
    //   Duration(seconds: 10),
    //   (timer) {
    //     if (ticketId.isNotEmpty && timer.isActive) {
    //       print("-------------timer ${timer.isActive}-------------------");
    //       loadChatAPI();
    //     }
    //   },
    // );
  }
  
  loadData() async {
    await loadValue();
    ticketGet();
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (ticketId.isNotEmpty && timer.isActive) {
        print("-------------timer ${timer.isActive}-------------------");
        loadChatAPI();
      }
    });
  }

  loadValue() async {
    if (globals.plugins.containsKey(PluginsEnum.ZENDESK.name) &&
        globals.plugins[PluginsEnum.ZENDESK.name].secrets != null) {
      adminName =
          globals.plugins[PluginsEnum.ZENDESK.name].secrets.email + "/token";
      adminEmail = globals.plugins[PluginsEnum.ZENDESK.name].secrets.email;
      password = globals.plugins[PluginsEnum.ZENDESK.name].secrets.appKey;
      zendeskBaseUrl =
          globals.plugins[PluginsEnum.ZENDESK.name].secrets.baseUrl;
    } else {
      emit(ChatFailedZendeskState(""));
      return;
    }
  }

  @override
  Future<void> close() {
    timer!.cancel();
    return super.close();
  }

  ticketGet() async {
    ticketId = await Session().getTicketZendesk();
    String sendId = await Session().getSenderZendesk();
    if (sendId.isNotEmpty) {
      customerId = int.parse(sendId);
    }
    if (ticketId.isEmpty) {
      ticketCreationAPI();
    } else {
      emit(LoadingChatZendeskState());
      loadChatAPI();
    }
  }

  Future<String> getAdminId() async {
    try {
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$adminName:$password'));
      client.options.headers["authorization"] = basicAuth;

      print("debug id admin  >>>>>>>>>>>>>>>>>>1");
      String callingUrl = "${zendeskBaseUrl}api/v2/users.json?role=admin";

      print("debug id admin  >>>>>>>>>>>>>>>>>>2");
      var response = await client.get(callingUrl);
      print("debug id admin  >>>>>>>>>>>>>>>>>>3");
      Map<String, dynamic> parsed = json.decode(response.toString());
      print("debug id admin >>>>>>>>>>>>>>>>>>4 " +
          parsed["users"][0].toString());

      return parsed["users"][0]["id"].toString();
    } catch (e) {
      print("debug id admin Zendesk exception out  >>>>>>>>>>>>>>       $e");
      return "";
    }
  }

  ticketCreationAPI() async {
    try {
      emit(LoadingChatZendeskState());
      ShopifyUser? shopifyUser = await Session().getLoginData();
      String userEmail = shopifyUser!.email!;
      String userName = shopifyUser!.displayName!;

      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$adminName:$password'));
      print("debug ticket  Zendesk >>>>>>>>>>>>>>>>>>1");
      String adminId = await getAdminId();
      client.options.headers["authorization"] = basicAuth;
      String callingUrl = "${zendeskBaseUrl}api/v2/tickets.json";
      print("debug ticket Zendesk >>>>>>>>>>>>>>>>>>2");

      var jsonFromData = {
        "ticket": {
          "comment": {"body": "Start chat now..", "author_id": adminId},
          "priority": "normal",
          "subject": "Moblify Chat",
          "requester": {"name": userName, "email": userEmail},
          "via": {
            "channel": "chat",
            "source": {
              "from": {"name": "Admin", "address": "${adminEmail}"},
              "to": {"name": userName, "address": userEmail},
              "rel": null
            }
          }
        }
      };
      var response = await client.post(callingUrl, data: jsonFromData);
      print("debug ticket Zendesk-----------respnonse--$response------------");
      print("debug ticket Zendesk >>>>>>>>>>>>>>>>>>3");
      Map<String, dynamic> parsed = json.decode(response.toString());
      print("debug ticket zendesk  >>>>>>>>>>>>>>>>>>4");

      TicketZendeskModel modelZendesk = TicketZendeskModel.fromJson(parsed);

      print("debug ticket Zendesk Chat final >>>>>>>>>>>>>>     ");
      print(
          " Zendesk ticket TicketId here final >>>>>>>>>>>>>> ${modelZendesk.ticket.id}    ");
      Session().setTicketZendesk(modelZendesk.ticket.id.toString());
      Session().setSenderZendesk(modelZendesk.ticket.requester_id.toString());
      customerId = modelZendesk.ticket.requester_id.toInt();
      ticketId = modelZendesk.ticket.id.toString();
      loadChatAPI();
    } catch (e) {
      emit(ChatFailedZendeskState("Try again"));
    }
  }

  sendChatMsgAPI(String msg) async {
    // emit(sendMessageChatZendeskState());
    ShopifyUser? shopifyUser = await Session().getLoginData();
    String userEmail = shopifyUser!.email!;
    String userName = shopifyUser!.displayName!;

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$adminName:$password'));
    print("debug Chat   >>>>>>>>>>>>>>>>>>1");

    client.options.headers["authorization"] = basicAuth;
    String callingUrl = "${zendeskBaseUrl}api/v2/tickets/$ticketId.json";
    print("debug Chat  >>>>>>>>>>>>>>>>>>2>>  $callingUrl\n");

    var jsonFromData = {
      "ticket": {
        "comment": {
          "body": "$msg",
          "author_id": customerId,
          "requester": {"name": userName, "email": userEmail}
        }
      }
    };

    var response = await client.put(callingUrl, data: jsonFromData);

    print("debug Zendesk Chat final >>>>>>>>>>>>>>       $response");
    loadChatAPI();
  }

  loadChatAPI() async {
    try {
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$adminName:$password'));
      print("debug list  >>>>>>>>>>>>>>>>>>1");

      client.options.headers["authorization"] = basicAuth;
      String callingUrl =
          "${zendeskBaseUrl}api/v2/tickets/$ticketId/comments.json";
      print("debug list  >>>>>>>>>>>>>>>>>>2");
      var response = await client.get(callingUrl);
      msgData = [];
      print("debug list  >>>>>>>>>>>>>>>>>>3");
      Map<String, dynamic> parsed = json.decode(response.toString());
      print("debug list  >>>>>>>>>>>>>>>>>>4");
      ZendeskMsgDataModel modelZendesk = ZendeskMsgDataModel.fromJson(parsed);
      msgData = modelZendesk.comments;
      emit(ChatSuccessZendeskState(msgData.reversed.toList()));
      print("debug list Zendesk  >>>>>>>>>>>>>>       $response");
    } catch (e) {
      // emit(ChatFailedZendeskState("Try again"));
      print("debug list Zendesk time out  >>>>>>>>       $e");
      ticketCreationAPI();
    }
  }
}
