import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'admin_chat_shimmer_view.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';
import 'admin_chat_format_model.dart';
import 'admin_chat_model.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminChatScreen extends StatelessWidget {
  String senderId, receiverId, urlSocketIO;

  AdminChatScreen(
      {required this.senderId,
      required this.receiverId,
      required this.urlSocketIO,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          leading: IconButton(
              icon: Container(
                width: 35, //MediaQuery.of(context).size.width * 0.09,
                height: 35, //MediaQuery.of(context).size.height * 0.09,
                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                child: SvgPicture.asset("assets/images/arrow-back.svg",
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn)),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: false,
          iconTheme: const IconThemeData(),
          actions: const [],
          title: SizedBox(
              width: (MediaQuery.of(context).size.width * 80 / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Live Chat",
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        // color: ColorConsts.whiteColor,
                        // fontWeight: FontWeight.w600,
                        fontSize: 19.0,
                      ))
                ],
              ))),
      body: AdminChatScreenBody(senderId, receiverId, urlSocketIO),
    );
  }
}

class AdminChatScreenBody extends StatefulWidget {
  String senderId, receiverId, urlSocketIO;

  /// receiver always partner id
  /// sender is login user

  AdminChatScreenBody(this.senderId, this.receiverId, this.urlSocketIO,
      {super.key});

  @override
  State<AdminChatScreenBody> createState() => _AdminChatScreenBodyState();
}

class _AdminChatScreenBodyState extends State<AdminChatScreenBody> {
  late TextEditingController _messageController;
  ScrollController _controller = new ScrollController();
  late IO.Socket socket;
  bool isLoading = true; //, isEdit = false;
  List<MessageData> msgData = [];
  late AdminChatData model;
  late MessageData currentObj;

  void _sendMessage(String message) {
    String messageText = message;
    _messageController.text = '';
    if (messageText != '') {
      var messagePost = {
        'chat': messageText,
        'sender': widget.senderId, // customer
        'sendBy': widget.receiverId, // current user
        'receiver': widget.receiverId,
        'room': widget.receiverId // partner
        // 'recipient': 'chat',
        // 'time': DateTime.now().toUtc().toString().substring(0, 16)
      };
      print(" =============== " + messagePost.toString());
      socket.emit('addNewMessage', messagePost);
    }
  }

/*  void editMessage(String message, String chatId, String msgId, String userId) {
    if (chatId.isNotEmpty && msgId.isNotEmpty && userId.isNotEmpty) {
      _messageController.text = message;
      isEdit = true;
      currentObj = MessageData(message, msgId, "", userId);
    } else {
      Dialogs.ErrorAlertInOut(context: context, message: "Try Again");
    }
  }

  void _editMessage(
      String message, String chatId, String msgId, String userId) {
    if (message != '') {
      var messagePost = {
        'message': message,
        'chatId': chatId,
        'msgId': msgId,
        'userId': userId,
        'room': widget.receiverId // partner
      };
      _messageController.text = '';
      print(" =============== " + messagePost.toString());
      socket.emit('updateMessage', messagePost);
    }
  }

  void _deleteMessage(String chatId, String msgId, String userId) {
    var messagePost = {
      'chatId': chatId,
      'msgId': msgId,
      'userId': userId,
      'room': widget.receiverId // partner
    };
    print(" =============== " + messagePost.toString());
    socket.emit('deleteMessage', messagePost);
  }
*/
  String partnerName = "";
  void getPartnerName() async {
    dynamic p = await Session().getPartnerLoginData();
    partnerName = p["name"];
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    initSocket();

    getPartnerName();

    //// FIREBASE EVENT /////////
    globals.analytics.logEvent(name: FireBaseEvent.OPEN_CHAT_SCREEN.name);
    ////////////////////////////
  }

  String convertToJson(String str) {
    str = str.toString().replaceAll('{', '{"');
    str = str.toString().replaceAll(': ', '": "');
    str = str.toString().replaceAll(', ', '", "');
    str = str.toString().replaceAll('}', '"}');
    return str;
  }

