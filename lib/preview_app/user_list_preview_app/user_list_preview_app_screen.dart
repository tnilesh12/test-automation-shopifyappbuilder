import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopifyappbuilder/preview_app/chat_preview_app/admin_chat_screen.dart';
import 'package:shopifyappbuilder/preview_app/user_list_preview_app/bloc/user_list_preview_app_event.dart';
import '/views/common_screens/api_failure.dart';
import 'bloc/user_list_preview_app_bloc.dart';
import 'bloc/user_list_preview_app_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserListPreviewAppScreen extends StatelessWidget {
  UserListPreviewAppScreen({super.key});
  final double defaultFontSize = 16;
  bool isLoading = false;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Chat"),
      ),
      body: BlocProvider(
        create: (context) => UserListPreviewAppBloc(),
        child: BlocListener<UserListPreviewAppBloc, UserListPreviewAppState>(
          listener: (context, state) {},
          child: BlocBuilder<UserListPreviewAppBloc, UserListPreviewAppState>(
            builder: (context, state) {
              dynamic customerList =
                  context.read<UserListPreviewAppBloc>().customerList;
              if (state is UserListPreviewAppLoadingState) {
                return Center(
                  child: Text("Loading"),
                ); // SmileIoDashboardScreenShimmerView();
              } else if (state is UserListPreviewAppAPIFailureState) {
                return APIFailureScreens(state.message, showButton: true);
              } else {
                if (customerList.length == 0) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/user.svg",
                            colorFilter:
                                ColorFilter.mode(Colors.black, BlendMode.srcIn),
                            height: 100,
                          ),
                          // ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("No User Found",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20
                                    // color: AppTheme.lightBorder
                                    )),
                          ),
                        ],
                      ));
                }
                return NotificationListener<ScrollEndNotification>(
                  onNotification:
                      (ScrollEndNotification scrollEndNotification) {
                    if (scrollEndNotification.metrics.pixels ==
                        scrollEndNotification.metrics.maxScrollExtent) {
                      if (isLoading == false) {
                        isLoading = true;
                        currentPage++;
                        context
                            .read<UserListPreviewAppBloc>()
                            .add(UserListOnScrollPreviewAppEvent(
                              currentPage,
                              0,
                            ));
                      }
                      return true;
                    }
                    return false;
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft,
                        0, DashboardFontSize.paddingRight, 0),
                    child: customerList!.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.only(top: 2),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: customerList!.length,
                              itemBuilder: (context, index) {
                                if (index == customerList.length - 1 &&
                                    context
                                        .read<UserListPreviewAppBloc>()
                                        .loadMore) {
                                  return Center(
                                      child: Container(
                                    width: 200,
                                    height: 50,
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      AppAssets.loadingImg,
                                    ),
                                  ));
                                } else {
                                  return Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          DashboardFontSize.customBorderRadius),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                          DashboardFontSize.customBorderRadius,
                                        )),
                                        elevation: DashboardFontSize
                                            .dashboardElevation,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context1) {
                                                print(
                                                    "---------${context.read<UserListPreviewAppBloc>().partnerId!}-------customer id---${customerList![index]!["id"]}---------");
                                                return AdminChatScreen(
                                                    receiverId: context
                                                        .read<
                                                            UserListPreviewAppBloc>()
                                                        .partnerId!,
                                                    senderId: customerList![
                                                        index]!["id"],
                                                    urlSocketIO:
                                                        ApiConst.chatUrl);
                                              },
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  width: 50,
                                                  height: 50,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    child: Image.asset(
                                                      AppAssets.placeholder,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                                customerList![
                                                                            index]![
                                                                        "firstName"] +
                                                                    " " +
                                                                    customerList![
                                                                            index]![
                                                                        "lastName"],
                                                                style: CustomTextTheme.getTextStyle(
                                                                        MyTextStyle
                                                                            .CommonThemeSubTitle,
                                                                        context)
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            15))),
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                                customerList![
                                                                        index]![
                                                                    "email"],
                                                                style: CustomTextTheme.getTextStyle(
                                                                        MyTextStyle
                                                                            .CommonThemeSubTitle,
                                                                        context)
                                                                    .copyWith(
                                                                        fontSize:
                                                                            13))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        : Container(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
