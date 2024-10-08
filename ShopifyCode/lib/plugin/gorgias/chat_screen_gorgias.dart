import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shopify_code/plugin/gorgias/bloc/chat_gorgias_state.dart';
import '../../language/language_manager.dart';
import '../../theme/app_theme.dart';
import '../../theme/dashboard_font_size.dart';
import '../../util/dialogs.dart';
import '../../views/chat/chat_shimmer_view.dart';
import 'bloc/chat_gorgias_bloc.dart';
import 'bloc/chat_gorgias_event.dart';

class ChatScreenGorgias extends StatefulWidget {
  bool showappbar;
  ChatScreenGorgias({this.showappbar = true});
  @override
  State<StatefulWidget> createState() {
    return ChatScreenStateGorgias();
  }
}

class ChatScreenStateGorgias extends State<ChatScreenGorgias> {
  late TextEditingController _messageController;
  ScrollController _controller = new ScrollController();
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  Widget chatScreenBody() {
    return BlocProvider<ChatGorgiasBloc>(
      create: (context) {
        ctx = context;
        return ChatGorgiasBloc();
      },
      child: BlocBuilder<ChatGorgiasBloc, ChatGorgiasState>(
        builder: (context, state) {
          if (state is LoadingChatState) {
            return ChatSCreenShimmerView().chatShimmerView();
          }
          if (state is ChatFailedState) {
            return Center(
                child: Text(
              "Something went wrong!\n" + state.msg,
              textAlign: TextAlign.center,
            ));
          }
          if (state is ChatSuccessState) {
            return Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    (state.msgData.length < 1)
                        ? Container(
                            padding: const EdgeInsets.all(65),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                                LanguageManager.translations()['startChat']),
                          )
                        : Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 61),
                            child: ListView.builder(
                              controller: _controller,
                              scrollDirection: Axis.vertical,
                              // shrinkWrap: true,
                              reverse: true,
                              cacheExtent: 1000,
                              itemCount: state.msgData.length,
                              itemBuilder: (BuildContext context, int index) {
                                var time = DateTime.parse(
                                        state.msgData[index].created_datetime)
                                    .toLocal();
                                var fm = DateFormat('hh:mm a');
                                return Column(children: [
                                  Align(
                                      alignment:
                                          (state.msgData[index].sender.id ==
                                                  context
                                                      .read<ChatGorgiasBloc>()
                                                      .customerId)
                                              ? Alignment.topLeft
                                              : Alignment.topRight,
                                      child: Row(
                                          mainAxisAlignment: (state
                                                      .msgData[index]
                                                      .sender
                                                      .id ==
                                                  context
                                                      .read<ChatGorgiasBloc>()
                                                      .customerId)
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      7, 6, 6, 1),
                                              child: Text(
                                                  (state.msgData[index].sender
                                                              .id ==
                                                          context
                                                              .read<
                                                                  ChatGorgiasBloc>()
                                                              .customerId)
                                                      ? "You"
                                                      : "Admin",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                          ])),
                                  BubbleSpecialOne(
                                    text: state.msgData[index].stripped_text,
                                    color: (state.msgData[index].sender.id ==
                                            context
                                                .read<ChatGorgiasBloc>()
                                                .customerId)
                                        ? AppTheme
                                            .secondaryButtonBackground! //.withAlpha(30)
                                        : AppTheme.primaryButtonBackground!,
                                    tail: true,
                                    isSender: (state.msgData[index].sender.id ==
                                        context
                                            .read<ChatGorgiasBloc>()
                                            .customerId),
                                    textStyle: TextStyle(
                                        color:
                                            (state.msgData[index].sender.id ==
                                                    context
                                                        .read<ChatGorgiasBloc>()
                                                        .customerId)
                                                ? AppTheme.secondaryButtonText
                                                : AppTheme.primaryButtonText,
                                        fontSize: 16),
                                  ),
                                  Align(
                                      alignment:
                                          (state.msgData[index].sender.id !=
                                                  context
                                                      .read<ChatGorgiasBloc>()
                                                      .customerId)
                                              ? Alignment.topLeft
                                              : Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 1, 16, 9),
                                        child: Text(fm.format(time),
                                            style: TextStyle(
                                              fontSize: 10,
                                              // color: AppTheme.black
                                            )),
                                      )),
                                ]);
                              },
                            )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: bottomBar(context))
                  ],
                ));
          }
          return Text("Not Found Any State yet");
        },
      ),
    );
  }

  void _sendMessage(String message) {
    //  context.read<ChatGorgiasBloc>().sendChatMsgAPI(message);
    BlocProvider.of<ChatGorgiasBloc>(ctx).add(MessageSentEvent(message));
  }

  Widget bottomBar(BuildContext context) {
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
                  FocusManager.instance.primaryFocus?.unfocus();
                  BlocProvider.of<ChatGorgiasBloc>(context)
                      .add(MessageSentEvent(_messageController.text.trim()));
                  _messageController.text = "";
                  //    _sendMessage(_messageController.text.trim());
                } else {
                  Dialogs.ErrorAlertInOut(
                      context: context,
                      message:
                          LanguageManager.translations()['enterSomething']);
                }
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showappbar) {
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
                    )
                  ],
                ))),
        body: chatScreenBody(),
      );
    } else {
      return chatScreenBody();
    }
  }
}
