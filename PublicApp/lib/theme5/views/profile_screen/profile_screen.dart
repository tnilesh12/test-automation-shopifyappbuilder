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
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/setting_enum.dart';
import '../../utils/theme_size.dart';
import '/theme5/views/auth/login/login_screen.dart';
import '../../../common/bloc/profile_screen_bloc/profile_screen_bloc.dart';
import '/theme5/views/shimmer/profile_screen_shimmer_view.dart';
import '/theme5/views/webview_pages/webview_pages_screen.dart';
import '/theme5/views/widgets/common/custom_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/theme5/views/widgets/common/gap_widget.dart';
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
                    height: MediaQuery.of(context).size.height * .1,
                    // height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppTheme.primaryColor!),
                    // child: Center(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         padding: const EdgeInsets.only(
                    //             top: 30, left: 10, right: 10, bottom: 30),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ),

                  Container(
                      height: MediaQuery.of(context).size.height,
                      // width: double.infinity,
                      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      child: SingleChildScrollView(
                        physics: RangeMaintainingScrollPhysics(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            // color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    // height: 220,
                                    child: Center(
                                      child: Text(
                                          LanguageManager.translations()[
                                              "Welcome"],
                                          style: CustomTextTheme.getTextStyle(
                                                  MyTextStyle.CommonThemeTitle,
                                                  context)
                                              .copyWith(
                                                  color:
                                                      AppTheme.appBarTextColor,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  alignment: Alignment.centerLeft,
                                  child: Text("General",
                                      textAlign: TextAlign.start,
                                      style: CustomTextTheme.getTextStyle(
                                              MyTextStyle.CommonThemeSubTitle,
                                              context)
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                                context.read<ProfileScreenBloc>().isLogin ==
                                        true
                                    ? Container(
                                        child: Container(
                                          // height: 120,
                                          child: Column(
                                            children: [
                                              CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius),
                                                        topRight: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius))),
                                                text: LanguageManager
                                                        .translations()[
                                                    "AddressList"],
                                                leadingIcon:
                                                    "assets/images/location-pin.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.addressListscreen}",
                                                      extra: false);
                                                },
                                              ),
                                              CustomListTile(
                                                text: LanguageManager
                                                        .translations()[
                                                    "Order List"],
                                                // text: "OrderList",
                                                leadingIcon:
                                                    "assets/images/cart.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.orderListScreen}");
                                                },
                                              ),
                                              CustomListTile(
                                                text: LanguageManager
                                                        .translations()[
                                                    "MyProfile"],
                                                leadingIcon:
                                                    "assets/images/user.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.myProfile}");
                                                },
                                              ),
                                              CustomListTile(
                                                text: LanguageManager
                                                        .translations()[
                                                    "ChangePassword"],
                                                leadingIcon:
                                                    "assets/images/lock_pass.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.changePassScreen}");
                                                },
                                              ),
                                              CustomListTile(
                                                text: LanguageManager
                                                        .translations()[
                                                    "Favorites"],
                                                leadingIcon:
                                                    "assets/images/favorite-unchecked.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.favoriteListScreen}");
                                                },
                                              ),
                                              CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius),
                                                        bottomLeft: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius))),
                                                text: LanguageManager
                                                    .translations()["Logout"],
                                                leadingIcon:
                                                    "assets/images/logout.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () async {
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
                                                            .CLICK_LOGOUT.name);
                                                    ////////////////////////////
                                                    await (context.pushNamed(
                                                        Routes.loginScreen,
                                                        pathParameters: {
                                                          "goBack":
                                                              true.toString()
                                                        }));
                                                    context.pushReplacement(
                                                        "/${Routes.dashboardScreen}");
                                                  }
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        // shape: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.all(
                                        //   Radius.circular(
                                        //       ThemeSize.themeBorderRadius),
                                        // )),
                                        // elevation: ThemeSize.themeElevation,
                                        // color: Colors.grey[200],
                                        child: Container(
                                            // height: 230,
                                            child: Column(children: [
                                        CustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius),
                                                  topLeft: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius),
                                                  topRight: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius),
                                                  bottomLeft: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius))),
                                          text: LanguageManager.translations()[
                                              "Login"],
                                          leadingIcon:
                                              "assets/images/login.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () async {
                                            bool? refresh =
                                                await (context.pushNamed(
                                                    "${Routes.loginScreen}",
                                                    pathParameters: {
                                                      "goBack": true.toString()
                                                    },
                                                    extra: null)) as bool;
                                            if (refresh != null) {
                                              if (refresh as bool) {
                                                context
                                                    .read<ProfileScreenBloc>()
                                                    .loadData();
                                              }
                                            }
                                          },
                                        )
                                      ]))),
                                GapWidget(size: -5),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Notification",
                                        textAlign: TextAlign.start,
                                        style: CustomTextTheme.getTextStyle(
                                                MyTextStyle.CommonThemeSubTitle,
                                                context)
                                            .copyWith(
                                                fontWeight: FontWeight.bold))),
                                Container(
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.all(
                                  //   Radius.circular(
                                  //       ThemeSize.themeBorderRadius),
                                  // )),
                                  // elevation: ThemeSize.themeElevation,
                                  // color: Colors.grey[200],
                                  child: Container(
                                    // height: 230,
                                    child: Column(
                                      children: [
                                        CustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius),
                                                  topRight: Radius.circular(
                                                      ThemeSize
                                                          .themeBorderRadius))),
                                          text: LanguageManager.translations()[
                                              "Notification"],
                                          leadingIcon:
                                              "assets/images/notification.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            context.push(
                                                "/${Routes.notificationscreen}");
                                            //// FIREBASE EVENT /////////
                                            globals.analytics.logEvent(
                                                name: FireBaseEvent
                                                    .CLICK_NOTIFCATION.name);
                                            ////////////////////////////
                                          },
                                        ),
                                        // CustomListTile(
                                        //   borderShape: RoundedRectangleBorder(
                                        //       borderRadius: const BorderRadius
                                        //           .all(
                                        //           Radius.circular(ThemeSize
                                        //               .themeBorderRadius))),
                                        //   text: LanguageManager
                                        //       .translations()["MultiStore"],
                                        //   leadingIcon:
                                        //       "assets/images/store.svg",
                                        //   trailingIcon:
                                        //       "assets/images/arrow-forward.svg",
                                        //   onPressed: () {
                                        //     context.push(
                                        //         "/${Routes.multiStoreScreen}");
                                        //   },
                                        // ),
                                        globals.Settings.containsKey(
                                                SettingsEnum.Localization.name)
                                            ? CustomListTile(
                                                text: LanguageManager
                                                    .translations()["Settings"],
                                                leadingIcon:
                                                    "assets/images/setting.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.settingsScreen}");
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSelect()));
                                                },
                                              )
                                            : Container(),
                                        context
                                                    .read<ProfileScreenBloc>()
                                                    .apkShareUrl !=
                                                null
                                            ? CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius),
                                                        bottomLeft: Radius
                                                            .circular(ThemeSize
                                                                .themeBorderRadius))),
                                                text: LanguageManager
                                                    .translations()["Share"],
                                                leadingIcon:
                                                    "assets/images/share.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  Share.share(
                                                      "Hi ! Check this App for Amazing Offer!\n" +
                                                          "${context.read<ProfileScreenBloc>().apkShareUrl}");
                                                },
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                ),
                                GapWidget(size: -5),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  alignment: Alignment.centerLeft,
                                  child: Text("Other",
                                      textAlign: TextAlign.start,
                                      style: CustomTextTheme.getTextStyle(
                                              MyTextStyle.CommonThemeSubTitle,
                                              context)
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.all(
                                  //   Radius.circular(
                                  //       ThemeSize.themeBorderRadius),
                                  // )),
                                  // elevation: ThemeSize.themeElevation,
                                  // color: Colors.grey[200],
                                  child: Container(
                                    // height: 120,
                                    child: Column(
                                      children: [
                                        CustomListTile(
                                          borderShape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(ThemeSize
                                                      .themeBorderRadius))),
                                          text: LanguageManager.translations()[
                                              "ContactUs"],
                                          leadingIcon:
                                              "assets/images/contact-us.svg",
                                          trailingIcon:
                                              "assets/images/arrow-forward.svg",
                                          onPressed: () {
                                            context.push(
                                                "/${Routes.contactUsScreen}");
                                          },
                                        ),
                                        context
                                                        .read<
                                                            ProfileScreenBloc>()
                                                        .termsOfService ==
                                                    null ||
                                                context
                                                        .read<
                                                            ProfileScreenBloc>()
                                                        .termsOfService!
                                                        .body ==
                                                    "<!---->"
                                            ? Container()
                                            : CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(ThemeSize
                                                            .themeBorderRadius))),
                                                text: LanguageManager
                                                        .translations()[
                                                    "Termsofservice"],
                                                leadingIcon:
                                                    "assets/images/terms-of-service.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context
                                                      .read<ProfileScreenBloc>()
                                                      .add(
                                                          TermsOfServiceDataLoadEvent());
                                                },
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
                                            ? SizedBox()
                                            : CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(ThemeSize
                                                            .themeBorderRadius))),
                                                text: LanguageManager
                                                        .translations()[
                                                    "PrivacyPolicy"],
                                                leadingIcon:
                                                    "assets/images/privacy-policy.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context
                                                      .read<ProfileScreenBloc>()
                                                      .add(
                                                          PrivacyPolicyDataLoadEvent());
                                                },
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
                                            : CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(ThemeSize
                                                            .themeBorderRadius))),
                                                text: LanguageManager
                                                        .translations()[
                                                    "ReplaceReturnPolicy"],
                                                leadingIcon:
                                                    "assets/images/replace-return-policy.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context
                                                      .read<ProfileScreenBloc>()
                                                      .add(
                                                          ReplaceReturnPolicyDataLoadEvent());
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                context.read<ProfileScreenBloc>().isLogin ==
                                        true
                                    ? Container(
                                        // shape: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.all(
                                        //   Radius.circular(
                                        //       ThemeSize.themeBorderRadius),
                                        // )),
                                        // elevation: ThemeSize.themeElevation,
                                        // color: Colors.grey[200],
                                        child: Container(
                                          // height: 120,
                                          child: Column(
                                            children: [
                                              globals.plugins.containsKey(
                                                      PluginsEnum.SMILEIO.name)
                                                  ? CustomListTile(
                                                      borderShape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      ThemeSize
                                                                          .themeBorderRadius))),
                                                      text: "Refer & Earn",
                                                      leadingIcon:
                                                          "assets/images/gift.svg",
                                                      trailingIcon:
                                                          "assets/images/arrow-forward.svg",
                                                      onPressed: () async {
                                                        ShopifyUser? user =
                                                            await Session()
                                                                .getLoginData();
                                                        SmileIoDashboardScreen
                                                            smileIoDashboardScreen =
                                                            SmileIoDashboardScreen(
                                                                true,
                                                                email: user!
                                                                    .email!);
                                                        context.push(
                                                            "/${Routes.smileIoDashboardScreen}",
                                                            extra:
                                                                smileIoDashboardScreen);
                                                      },
                                                    )
                                                  : Container(),
                                              CustomListTile(
                                                borderShape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(ThemeSize
                                                            .themeBorderRadius))),
                                                text: LanguageManager
                                                        .translations()[
                                                    "accountDeletionRequest"],
                                                leadingIcon:
                                                    "assets/images/delete.svg",
                                                trailingIcon:
                                                    "assets/images/arrow-forward.svg",
                                                onPressed: () {
                                                  context.push(
                                                      "/${Routes.accountDeletionRequestScreen}");
                                                },
                                              ),
                                            ],
                                          ),
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