  Future<void> initSocket() async {
    print('---- Connecting to chat service');
    String registrationToken = "Here is FCM Token// in case of notification";
    socket = IO.io(widget.urlSocketIO, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    var messagePost = {
      "sender": widget.senderId,
      "receiver": widget.receiverId,
      "room": widget.receiverId
    };
    socket.connect();
    socket.onConnect((_) {
      print('------connected to websocket $_');
      socket.emit('join', widget.receiverId);
      socket.emit('currentHistory', messagePost);
    });

    socket.on('addNewMessage', (message) {
      print('------  connected to addNewMessage trigger $message\n');
      addToMainList(message);
    });

    socket.on('deleteMessage', (message) {
      socket.emit('currentHistory', messagePost);
    });
    socket.on('updateMessage', (message) {
      socket.emit('currentHistory', messagePost);
    });

    socket.on('currentHistory', (messages) {
      print("-------current History all chats $messages");

      var encodedString = jsonEncode(messages);
      print("encoded String os ${encodedString}");
      if (encodedString != null && encodedString != "null") {
        Map<String, dynamic> pars = json.decode(encodedString.toString());
        model = AdminChatData.fromJson(pars);
        if (model.sender.id == widget.senderId &&
            widget.receiverId == model.receiver.id) {
          msgData = model.chat.reversed.toList();
        }
      }
      isLoading = false;
      setState(() {});
    });

    // socket.on('usersList', (messages) {
    //   print("-------user list c $messages");
    // });
  }

  addToMainList(message) {
    try {
      var encodedString = jsonEncode(message);
      print("encoded String os ${encodedString}");

      // if (encodedString != null) {
      Map<String, dynamic> pars = json.decode(encodedString.toString());

      // List<dynamic> list = json.decode(encodedString);
      AdminChatFormatModel fact = AdminChatFormatModel.fromJson(pars);
      MessageData value = MessageData(
          fact.chatDetails.msg,
          fact.chatDetails.uid,
          DateTime.now().toUtc().toLocal().toString().substring(0, 16),
          fact.chatDetails.sendBy);

      //{"status":true,"message":"Data Created Successfully.","createdData":{"sender":{"id":"660656bbe1069a950a0f8e50"},
      // "receiver":{"id":"65f3f0654bb48253f5345be5","name":"testing parner"},"_id":"660658a9e1069a950a0f8fbd",
      // "chat":{"msg":"Cgggg","sendBy":"660656bbe1069a950a0f8e50","sendAt":"2024-03-29T08:52:31.836Z","_id":"6606814fcf3682bffdf6039a"}
      // ,"createdAt":"2024-03-29T05:59:05.508Z","updatedAt":"2024-03-29T08:52:31.837Z","__v":0}}
      print("fact.chatDetails.sender : ${fact.chatDetails.sender}");
      print("fact.chatDetails.receiver : ${fact.chatDetails.receiver}");
      print("widget.senderId : ${widget.senderId}");
      print("widget.receiverId : ${widget.receiverId}");

      if (fact.chatDetails.sender == (widget.senderId) &&
              fact.chatDetails.receiver == widget.receiverId ||
          fact.chatDetails.receiver == (widget.senderId) &&
              fact.chatDetails.sender == widget.receiverId) {
        msgData.insert((0), value);
      }

      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    socket.disconnect();
    socket.close();
    super.dispose();
  }

  Widget bottomBar() {
    return Container(
      height: 60,
      // color: const Color(0x24636365),
      margin: EdgeInsets.fromLTRB(4, 0, 4, 1),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              decoration: InputDecoration(
                hintText: "Type Your Message Here",
                hintMaxLines: 1,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                hintStyle: const TextStyle(fontSize: 16),
                // fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),
                  borderSide: const BorderSide(
                    // color: Colors.white,
                    width: 0.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      DashboardFontSize.customBorderRadius),
                  borderSide: const BorderSide(
                    // color: Colors.black26,
                    width: 0.2,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              icon: Container(
                width: 45, //MediaQuery.of(context).size.width * 0.12,
                height: 45, //MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.black,
                    // border: Border.all(color: AppTheme.borderColor!),
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius)),
                //90)),
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset("assets/images/send-icon.svg",
                    colorFilter:
                        ColorFilter.mode(Colors.white!, BlendMode.srcIn)),
              ),
              onPressed: () {
                if (_messageController.text.trim() != '') {
                  // FocusManager.instance.primaryFocus?.unfocus();
                  // if (isEdit) {
                  //   print(">>>>>>>>>>>> edit>>>>\n   " +
                  //       model.uid +
                  //       "  " +
                  //       currentObj.uid +
                  //       "  " +
                  //       currentObj.sendBy);
                  //   _editMessage(_messageController.text, model.uid,
                  //       currentObj.uid, currentObj.sendBy);
                  // } else {
                  _sendMessage(_messageController.text.trim());
                  // }
                } else {
                  print(">>>>>>>>>>>>Enter something");
                  Dialogs.ErrorAlertInOut(
                      context: context, message: "Enter Something First");
                  // Fluttertoast.showToast(
                  //     msg: "Enter something first.",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     fontSize: 16.0
                  // );
                }
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            (isLoading)
                ? AdminChatScreenShimmerView().chatShimmerView()
                //  Container(
                //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 55),
                //     alignment: Alignment.bottomCenter,
                //     child: Image.asset(
                //       AppAssets.progressImg,
                //       width: 99,
                //       height: 45,
                //     ))
                : (msgData.length < 1)
                    ? Container(
                        padding: const EdgeInsets.all(65),
                        alignment: Alignment.bottomCenter,
                        child: Text("Start Chat Now.."),
                      )
                    : Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 61),
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.vertical,
                          // shrinkWrap: true,
                          reverse: true,
                          cacheExtent: 1000,
                          itemCount: msgData.length,
                          itemBuilder: (BuildContext context, int index) {
                            var time =
                                DateTime.parse(msgData[index].sendAt).toLocal();
                            var fm = DateFormat('hh:mm a');
                            return Column(children: [
                              Align(
                                  alignment:
                                      (msgData[index].sendBy == widget.senderId)
                                          ? Alignment.topLeft
                                          : Alignment.topRight,
                                  child: Row(
                                      mainAxisAlignment:
                                          (msgData[index].sendBy !=
                                                  widget.senderId)
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              7, 6, 0, 1),
                                          child: Text(
                                              (msgData[index].sendBy ==
                                                      widget.receiverId)
                                                  ? partnerName //globals.partnerInfoModel.name! //model.receiver.name
                                                  : model.sender.name, //'You',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        /*  if (msgData[index].sendBy !=
                                            widget.senderId)
                                          PopupMenuButton(
                                            child: Container(
                                              padding: EdgeInsets.all(1),
                                              height: 30,
                                              width: 20,
                                              alignment: Alignment.center,
                                              child: Icon(
                                                // color: AppTheme.black.withOpacity(0.5),
                                                Icons.more_vert,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(0),
                                            //  icon: Icon(Icons.more_vert,size: 19,color: ColorConsts.grayColor),
                                            onSelected: (value) {
                                              (value.contains("/Edit"))
                                                  ? editMessage(
                                                      msgData[index].msg,
                                                      model.uid,
                                                      msgData[index].uid,
                                                      msgData[index].sendBy)
                                                  : _deleteMessage(
                                                      model.uid,
                                                      msgData[index].uid,
                                                      msgData[index].sendBy);
                                              // your logic
                                            },
                                            itemBuilder: (BuildContext bc) {
                                              return const [
                                                PopupMenuItem(
                                                  child: Text("Edit"),
                                                  value: '/Edit',
                                                ),
                                                PopupMenuItem(
                                                  child: Text("Delete"),
                                                  value: '/Delete',
                                                ),
                                              ];
                                            },
                                          )
                                          */
                                      ])),
                              BubbleSpecialOne(
                                text: msgData[index].msg,
                                color:
                                    (msgData[index].sendBy == widget.senderId)
                                        ? Colors.grey! //.withAlpha(30)
                                        : Colors.black!,
                                tail: true,
                                isSender: (msgData[index].sendBy ==
                                    widget.receiverId),
                                textStyle: TextStyle(
                                    color: (msgData[index].sendBy ==
                                            widget.senderId)
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16),
                              ),
                              Align(
                                  alignment:
                                      (msgData[index].sendBy == widget.senderId)
                                          ? Alignment.topLeft
                                          : Alignment.topRight,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 1, 16, 9),
                                    child: Text(fm.format(time),
                                        style: TextStyle(
                                          fontSize: 10,
                                          // color: AppTheme.black
                                        )),
                                  )),
                            ]);
                          },
                        )),
            Align(alignment: Alignment.bottomCenter, child: bottomBar())
          ],
        ));
  }
}
