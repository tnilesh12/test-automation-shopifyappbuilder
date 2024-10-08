import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publicapp/common/bloc/product_list_bloc/new_filter_list.dart';
import 'package:publicapp/theme5/views/dashboard_screen/email_subscription/email_subscription_bottom_sheet.dart';
import 'package:publicapp/theme5/views/dashboard_screen/custom_page_screen.dart';
import 'package:publicapp/route/theme5.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/modelClass/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/sort_key_product_collection.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/gorgias/chat_screen_gorgias.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';

import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz.dart';
import 'package:shopify_code/plugin/shopify_inbox/shopify_inbox_web_screen.dart';
import 'package:shopify_code/plugin/zendesk/chat_screen_zendesk.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/firebase_cloud_message_util.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/chat/chat_screen.dart';
import '/route/go_routes.dart';
import '/theme5/views/auth/login/login_screen.dart';
import '../blog/blog_list_screen.dart';
import '/theme5/views/cart_screen/cart_screen.dart';
import '/theme5/views/category/category_from_menu/category_screen_from_menu.dart';
import '/theme5/views/category/category_screen_from_collection.dart';
import '/theme5/views/dashboard_screen/bloc/dashboard_screen_bloc.dart';
import '/theme5/views/favorite/favorite_list_screen.dart';
import '/theme5/views/home_screen/home_screen.dart';
import '/theme5/views/pages/pages_view_screen.dart';
import '/theme5/views/product_details_screen/product_details_screen.dart';
import '/theme5/views/product_list/Sort_Bottom_ListView.dart';
import '/theme5/views/product_list/product_list_screen.dart';
import '/theme5/views/profile_screen/contact_us/contact_us_screen.dart';
import '/theme5/views/profile_screen/notification/notification_screen.dart';
import '/theme5/views/search/boost_ai_search/boost_ai_search_screen.dart';
import '/theme5/views/search/search_screen.dart';
import '/theme5/views/webview_pages/webview_pages_screen.dart';
import '/theme5/views/widgets/no_data_view.dart';
import '/theme5/views/profile_screen/profile_screen.dart';
import '../widgets/bottom_navigation/bottom_bar_widget.dart';
import '/theme5/views/widgets/drawer/drawer_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '../../../common/bloc/cart_count_bloc/cart_state.dart';
import 'package:shopify_code/globels.dart' as globals;

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // String condition = "both";
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int selectedIndex1 = -1, subSelectedIndex1 = -1, nestedSelectedIndex1 = -1;
  BottomNavigationData selectedBottomNavData =
  BottomNavigationData(action: Routes.homeScreen);
  int currentBottomBarIndex=0;

  // String selectedBottonNav = "${Routes.homeScreen}"; //bottomNavItems.first;

  Future<void> updateSelectedBtmNav(BottomNavigationData bottomNavData, int selectedIndex) async {
    // if (selectedBottonNav != tabItem) {
    //   setState(() {
    //     selectedBottonNav = tabItem;
    //   });
    // }
    // if (selectedBottomNavData != bottomNavData) {
    if (currentBottomBarIndex != selectedIndex) {
      if (bottomNavData.action == Routes.chatScreen ||
          bottomNavData.action == Routes.chatScreenShopifyInbox ||
          bottomNavData.action == Routes.chatScreenZendesk ||
          bottomNavData.action == Routes.chatScreenGorgias) {
        isLogin = await Session().IsLogin();
        if (isLogin) {
          setState(() {
            selectedBottomNavData = bottomNavData;
            currentBottomBarIndex = selectedIndex;
          });
        } else {
          bool? refresh = await (context.pushNamed("${Routes.loginScreen}",
              pathParameters: {"goBack": true.toString()},
              extra: null)) as bool;
          if (refresh != null) {
            if (refresh as bool) {
              setState(() {
                selectedBottomNavData = bottomNavData;
                currentBottomBarIndex = selectedIndex;
              });
            }
          }
        }
      } else {
        setState(() {
          selectedBottomNavData = bottomNavData;
          currentBottomBarIndex = selectedIndex;
        });
      }
    }
  }

  // late AnimationController _animationController;
  // // late Animation<double> scalAnimation;
  // late Animation<double> animation;
  // late BottomBarItems selectedBottonNav;
  // void updateSelectedBtmNav(BottomBarItems menu) {
  //   if (selectedBottonNav != menu) {
  //     setState(() {
  //       selectedBottonNav = menu;
  //       print("setState bottom nav item pressed $menu");
  //     });
  //   }
  // }
  // @override
  // void initState() {
  //   _animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 200))
  //     ..addListener(
  //       () {
  //         setState(() {});
  //       },
  //     );
  //   animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
  //       parent: _animationController, curve: Curves.fastOutSlowIn));
  //   super.initState();
  // }
