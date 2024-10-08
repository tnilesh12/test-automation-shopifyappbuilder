import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/views/chat/chat_shimmer_view.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';
import 'chat_format_model.dart';
import 'chat_model.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  String senderId, receiverId, urlSocketIO;

  /// receiver always partner id
  /// sender is login user

  ChatScreen(this.senderId, this.receiverId, this.urlSocketIO, {super.key});

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
                    colorFilter: ColorFilter.mode(
                        AppTheme.appBarTextColor!, BlendMode.srcIn)),
              ),
              onPressed: () {
                context.pop();
              }),
          centerTitle: false,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios,
          //       color: ColorConsts.whiteColor, size: 24),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   }
          // ),
          iconTheme: const IconThemeData(),
          actions: const [],
          title: SizedBox(
              width: (MediaQuery.of(context).size.width * 80 / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LanguageManager.translations()['chat'],
                    maxLines: 2,
                    // style: TextStyle(
                    //     overflow: TextOverflow.ellipsis,
                    //     // color: ColorConsts.whiteColor,
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 19.0,
                    //     fontFamily: 'DMSans')
                  )
                ],
              ))),
      body: ChatScreenBody(senderId, receiverId, urlSocketIO),
    );
  }
}

class ChatScreenBody extends StatefulWidget {
  String senderId, receiverId, urlSocketIO;

  /// receiver always partner id
  /// sender is login user

  ChatScreenBody(this.senderId, this.receiverId, this.urlSocketIO, {super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  late TextEditingController _messageController;
  ScrollController _controller = new ScrollController();
  late IO.Socket socket;
  bool isLoading = true; //, isEdit = false;
  List<MessageData> msgData = [];
  late ChatData model;
  late MessageData currentObj;

  void _sendMessage(String message) {
    String messageText = message;
    _messageController.text = '';
    if (messageText != '') {
      var messagePost = {
        'chat': messageText,
        'sender': widget.senderId, // customer
        'sendBy': widget.senderId, // current user
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
  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    initSocket();

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
        model = ChatData.fromJson(pars);
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
      ChatFormatModel fact = ChatFormatModel.fromJson(pars);
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
              style: TextStyle(color: AppTheme.editTextControllerTextColor),
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              decoration: InputDecoration(
                hintText: LanguageManager.translations()['typeMessage'],
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
                    color: AppTheme.primaryButtonBackground,
                    // border: Border.all(color: AppTheme.borderColor!),
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius)),
                //90)),
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset("assets/images/send-icon.svg",
                    colorFilter: ColorFilter.mode(
                        AppTheme.primaryButtonText!, BlendMode.srcIn)),
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
                      context: context,
                      message:
                          LanguageManager.translations()['enterSomething']);
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
                ? ChatSCreenShimmerView().chatShimmerView()
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
                        child:
                            Text(LanguageManager.translations()['startChat']),
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
                                  alignment: (msgData[index].sendBy ==
                                          widget.receiverId)
                                      ? Alignment.topLeft
                                      : Alignment.topRight,
                                  child: Row(
                                      mainAxisAlignment:
                                          (msgData[index].sendBy !=
                                                  widget.receiverId)
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              7, 6, 0, 1),
                                          child: Text(
                                              (msgData[index].sendBy ==
                                                      widget.receiverId)
                                                  ? model.receiver.name
                                                  : 'You',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  // color: (msgData[index].sendBy == widget.receiverId)
                                                  //     ?AppTheme.black:AppTheme.black.withOpacity(0.5),
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        /*  if (msgData[index].sendBy !=
                                            widget.receiverId)
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
                                color: (msgData[index].sendBy ==
                                        widget.receiverId)
                                    ? AppTheme
                                        .secondaryButtonBackground! //.withAlpha(30)
                                    : AppTheme.primaryButtonBackground!,
                                tail: true,
                                isSender:
                                    (msgData[index].sendBy == widget.senderId),
                                textStyle: TextStyle(
                                    color: (msgData[index].sendBy ==
                                            widget.receiverId)
                                        ? AppTheme.secondaryButtonText
                                        : AppTheme.primaryButtonText,
                                    fontSize: 16),
                              ),
                              Align(
                                  alignment: (msgData[index].sendBy ==
                                          widget.receiverId)
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
