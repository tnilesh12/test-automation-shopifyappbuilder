import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/smile_io_dashboard_screen.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/util/utils.dart';
import '../../utils/theme_size.dart';
import '/theme4/views/auth/login/login_screen.dart';
import '../../../common/bloc/profile_screen_bloc/profile_screen_bloc.dart';
import '/theme4/views/shimmer/profile_screen_shimmer_view.dart';
import '/theme4/views/webview_pages/webview_pages_screen.dart';
import '/theme4/views/widgets/common/custom_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/theme4/views/widgets/common/gap_widget.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' show Platform;

class ProfileScreen extends StatefulWidget {
  bool showappbar;
  ProfileScreen(this.showappbar, {super.key}) {}
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileScreenBloc>().Refresh();
  }

  @override
  Widget build(BuildContext context) {
    List<String> icon = [
      "assets/images/location-pin.svg",
      "assets/images/cart.svg",
      "assets/images/user.svg",
      "assets/images/lock_pass.svg",
      "assets/images/favorite-unchecked.svg",
      "assets/images/logout.svg",
    ];

    List<String> title = [
      "AddressList",
      "Order List",
      "MyProfile",
      "ChangePassword",
      "Favorites",
      "Logout"
    ];

    List<String> rout = [
      "/${Routes.addressListscreen}",
      "/${Routes.orderListScreen}",
      "/${Routes.myProfile}",
      "/${Routes.changePassScreen}",
      "/${Routes.favoriteListScreen}"
    ];

    // print(widget.showappbar);
    if (widget.showappbar) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Container(
                  width: MediaQuery.of(context).size.width * 0.09,
                  // height: MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                  child: SvgPicture.asset("assets/images/arrow-back.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!, BlendMode.srcIn)),
                ),
                onPressed: () {
                  context.pop();
                }),
            title: Text(""),
          ),
          body: ProfileScreenBody(context));
    } else {
      return ProfileScreenBody(context);
    }
  }

  Widget ProfileScreenBody(BuildContext context) {
    return BlocListener<ProfileScreenBloc, ProfileScreenState>(
      listener: (context, state) {
        if (state is ProfileScreenPrivacyPolicySuccessState) {
          //print("--------->"+state.privacyPolicy.body!);
          WebViewPagesScreen webViewPagesScreen = WebViewPagesScreen(
              titleMain: state.privacyPolicy.title!,
              urlToLoad: "", // state.privacyPolicy.url!,
              bodyTags: state.privacyPolicy.body!);

          context.push("/${Routes.webUrlScreen}", extra: webViewPagesScreen);
        }
        if (state is ProfileScreenReplaceReturnPolicySuccessState) {
          WebViewPagesScreen webViewPagesScreen = WebViewPagesScreen(
              titleMain: state.refundPolicy.title!,
              urlToLoad: "", //state.refundPolicy.url!,
              bodyTags: state.refundPolicy.body!);
          context.push("/${Routes.webUrlScreen}", extra: webViewPagesScreen);
        }
        if (state is ProfileScreenTermsOfServiceSuccessState) {
          WebViewPagesScreen webViewPagesScreen = WebViewPagesScreen(
              titleMain: state.termsOfService.title!,
              urlToLoad: "", //state.termsOfService.url!,
              bodyTags: state.termsOfService.body!);
          context.push("/${Routes.webUrlScreen}", extra: webViewPagesScreen);
        }
      },
      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is ProfileScreenLoadingState) {
            return ProfileScreenShimmerView();
          } else {
            return Container(
              height: double.maxFinite,
              // height: MediaQuery.of(context).size.height,
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      // width: double.infinity,
                      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      // decoration: BoxDecoration(
                      //   // col/or: const Color.fromARGB(255, 0, 0, 0),
                      //   // borderRadius: BorderRadius.circular(10),
                      // ),

                      child: SingleChildScrollView(
                        physics: RangeMaintainingScrollPhysics(),
                        child: Container(
                          // color: Colors.transparent,
                          child: Column(
                            children: [
                              Container(
                                  color: AppTheme.primaryColor,
                                  height: 150,
                                  child: Center(
                                    child: Text(
                                        LanguageManager.translations()[
                                            "Welcome"],
                                        style: CustomTextTheme.getTextStyle(
                                                MyTextStyle.CommonThemeTitle,
                                                context)
                                            .copyWith(
                                                color:
                                                    AppTheme.appBarTextColor)),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              context.read<ProfileScreenBloc>().isLogin == true
                                  ? Container(
                                      // padding: EdgeInsets.only(left: 30),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.53,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text(
                                              "General",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(
                                            //   left: 10,
                                            // ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.addressListscreen}",
                                                          extra: false);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/location-pin.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "AddressList"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.orderListScreen}");
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/cart.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "Order List"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(
                                            //   left: 10,
                                            // ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.myProfile}");
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/user.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "MyProfile"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.changePassScreen}");
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/lock_pass.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "ChangePassword"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            // padding: EdgeInsets.only(
                                            //   left: 10,
                                            // ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.favoriteListScreen}");
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/favorite-unchecked.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "Favorites"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      DialogAction action = await Dialogs
                                                          .customAbortDialog(
                                                              context,
                                                              LanguageManager
                                                                      .translations()[
                                                                  "areYouSureYouWantToLogout"],
                                                              "");
                                                      if (action ==
                                                          DialogAction.YES) {
                                                        await Session()
                                                            .setIsLogin(false);
                                                        await Session()
                                                            .setCartId("");
                                                        await Session()
                                                            .setAccessToken("");
                                                        //// FIREBASE EVENT /////////
                                                        globals.analytics.logEvent(
                                                            name: FireBaseEvent
                                                                .CLICK_LOGOUT
                                                                .name);
                                                        ////////////////////////////
                                                        await (context.pushNamed(
                                                            Routes.loginScreen,
                                                            pathParameters: {
                                                              "goBack": true
                                                                  .toString()
                                                            }));
                                                        context.pushReplacement(
                                                            "/${Routes.dashboardScreen}");
                                                      }
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/logout.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "Logout"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      // padding: EdgeInsets.only(left: 30),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text(
                                              "General",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      bool? refresh =
                                                          await (context.pushNamed(
                                                              "${Routes.loginScreen}",
                                                              pathParameters: {
                                                                "goBack": true
                                                                    .toString()
                                                              },
                                                              extra:
                                                                  null)) as bool;
                                                      if (refresh != null) {
                                                        if (refresh as bool) {
                                                          context
                                                              .read<
                                                                  ProfileScreenBloc>()
                                                              .loadData();
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/login.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "Login"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  // InkWell(
                                                  //   onTap: () async {},
                                                  //   child: Container(
                                                  //     height:
                                                  //         MediaQuery.of(context)
                                                  //                 .size
                                                  //                 .height *
                                                  //             0.15,
                                                  //     width:
                                                  //         MediaQuery.of(context)
                                                  //                 .size
                                                  //                 .height *
                                                  //             0.15,
                                                  //     padding:
                                                  //         const EdgeInsets.all(
                                                  //             4.0),
                                                  //     decoration: BoxDecoration(
                                                  //       color: AppTheme
                                                  //           .primaryColor
                                                  //           ?.withOpacity(0),
                                                  //       borderRadius:
                                                  //           BorderRadius.circular(
                                                  //               DashboardFontSize
                                                  //                   .iconWithTextBorderRadius),
                                                  //     ),
                                                  //     child: Column(
                                                  //       mainAxisAlignment:
                                                  //           MainAxisAlignment
                                                  //               .center,
                                                  //       crossAxisAlignment:
                                                  //           CrossAxisAlignment
                                                  //               .center,
                                                  //       children: [
                                                  //         // Container(
                                                  //         //   height: 35,
                                                  //         //   width: 35,
                                                  //         //   child: SvgPicture
                                                  //         //       .asset(
                                                  //         //     "",
                                                  //         //     // colorFilter: ColorFilter.mode(Colors.black),
                                                  //         //   ),
                                                  //         // ),
                                                  //         SizedBox(height: 8.0),
                                                  //         Text(
                                                  //           "",
                                                  //           textAlign: TextAlign
                                                  //               .center,
                                                  //           style: TextStyle(
                                                  //             color:
                                                  //                 Colors.black,
                                                  //             fontSize:
                                                  //                 DashboardFontSize
                                                  //                     .descFontSize,
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                              GapWidget(size: -5),
                              Container(
                                // padding: EdgeInsets.only(left: 30),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 50,
                                      ),
                                      child: Text(
                                        "Notification",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(
                                      //   left: 10,
                                      // ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                context.push(
                                                    "/${Routes.notificationscreen}");
                                                //// FIREBASE EVENT /////////
                                                globals.analytics.logEvent(
                                                    name: FireBaseEvent
                                                        .CLICK_NOTIFCATION
                                                        .name);
                                                ////////////////////////////
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor
                                                      ?.withOpacity(0.7),
                                                  borderRadius: BorderRadius
                                                      .circular(DashboardFontSize
                                                          .iconWithTextBorderRadius),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      child: SvgPicture.asset(
                                                        "assets/images/notification.svg",
                                                        // colorFilter: ColorFilter.mode(Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      LanguageManager
                                                              .translations()[
                                                          "Notification"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .descFontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // InkWell(
                                            //   onTap: () async {},
                                            //   child: Container(
                                            //     height: MediaQuery.of(context)
                                            //             .size
                                            //             .height *
                                            //         0.15,
                                            //     width: MediaQuery.of(context)
                                            //             .size
                                            //             .height *
                                            //         0.15,
                                            //     padding:
                                            //         const EdgeInsets.all(4.0),
                                            //     decoration: BoxDecoration(
                                            //       color: AppTheme.primaryColor
                                            //           ?.withOpacity(0),
                                            //       borderRadius: BorderRadius
                                            //           .circular(DashboardFontSize
                                            //               .iconWithTextBorderRadius),
                                            //     ),
                                            //     child: Column(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.center,
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.center,
                                            //       children: [
                                            //         // Container(
                                            //         //   height: 35,
                                            //         //   width: 35,
                                            //         //   child: SvgPicture
                                            //         //       .asset(
                                            //         //     "",
                                            //         //     // colorFilter: ColorFilter.mode(Colors.black),
                                            //         //   ),
                                            //         // ),
                                            //         SizedBox(height: 8.0),
                                            //         Text(
                                            //           "",
                                            //           textAlign:
                                            //               TextAlign.center,
                                            //           style: TextStyle(
                                            //             color: Colors.black,
                                            //             fontSize:
                                            //                 DashboardFontSize
                                            //                     .descFontSize,
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              GapWidget(size: -5),
                              Container(
                                // padding: EdgeInsets.only(left: 30),
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 50,
                                      ),
                                      child: Text(
                                        "Others",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(
                                      //   left: 10,
                                      // ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context.push(
                                                    "/${Routes.settingsScreen}");
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor
                                                      ?.withOpacity(0.7),
                                                  borderRadius: BorderRadius
                                                      .circular(DashboardFontSize
                                                          .iconWithTextBorderRadius),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      child: SvgPicture.asset(
                                                        "assets/images/setting.svg",
                                                        // colorFilter: ColorFilter.mode(Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      LanguageManager
                                                              .translations()[
                                                          "Settings"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .descFontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                context.push(
                                                    "/${Routes.contactUsScreen}");
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor
                                                      ?.withOpacity(0.7),
                                                  borderRadius: BorderRadius
                                                      .circular(DashboardFontSize
                                                          .iconWithTextBorderRadius),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      child: SvgPicture.asset(
                                                        "assets/images/contact-us.svg",
                                                        // colorFilter: ColorFilter.mode(Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      LanguageManager
                                                              .translations()[
                                                          "ContactUs"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .descFontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(
                                      //   left: 10,
                                      // ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context
                                                    .read<ProfileScreenBloc>()
                                                    .add(
                                                        TermsOfServiceDataLoadEvent());
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor
                                                      ?.withOpacity(0.7),
                                                  borderRadius: BorderRadius
                                                      .circular(DashboardFontSize
                                                          .iconWithTextBorderRadius),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      child: SvgPicture.asset(
                                                        "assets/images/terms-of-service.svg",
                                                        // colorFilter: ColorFilter.mode(Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      LanguageManager
                                                              .translations()[
                                                          "Termsofservice"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            DashboardFontSize
                                                                .descFontSize,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            context
                                                            .read<
                                                                ProfileScreenBloc>()
                                                            .privacyPolicy ==
                                                        null ||
                                                    context
                                                            .read<
                                                                ProfileScreenBloc>()
                                                            .privacyPolicy!
                                                            .body ==
                                                        "<!---->"
                                                ? SizedBox(width: 20)
                                                : InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              ProfileScreenBloc>()
                                                          .add(
                                                              PrivacyPolicyDataLoadEvent());
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/privacy-policy.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "PrivacyPolicy"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(
                                      //   left: 10,
                                      // ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Divider(
                                              height: 1,
                                            ),
                                            context
                                                            .read<
                                                                ProfileScreenBloc>()
                                                            .refundPolicy ==
                                                        null ||
                                                    context
                                                            .read<
                                                                ProfileScreenBloc>()
                                                            .refundPolicy!
                                                            .body ==
                                                        "<!---->"
                                                ? Container()
                                                : InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              ProfileScreenBloc>()
                                                          .add(
                                                              ReplaceReturnPolicyDataLoadEvent());
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/replace-return-policy.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "ReplaceReturnPolicy"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            context
                                                            .read<
                                                                ProfileScreenBloc>()
                                                            .isLogin ==
                                                        true ||
                                                    globals.plugins.containsKey(
                                                        PluginsEnum
                                                            .SMILEIO.name)
                                                ? InkWell(
                                                    onTap: () async {
                                                      ShopifyUser? user =
                                                          await Session()
                                                              .getLoginData();
                                                      SmileIoDashboardScreen
                                                          smileIoDashboardScreen =
                                                          SmileIoDashboardScreen(
                                                              true,
                                                              email:
                                                                  user!.email!);
                                                      context.push(
                                                          "/${Routes.smileIoDashboardScreen}",
                                                          extra:
                                                              smileIoDashboardScreen);
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/gift.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            "Refer & Earn",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              // GapWidget(size: -5),
                              context.read<ProfileScreenBloc>().isLogin == true
                                  ? Container(
                                      // padding: EdgeInsets.only(left: 30),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // padding: EdgeInsets.only(
                                            //   left: 10,
                                            // ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  globals.plugins.containsKey(
                                                          PluginsEnum
                                                              .SMILEIO.name)
                                                      ? Divider(
                                                          height: 1,
                                                        )
                                                      : Container(),
                                                  InkWell(
                                                    onTap: () {
                                                      context.push(
                                                          "/${Routes.accountDeletionRequestScreen}");
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .primaryColor
                                                            ?.withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                DashboardFontSize
                                                                    .iconWithTextBorderRadius),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            child: SvgPicture
                                                                .asset(
                                                              "assets/images/delete.svg",
                                                              // colorFilter: ColorFilter.mode(Colors.black),
                                                            ),
                                                          ),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            LanguageManager
                                                                    .translations()[
                                                                "accountDeletionRequest"],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  DashboardFontSize
                                                                      .descFontSize,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                        "Version : ${context.read<ProfileScreenBloc>().version}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.normal,
                                            )),
                                  )),
                            ],
                          ),
                        ),
                      )),
                  // // Account container
                  // _buildContainer('Account', Icons.account_circle, () {
                  //   // Handle onTap
                  // }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