// /*

/*
  static PageRoutes(BuildContext context, NotificationModel message) {
    print("-------------pageRoutes() message--------${message.toJson()}");
    if (message.route! == "/${Routes.homeScreen}") {
      context.push("/${Routes.dashboardScreen}");
    } else if (message.route! == "/${Routes.productDetailsScreen}") {
      context.push("/${Routes.productDetailsScreen}");
    } else if (message.route! == "/${Routes.cartScreen}") {
      context.push("/${Routes.cartScreen}");
    } else if (message.route! == "/${Routes.favoriteListScreen}") {
      context.push("/${Routes.favoriteListScreen}");
    } else if (message.route! == "/${Routes.blogPostScreen}") {
      context.push("/${Routes.blogPostScreen}");
    } else if (message.route! == "/${Routes.pageViewScreen}") {
      context.push("/${Routes.pageViewScreen}");
    } else if (message.route! == "/${Routes.productListScreen}") {
      context.push("/${Routes.productListScreen}");
    } else if (message.route! == "/${Routes.categoryScreen}") {
      context.push("/${Routes.categoryScreen}", extra: true);
    } else if (message.route! == "/${Routes.searchScreen}") {
      context.push("/${Routes.searchScreen}");
    } else if (message.route! == "/${Routes.profileScreen}") {
      context.push("/${Routes.profileScreen}");
    } else if (message.route! == "/${Routes.contactUsScreen}") {
      context.push("/${Routes.contactUsScreen}");
    } else if (message.route! == "/${Routes.notificationscreen}") {
      context.push("/${Routes.notificationscreen}");
    } else {
      print("---------------PageRoutes else condition");
      showDialog<void>(
          context: context,
          // barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    message.image != null
                        ? Container(
                            height: 200,
                            child: WidgetImage(message.image!),
                          )
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    message.title != ""
                        ? Text(
                            message.title!,
                            style: TextStyle(
                                color: AppTheme.appBarTextColor,
                                fontWeight: FontWeight.bold),
                          )
                        : Container(),
                    SizedBox(
                      height: 4,
                    ),
                    message.body != ""
                        ? Text(
                            message.body!,
                            style: TextStyle(
                                color: AppTheme.appBarTextColor,
                                fontWeight: FontWeight.normal),
                          )
                        : Container(),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(LanguageManager.translations()["Cancel"]),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            );
          });
    }
  }
  */

  bool isLogin = false;

  void checkLogin() async {
    isLogin = await Session().IsLogin();
    setState(() {});
  }

  void showEmailSubscription() async {
    bool isEmailSubmitted = await Session().isEmailSubmitted();
    bool isEmailNotificationDisabled =
        await Session().isEmailNotificationDisabled();
    if (!isEmailSubmitted &&
        !isEmailNotificationDisabled &&
        (globals.plugins
                .containsKey(PluginsEnum.MAILCHIMP_SUBSCRIPTION_FORMS.name) ||
            globals.plugins
                .containsKey(PluginsEnum.KELAVIO_SUBSCRIPTION_FORMS.name))) {
      String pluginName;

      if (globals.plugins
          .containsKey(PluginsEnum.MAILCHIMP_SUBSCRIPTION_FORMS.name)) {
        pluginName = "mailchimp";
      } else {
        pluginName = "klaviyo";
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => EmailSubscriptionBottomSheet(pluginName));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
    showEmailSubscription();
    // FirebaseCloudMessageUtil.getInitialMessage(navigatorKey.currentContext!);
    print("-------------Dashboard init--------------");

    FirebaseCloudMessageUtil.getInitialMessage(context, (notificationModel) {
      // final currentLocation = ModalRoute.of(context)!.settings.name!;
      print(
          "-------------Dashboard init getInitialMessage call back return---------"); //currentLocation $currentLocation-----");
      if (notificationModel != null) {
        // && currentLocation=="/${Routes.DashboardScreen}") {
        print("-------------page route called--------------");
        // PageRoutes(context, data);
        RouteGenerate.ManageUserClick(context, notificationModel.route!,
            data: notificationModel);
      }
    });

    //when in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
          "----------------foreground notification--------${message.toMap()}-----");
      if (message.data["image"] != null && message.data["image"].isNotEmpty) {
        FirebaseCloudMessageUtil.showBigPictureNotificationHiddenLargeIcon(
            message.data["title"]!,
            message.data["body"]!,
            message.data["image"],
            flutterLocalNotificationsPlugin,
            message.data.toString());
      } else {
        FirebaseCloudMessageUtil.showBigTextNotification(
            message.data["title"]!,
            message.data["body"]!,
            flutterLocalNotificationsPlugin,
            message.data.toString());
      }

      // print("----------------------in foreground3.....${message.data}");
      // print("----------------------in foreground3.....${message.notification}");
      // showDialog<void>(
      //     context: context,
      //     // barrierDismissible: false,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         contentPadding: EdgeInsets.all(10),
      //         titlePadding: EdgeInsets.all(10),
      //         buttonPadding: EdgeInsets.all(10),
      //         actionsPadding:
      //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //         content: SingleChildScrollView(
      //           child: Column(
      //             children: <Widget>[
      //               message.data["image"] != null
      //                   ? Container(
      //                       height: 200,
      //                       width: double.maxFinite,
      //                       child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(
      //                             ThemeSize.themeBorderRadius),
      //                         child: WidgetImage(
      //                           message.data["image"]!,
      //                           fit: BoxFit.fill,
      //                         ),
      //                       ),
      //                     )
      //                   : Container(),
      //               SizedBox(
      //                 height: 8,
      //               ),
      //               message.data["title"]! != ""
      //                   ? Container(
      //                       alignment: Alignment.centerLeft,
      //                       child: Text(
      //                         message.data["title"]!!,
      //                         // textAlign: TextAlign.left,
      //                         style: TextStyle(
      //                             color: AppTheme.appBarTextColor,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                     )
      //                   : Container(),
      //               SizedBox(
      //                 height: 4,
      //               ),
      //               message.data["body"]! != ""
      //                   ? Container(
      //                       alignment: Alignment.centerLeft,
      //                       child: Text(
      //                         message.data["body"]!!,
      //                         // textAlign: TextAlign.left,
      //                         style: TextStyle(
      //                             color: AppTheme.appBarTextColor,
      //                             fontWeight: FontWeight.normal),
      //                       ),
      //                     )
      //                   : Container(),
      //               SizedBox(
      //                 height: 4,
      //               ),
      //             ],
      //           ),
      //         ),
      //         actions: <Widget>[
      //           Container(
      //             width: MediaQuery.of(context).size.width / 5,
      //             child: CustomButton(
      //                 text: "Detail",
      //                 onPressed: () {
      //                   context.pop();
      //                   NotificationModel notificationModel =
      //                       NotificationModel.fromJson(message.data);
      //                   // PageRoutes(context, notificationModel);
      //                   RouteGenerate.ManageUserClick(
      //                       context, notificationModel.route!,
      //                       data: notificationModel);
      //                 }),
      //           ),
      //           Container(
      //               width: MediaQuery.of(context).size.width / 5,
      //               child: CustomButton(
      //                 text: "Close",
      //                 onPressed: () {
      //                   context.pop();
      //                 },
      //                 textColor: AppTheme.secondaryButtonText,
      //                 backgroundColor: AppTheme.secondaryButtonBackground,
      //               ))
      //         ],
      //       );
      //     });
    });

    // //app opened from background (not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("------------------------app opened from background..............");
      NotificationModel notificationModel =
          NotificationModel.fromJson(message.data);
      // PageRoutes(context, notificationModel);
      RouteGenerate.ManageUserClick(context, notificationModel.route!,
          data: notificationModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("----------------------------------${listDrawer}"); // decoded json (var listDrawer =json.decode(snapshot.data!['jsonDrawer'].toString());)
    // print("----------------------------------${listBottomBar}"); // decoded json
    // return MainDrawer(appThemeModel.appThemeBlockData!,onTabChange: (tabItem) {print("tabItem$tabItem");});]

    return BlocProvider(
        create: (context) => DashboardScreenBloc(),
        child: BlocListener<DashboardScreenBloc, DashboardScreenState>(
          listener: ((context, state) async {
            if (state is DashboardScreenCustomerNotFoundState) {
              context.pushReplacement("/${Routes.customerDataNotFoundScreen}");
            }
          }),
          child: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
              builder: ((context, state) {
            if (state is DashboardScreenSuccessState) {
              print(
                  "------Dashboard screen---------${state.menuDataModel!.toJson()}");
              return Scaffold(
                resizeToAvoidBottomInset: true,
                key: _scaffoldKey,
                // floatingActionButton: FloatingActionButton(
                //   backgroundColor: AppTheme.primaryColor,
                //   child: Icon(
                //     Icons.chat_outlined,
                //     color: AppTheme.appBarTextColor,
                //   ),
                //   onPressed: () async {
                //     ShopifyUser? user = await Session().getLoginData();

                //     String myId = user!.id!;
                //     String partnerId = user!.partnerId!;
                //     ChatScreen chatScreen =
                //         ChatScreen(myId, partnerId, ApiConst.chatUrl);
                //     context.push("/${Routes.chatScreen}", extra: chatScreen);
                //   },
                // ),
                appBar: AppBar(
                  leading: state.dashboardDataItems!.headerData!.menuIconStatus!
                      ? Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              padding: EdgeInsets.all(15),
                              icon: SvgPicture.asset(
                                "assets/images/menu.svg",
                                colorFilter: ColorFilter.mode(
                                    AppTheme.appBarTextColor!, BlendMode.srcIn),
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              tooltip: MaterialLocalizations.of(context)
                                  .openAppDrawerTooltip,
                            );
                          },
                        )
                      : null,
                  // automaticallyImplyLeading: false,
                  title: state
                          .dashboardDataItems!.headerData!.storeLogoSrc!.isEmpty
                      ? Text(
                          state.dashboardDataItems!.headerData!.heading!.isEmpty
                              ? globals.partnerInfoModel.appSettings != null
                                  ? globals
                                      .partnerInfoModel.appSettings!.appName!
                                      .toUpperCase()
                                  : globals.partnerInfoModel.name != null
                                      ? globals.partnerInfoModel.name!
                                          .toUpperCase()
                                      : ""
                              : state.dashboardDataItems!.headerData!.heading
                                  .toString()
                                  .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.appBarTextColor),
                        )
                      : Image.network(
                          fit: BoxFit.contain,
                          state.dashboardDataItems!.headerData!.storeLogoSrc
                              as String,
                          width:
                              (state.dashboardDataItems!.headerData!.logoWidth!)
                                  .toDouble(),
                          height: 45,
                        ),
                  actions: [
                    state.dashboardDataItems!.headerData!.userIconStatus!
                        ? IconButton(
                            icon: Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                child: SvgPicture.string(
                                  state.dashboardDataItems!.headerData!
                                      .userIconSrc!,
                                  colorFilter: ColorFilter.mode(
                                      AppTheme.appBarTextColor!,
                                      BlendMode.srcIn),
                                )),
                            onPressed: () async {
                              RouteGenerate.GotoRouteAfterClick(
                                  context,
                                  state.dashboardDataItems!.headerData!
                                      .userIconAction!,
                                  state.dashboardDataItems!.headerData!
                                      .userIconID,
                                  title: state.dashboardDataItems!.headerData!
                                      .userIconTitle!,
                                  url: state.dashboardDataItems!.headerData!
                                      .userIconID);
                              /*   isLogin = await Session().IsLogin();
                              if (isLogin) {
                                ShopifyUser? user =
                                    await Session().getLoginData();
                                String chatScreenType = Routes.chatScreen;
                                // Routes.chatScreenGorgias;
                                // Routes.chatScreenShopifyInbox;
                                // Routes.chatScreenZendesk;
                                if (chatScreenType ==
                                    Routes.chatScreenZendesk) {
                                  ChatScreenZendesk chatScreen =
                                      ChatScreenZendesk();

                                  context.push("/${Routes.chatScreenZendesk}",
                                      extra: chatScreen);
                                } else if (chatScreenType ==
                                    Routes.chatScreenShopifyInbox) {
                                  ChatScreenShopifyInboxScreen chatScreen =
                                      ChatScreenShopifyInboxScreen(
                                          ApiConst.chatUrlShopifyInbox);
                                  context.push(
                                      "/${Routes.chatScreenShopifyInbox}",
                                      extra: chatScreen);
                                } else if (chatScreenType ==
                                    Routes.chatScreenGorgias) {
                                  ChatScreenGorgias chatScreen =
                                      ChatScreenGorgias();
                                  context.push("/${Routes.chatScreenGorgias}",
                                      extra: chatScreen);
                                } else {
                                  String myId = user!.shopifyId!;
                                  String partnerId =
                                      globals.partnerInfoModel.sId.toString();
                                  ChatScreen chatScreen = ChatScreen(
                                      myId, partnerId, ApiConst.chatUrl);
                                  context.push("/${Routes.chatScreen}",
                                      extra: chatScreen);
                                }
                              } else {
                                bool? refresh = await (context.pushNamed(
                                    "${Routes.loginScreen}",
                                    pathParameters: {"goBack": true.toString()},
                                    extra: null)) as bool;
                                if (refresh != null) {
                                  if (refresh as bool) {
                                    ShopifyUser? user =
                                        await Session().getLoginData();
                                    String chatScreenType = Routes.chatScreen;
                                    // Routes.chatScreenGorgias;
                                    // Routes.chatScreenShopifyInbox;
                                    // Routes.chatScreenZendesk;
                                    //Todo : need to change logic here only

                                    if (chatScreenType ==
                                        Routes.chatScreenZendesk) {
                                      ChatScreenZendesk chatScreen =
                                          ChatScreenZendesk();

                                      context.push(
                                          "/${Routes.chatScreenZendesk}",
                                          extra: chatScreen);
                                    } else if (chatScreenType ==
                                        Routes.chatScreenShopifyInbox) {
                                      ChatScreenShopifyInboxScreen chatScreen =
                                          ChatScreenShopifyInboxScreen(
                                              ApiConst.chatUrlShopifyInbox);
                                      context.push(
                                          "/${Routes.chatScreenShopifyInbox}",
                                          extra: chatScreen);
                                    } else if (chatScreenType ==
                                        Routes.chatScreenGorgias) {
                                      ChatScreenGorgias chatScreen =
                                          ChatScreenGorgias();
                                      context.push(
                                          "/${Routes.chatScreenGorgias}",
                                          extra: chatScreen);
                                    } else {
                                      String myId = user!.shopifyId!;
                                      String partnerId = globals
                                          .partnerInfoModel.sId
                                          .toString();
                                      ChatScreen chatScreen = ChatScreen(
                                          myId, partnerId, ApiConst.chatUrl);
                                      context.push("/${Routes.chatScreen}",
                                          extra: chatScreen);
                                    }
                                  }
                                }
                              }
                           */
                            },
                          )
                        : Container(),
                    state.dashboardDataItems!.headerData!.cartIconStatus!
                        ? Container(
                            // padding: EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  RouteGenerate.GotoRouteAfterClick(
                                      context,
                                      state.dashboardDataItems!.headerData!
                                          .cartIconAction!,
                                      state.dashboardDataItems!.headerData!
                                          .cartIconID,
                                      title: state.dashboardDataItems!
                                          .headerData!.cartIconTitle!,
                                      url: state.dashboardDataItems!.headerData!
                                          .cartIconID);
                                  // context.push("/${Routes.cartScreen}");
                                },
                                icon: Stack(
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 15, 5),
                                        child: SvgPicture.string(
                                          state.dashboardDataItems!.headerData!
                                              .cartIconSrc!,
                                          colorFilter: ColorFilter.mode(
                                              AppTheme.appBarTextColor!,
                                              BlendMode.srcIn),
                                        )),
                                    state.dashboardDataItems!.headerData!
                                                    .cartIconAction !=
                                                null &&
                                            state
                                                    .dashboardDataItems!
                                                    .headerData!
                                                    .cartIconAction ==
                                                Routes.cartScreen
                                        ? Positioned(
                                            top: 3,
                                            right: 2,
                                            child: CircleAvatar(
                                              maxRadius: 8,
                                              backgroundColor: Colors.red,
                                              child: Center(
                                                child: BlocBuilder<CartBloc,
                                                    CartState>(
                                                  builder: (context, state) {
                                                    return Text(
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                      context
                                                          .read<CartBloc>()
                                                          .countCart
                                                          .toString(),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ))
                                        : Container()
                                  ],
                                )),
                          )
                        : Container(),
                  ],
                ),
                drawer: state.dashboardDataItems!.headerData!.menuIconStatus!
                    // ? Drawer1(appThemeModel.appThemeBlockData!,onTabChange: (tabItem) {print("tabItem$tabItem");})
                    ? DrawerWidget(
                        _scaffoldKey,
                        selectedIndex1,
                        subSelectedIndex1,
                        nestedSelectedIndex1,
                        state.menuDataModel!,
                        onTabChange: (tabItem, selectedIndex, subSelectedIndex,
                            nestedSelectedIndex) {
                          print(
                              "--------------DashboardScreen tabItem change $tabItem-----------");
                          setState(() {
                            selectedIndex1 = selectedIndex;
                            subSelectedIndex1 = subSelectedIndex;
                            nestedSelectedIndex1 = nestedSelectedIndex;
                          });
                        },
                        changeRoute: (tabItem) {
                          print(
                              "--------------DashboardScreen route tabItem ${tabItem.title} and route ${tabItem.type} and resourceId ${tabItem.resourceId}----------");
                          String __typename = tabItem.resource != null &&
                                  tabItem.resource!.containsKey("__typename")
                              ? tabItem.resource!["__typename"]
                              : tabItem.type!; //"";
                          RouteGenerate.ManageUserClick(
                              context, __typename, // tabItem.type!,
                              data: tabItem);
                        },
                      )
                    : null,
                bottomNavigationBar: state
                        .dashboardDataItems!.bottomNavigationEnable!
                    ? //BottomBar(bottomBarModel.bottomBarBlockData!, (selectedIndex) {})
                    BottomBarWidget(state.dashboardDataItems!,
                        // appThemeModel.appThemeBlockData!.bottomBarBlockData!,
                        onTabChange: (bottomNavItem, selectedIndex) {
                        print(
                            "--------------DashboardScreen tabItemmmm---------${bottomNavItem}----- ${bottomNavItem.action}");
                        updateSelectedBtmNav(bottomNavItem, selectedIndex);
                      })
                    : null,
                body: Container(
                    child: selectedBottomNavData.action ==
                            "${Routes.homeScreen}"
                        ? HomeScreenBody.getInstance()
                        : selectedBottomNavData.action ==
                                "${Routes.customDashboardPage}"
                            ? CustomPageScreen(selectedBottomNavData.id,
                                showAppBar: false)
                            : selectedBottomNavData.action ==
                                    "${Routes.cartScreen}"
                                ? CartBody()
                                : selectedBottomNavData.action ==
                                        "${Routes.favoriteListScreen}"
                                    ? FavoriteListScreenBody()
                                    : selectedBottomNavData.action ==
                                            "${Routes.blogHandleListScreen}"
                                        ? BlogHandleListScreenBody(
                                            selectedBottomNavData.id!,
                                            false) //"news")
                                        : selectedBottomNavData.action ==
                                                "${Routes.pageViewScreen}"
                                            ? PageViewScreenBody(
                                                selectedBottomNavData.id!)
                                            : selectedBottomNavData.action ==
                                                    "${Routes.productListScreen}"
                                                ? ProductListScreenBody(
                                                    selectedBottomNavData.id!
                                                        .replaceAll(
                                                            "gid://shopify/Collection/",
                                                            ""),
                                                    selectedBottomNavData
                                                        .productTitle!,
                                                    (p0) => null,
                                                    sorting: FilterBottomList(
                                                        "",
                                                        false,
                                                        false,
                                                        SortKeyProductCollection
                                                            .BEST_SELLING),
                                                  )
                                                : (selectedBottomNavData.action ==
                                                            "${Routes.categoryScreen}" ||
                                                        selectedBottomNavData
                                                                .action ==
                                                            Routes
                                                                .catalogScreen)
                                                    ? CategoryScreenFromMenu(
                                                        false)
                                                    : selectedBottomNavData.action ==
                                                            "${Routes.categoryScreenAll}"
                                                        ? CategoryScreenFromCollection(
                                                            false)
                                                        : selectedBottomNavData
                                                                    .action ==
                                                                "${Routes.profileScreen}"
                                                            ? ProfileScreen(
                                                                false)
                                                            : selectedBottomNavData
                                                                        .action ==
                                                                    "${Routes.searchScreenFull}"
                                                                ? //SearchScreen()
                                                                globals.plugins
                                                                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                                                                    ? BoostAISearchScreen()
                                                                    : SearchScreen()
                                                                : selectedBottomNavData.action == "${Routes.contactUsScreen}"
                                                                    ? ContactUsScreenBody(
                                                                        isOpenedFromMain:
                                                                            false,
                                                                      )
                                                                    : selectedBottomNavData.action == "${Routes.notificationscreen}"
                                                                        ? NotificationScreenBody()
                                                                        : (selectedBottomNavData.action == "${Routes.webUrlScreen}" || selectedBottomNavData.action == Routes.shopPolicyScreen)
                                                                            ? WebViewPagesScreenBody(
                                                                                titleMain: selectedBottomNavData.title.toString(),
                                                                                urlToLoad: selectedBottomNavData.id!,
                                                                                bodyTags: "",
                                                                              )
                                                                            : selectedBottomNavData.action == "${Routes.chatScreen}"
                                                                                ? ChatScreenBody(context.read<DashboardScreenBloc>().myShopifyId.toString(), globals.partnerInfoModel.sId.toString(), ApiConst.chatUrl)
                                                                                : selectedBottomNavData.action == "${Routes.chatScreenZendesk}"
                                                                                    ? ChatScreenZendesk(showappbar: false)
                                                                                    : selectedBottomNavData.action == "${Routes.chatScreenGorgias}"
                                                                                        ? ChatScreenGorgias(showappbar: false)
                                                                                        : selectedBottomNavData.action == "${Routes.chatScreenShopifyInbox}"
                                                                                            ? ChatScreenShopifyInboxScreen(ApiConst.chatUrlShopifyInbox, showappbar: false)
                                                                                            : selectedBottomNavData.action == "${Routes.productDetailsScreen}"
                                                                                                ? ProductDetailsScreen(selectedBottomNavData.id.toString(), showappbar: false)
                                                                                                : selectedBottomNavData.action == Routes.articleScreen
                                                                                                    ? ArticleScreen(
                                                                                                        selectedBottomNavData.id!,
                                                                                                        showappbar: false,
                                                                                                      )
                                                                                                    : HomeScreenBody.getInstance()),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: NoDataView(AppAssets.search,
                      LanguageManager.translations()['nodatafound']),
                ),
              );
            }
          })),
        ));
  }
}
