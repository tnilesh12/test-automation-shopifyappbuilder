import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/views/article_screen/article_screen.dart';
import '/views/blog/blog_list_screen.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/modelClass/notification.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/gorgias/chat_screen_gorgias.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_dashboard_screen/loyalty_lion_dashboard_screen.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_ways_to_earn_points/loyalty_lion_ways_to_redeem_screen.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_activity/loyalty_lion_your_activity_screen.dart';
import 'package:shopify_code/plugin/loyalty_lion/loyalty_lion_your_rewards/loyalty_lion_your_rewards_screen.dart';
import 'package:shopify_code/plugin/shopify_inbox/shopify_inbox_web_screen.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/smile_io_dashboard_screen.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_ways_to_redeem/smile_io_ways_to_redeem_screen.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_activity/smile_io_your_activity_screen.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_your_rewards/smile_io_your_rewards_screen.dart';
import 'package:shopify_code/plugin/zendesk/chat_screen_zendesk.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/chat/chat_screen.dart';
import '/common/views/splash_screen/main_splash_screen.dart';
import '/views/splash_screen/splash_screen.dart';
import '/views/Add_address/add_address_screen.dart';
import '/views/Address_list/address_list_screen.dart';
import '/views/blog/blog_post/blog_post_screen.dart';
import '/views/cart_screen/cart_screen.dart';
import '/views/category/category_from_menu/category_screen_from_menu.dart';
import '/views/category/category_screen_from_collection.dart';
import '/views/checkout/checkout_screen.dart';
import '/views/common_screens/customer_data_not_found_screen.dart';
import '/views/common_screens/shop_not_valid_screen.dart';
import '/views/common_screens/under_maintenance_screen.dart';
import '/views/countrycode/country_code.dart';
import '/views/countrycode/state_code.dart';
import '/views/dashboard_screen/custom_page_screen.dart';
import '/views/dashboard_screen/dashboard_screen.dart';
import '/views/dashboard_screen/view_all/collection_view_all.dart';
import '/views/dashboard_screen/view_all/product_view_all.dart';
import '/views/favorite/favorite_list_screen.dart';
import '/views/home_screen/home_screen.dart';
import '/views/order/order_details_screen.dart';
import '/views/order/order_list_screen.dart';
import '/views/pages/pages_view_screen.dart';
import '/views/product_details_screen/product_details_screen.dart';
import '/views/product_filter/product_filter_screen.dart';
import '/views/product_list/product_list_screen.dart';
import '/views/auth/change_password/change_pass_screen.dart';
import '/views/profile_screen/account_deletion_request/account_deletion_request_screen.dart';
import '/views/profile_screen/multi_store_list_screen.dart';
import '/views/profile_screen/my_profile/my_profile_screen.dart';
import '/views/profile_screen/notification/notification_screen.dart';
import '/views/profile_screen/profile_screen.dart';
import '/views/profile_screen/contact_us/contact_us_screen.dart';
import '/views/profile_screen/setting_screen.dart';
import '/views/auth/forgot_pass/forgot_pass_screen.dart';
import '/views/intro_screen/intro_screen.dart';
import '/views/auth/login/login_screen.dart';
import '/views/auth/signup/sign_up_screen.dart';
import '/views/search/search_screen_full.dart';
import '/views/splash_screen/splash_screen.dart';
import '/views/webview_pages/webview_pages_screen.dart';
import '/views/rating_review/add_review_screen.dart';
import '/views/rating_review/rating_review_full_view_widget.dart';
import '/views/rating_review/rating_review_list_screen.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import '../views/checkout/thanks_screen/thanks_screen.dart';
import '../views/search/boost_ai_search/boost_ai_search_screen_full.dart';
import 'package:shopify_code/views/web_view_screen/tevello_web_view_screen.dart';
import '../views/checkout/web_checkout/web_check_out.dart';
import '/views/rating_review/rating_review_webview_screen.dart';
import 'package:url_launcher/url_launcher.dart';

/// This handles '/' and '/details'.
var goRouter = GoRouter(
  // final screenWidth = 360.0;
  // final screenHeight = 640.0;
  initialLocation: "/",
  routes: [
    GoRoute(
      name: Routes.mainSplashScreen,
      path: "/",
      builder: (_, __) {
        return MainSplashScreen();
      },
      routes: [
        GoRoute(
            path: Routes.signUpScreen,
            builder: (_, state) {
              SignUpScreen signUpScreen = state.extra as SignUpScreen;
              return SignUpScreen(signUpScreen.goBack);
            }),
        GoRoute(path: Routes.introScreen, builder: (_, __) => IntroScreen()),
        // GoRoute(
        //   path: 'redirectPage',
        //   builder: (_, __) => Scaffold(
        //     appBar: AppBar(title:  Text(LanguageManager.translations()[
        //                                           'redirectPageScreen'])),
        //   ),
        // ),
        GoRoute(
            name: Routes.loginScreen,
            path: Routes.loginScreen + "/:goBack",
            builder: (_, state) {
              bool goBack =
                  bool.parse(state.pathParameters["goBack"].toString());
              return LoginScreen(goBack);
            }),
        GoRoute(
            path: Routes.dashboardScreen,
            builder: (_, state) {
              // if (globals.publishedTheme == "second") {
              //   return ShopNotValidScreen();
              // } else {
                return DashboardScreen();
              // }
            }),
        GoRoute(
            path: Routes.shopNotValidScreen,
            builder: (_, __) => ShopNotValidScreen()),
        GoRoute(path: Routes.homeScreen, builder: (_, __) => HomeScreen()),
        GoRoute(
            path: Routes.customerDataNotFoundScreen,
            builder: (_, __) => CustomerDataNotFoundScreen()),
        GoRoute(
            path: Routes.splashScreen,
            builder: (_, __) {
              return SplashScreen();
            }),
        //  GoRoute(
        //    path: onBoardingScreen ,
        //    builder: (_, __) => OnBoardingScreen()
        //  ),
        GoRoute(
            path: Routes.productFilterScreen,
            builder: (_, state) {
              ProductFilterScreen productFilterScreen =
                  state.extra as ProductFilterScreen;
              return ProductFilterScreen(productFilterScreen.FilterHandle);
            }),
        //  GoRoute(
        //    path: onBoardingTwoScreen,
        //    builder: (_, __) => OnBoardingTwoScreen()
        //  ),
        GoRoute(
            path: Routes.forgotPassScreen,
            builder: (_, state) {
              ForgetPassScreen forgotPassScreen =
                  state.extra as ForgetPassScreen;
              return ForgetPassScreen(forgotPassScreen.goBack);
            }),

        GoRoute(
            path: Routes.notificationscreen,
            builder: (_, __) => NotificationScreen()),

        GoRoute(
            path: Routes.productDetailsScreen,
            builder: (_, state) {
              ProductDetailsScreen productDetailsScreen =
                  state.extra as ProductDetailsScreen;
              return ProductDetailsScreen(productDetailsScreen.ids);
            }),
        GoRoute(path: Routes.cartScreen, builder: (_, __) => CartScreen()),
        GoRoute(path: Routes.myProfile, builder: (_, __) => MyProfileScreen()),
        GoRoute(
            name: Routes.webCheckoutScreen,
            path: Routes.webCheckoutScreen + "/:url",
            builder: (_, state) {
              String url = state.pathParameters["url"].toString();
              return WebCheckoutScreen(url);
            }),

        GoRoute(
            path: Routes.profileScreen,
            // name: Routes.profileScreen,
            builder: (_, state) {
              bool showappbar = state.extra as bool;
              return ProfileScreen(showappbar);
            }),
        GoRoute(
            name: Routes.addressScreen,
            path: Routes.addressScreen + "/:type",
            builder: (_, state) {
              debugPrint("path is ${state.path}");
              debugPrint("path is ${state.pathParameters}");
              Address? args = state.extra == null
                  ? null
                  : Address.fromJson(state.extra as Map<String, dynamic> ?? {});

              return AddressScreen(
                  args, state.pathParameters["type"].toString());

              //          debugPrint("${ state.path}");
              //          debugPrint("${ state.pathParameters}");
              //             // Node addressNode =
              //             //     state.extra as Node;
              //                 // String option =state.extra as String;
              //   //               Node args =
              //   // state.extra as Node;

              //         Address args= state.extra as Address;
              // // return MyWidget(arg1: args["arg1"]!, arg2: args["arg2"]!);
              //             return AddressScreen(args,state.pathParameters["type"].toString());
            }),

        GoRoute(
            path: Routes.addReviewScreen,
            builder: (_, state) {
              AddReviewScreen addReviewScreen = state.extra as AddReviewScreen;
              return AddReviewScreen(addReviewScreen.product);
            }),
        GoRoute(
            path: Routes.ratingReviewList,
            builder: (_, state) {
              RatingReviewListScreen ratingReviewList =
                  state.extra as RatingReviewListScreen;
              return RatingReviewListScreen(ratingReviewList.productId);
            }),
        GoRoute(
            path: Routes.ratingReviewFullScreen,
            builder: (_, state) {
              RatingReviewFullViewWidget ratingReviewFullViewWidget =
                  state.extra as RatingReviewFullViewWidget;
              return RatingReviewFullViewWidget(
                  ratingReviewFullViewWidget.reviewList,
                  ratingReviewFullViewWidget.index);
            }),

        GoRoute(
            path: Routes.countryCode,
            name: Routes.countryCode,
            builder: (_, __) => CountryCodeScreen()),
        GoRoute(
            path: Routes.addressListscreen,
            builder: (_, state) {
              bool isReturn = state.extra as bool;
              return AddressListScreen(isReturn);
            }),
        GoRoute(
            path: Routes.orderListScreen,
            builder: (_, __) => OrderListScreen()),
        GoRoute(
            path: Routes.multiStoreScreen,
            builder: (context, state) => MultiStoreScreen()),
        GoRoute(
            path: Routes.changePassScreen,
            builder: (context, state) => ChangePassScreen()),
        GoRoute(
            path: Routes.settingsScreen,
            builder: (context, state) => SettingScreen()),
        GoRoute(
            path: Routes.orderDetailsScreen,
            builder: (_, state) {
              OrderDetailsScreen orderDetailsScreen =
                  state.extra as OrderDetailsScreen;
              return OrderDetailsScreen(orderDetailsScreen.order);
            }),
        GoRoute(
            path: Routes.categoryScreen,
            builder: (_, state) {
              bool showappbar = state.extra as bool;
              return CategoryScreenFromMenu(showappbar);
            }),
        GoRoute(
            path: Routes.categoryScreenAll,
            builder: (_, state) {
              bool showappbar = state.extra as bool;
              return CategoryScreenFromCollection(showappbar);
            }),
        GoRoute(
            path: Routes.favoriteListScreen,
            builder: (_, __) => FavoriteListScreen()),
        GoRoute(
            path: Routes.chatScreen,
            builder: (_, state) {
              ChatScreen chatScreen = state.extra as ChatScreen;
              return ChatScreen(chatScreen.senderId, chatScreen.receiverId,
                  chatScreen.urlSocketIO);
            }),

        GoRoute(
            path: Routes.chatScreenGorgias,
            builder: (_, state) {
              // ChatScreenGorgias chatScreen = state.extra as ChatScreenGorgias;
              return ChatScreenGorgias();
            }),

        GoRoute(
            path: Routes.chatScreenZendesk,
            builder: (_, state) {
              // ChatScreenZendesk chatScreen2 = state.extra as ChatScreenZendesk;
              return ChatScreenZendesk();
            }),
        GoRoute(
            path: Routes.chatScreenShopifyInbox,
            builder: (_, state) {
              ChatScreenShopifyInboxScreen chatScreen =
                  state.extra as ChatScreenShopifyInboxScreen;
              return ChatScreenShopifyInboxScreen(chatScreen.url);
            }),
        GoRoute(
            path: Routes.contactUsScreen,
            builder: (_, __) => ContactUsScreen()),
        GoRoute(
            path: Routes.accountDeletionRequestScreen,
            builder: (_, __) => AccountDeletionRequestScreen()),
        //    GoRoute(
        //    path: termsOfUseScreen ,
        //    builder: (_, __) => TermsOfUseScreen()
        //  ),
        GoRoute(
            path: Routes.blogHandleListScreen,
            builder: (_, state) {
              BlogHandleListScreen blogHandleListScreen =
                  state.extra as BlogHandleListScreen;
              return BlogHandleListScreen(blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title);
            }),
        //    GoRoute(
        //    path: pageScreen ,
        //    builder: (_, __) => PageScreen()
        //  ),
        GoRoute(
            path: Routes.pageViewScreen,
            builder: (_, state) {
              PageViewScreen pageViewScreen = state.extra as PageViewScreen;
              return PageViewScreen(
                pageViewScreen.id,
              );
            }),
        // GoRoute(
        //     path: Routes.boost_ai_pageView,
        //     builder: (_, state) {
        //       BoostAIPageViewScreen pageViewScreen =
        //           state.extra as BoostAIPageViewScreen;
        //       return BoostAIPageViewScreen(
        //           pageViewScreen.handle, pageViewScreen.index);
        //     }),

        //    GoRoute(
        //    path: aboutScreen,
        //    builder: (_, __) => AboutScreen()
        //  ),
        //    GoRoute(
        //    path: affiliateScreen,
        //    builder: (_, __) => AffiliateScreen()
        //  ),
        //    GoRoute(
        //    path: privacyPolicyScreen,
        //    builder: (_, __) => PrivacyPolicyScreen()
        //  ),
        //    GoRoute(
        //    path: refundPolicyScreen,
        //    builder: (_, __) => RefundPolicyScreen()
        //  ),
        //    GoRoute(
        //    path:shippingPolicyScreen ,
        //    builder: (_, __) => ShippingPolicyScreen()
        //  ),
        //    GoRoute(
        //    path:countryCodeScreen ,
        //    builder: (_, __) => CountryCodeScreen()
        //  ),
        GoRoute(
            path: Routes.productListScreen,
            builder: (_, state) {
              ProductListScreen productListScreen =
                  state.extra as ProductListScreen;
              return ProductListScreen(productListScreen.collection_id,
                  productListScreen.collection_name);
            }),
        //    GoRoute(
        //    path: passwordUpdateScreen,
        //    builder: (_, __) => PasswordUpdateScreen()
        //  ),
        GoRoute(
            path: Routes.stateCodeScreen,
            builder: (_, state) {
              StateCodeScreen stateCode = state.extra as StateCodeScreen;
              return StateCodeScreen(stateCode.cCode);
            }),
        // GoRoute(
        //     path: Routes.checkoutScreen,
        //     builder: (_, state) {
        //       Cart cart = state.extra as Cart;
        //       return CheckoutScreen(cart);
        //     }),
        //   GoRoute(
        //    path: Routes.webCheckoutScreen,
        //    builder: (_, __) => WebCheckoutScreen()
        //  ),
        GoRoute(
            path: Routes.thanksScreen,
            builder: (_, state) {
              List<String> str = state.extra as List<String>;
              return ThanksScreen(str.first, str.last);
            }),
        //   GoRoute(
        //    path: Routes.oderProcessScreen,
        //    builder: (_, __) => OderProcessScreen()
        //  ),
        //   GoRoute(
        //    path: Routes.oderProcesStopScreen,
        //    builder: (_, __) => OderProcesStopScreen()
        //  ),
        //   GoRoute(
        //    path: Routes.selectAddresScreen,
        //    builder: (_, __) => SelectAddresScreen()
        //  ),
        //   GoRoute(
        //    path:oderSummaryScreen ,
        //    builder: (_, __) => OderSummaryScreen()
        //  ),
        GoRoute(
            name: Routes.articleScreen,
            path: Routes.articleScreen + "/:id",
            builder: (_, state) {
              String articleId = state.pathParameters["id"].toString();
              return ArticleScreen(articleId);
            }),
        //  GoRoute(
        //    path: blogHandleScreen,
        //    builder: (_, __) => BlogHandleScreen()
        //  ),
        //  GoRoute(
        //    path:pageByIdScreen ,
        //    builder: (_, __) => PageByIdScreen()
        //  ),
        GoRoute(
            path: Routes.searchScreenFull,
            builder: (_, __) {
              return globals.plugins
                      .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                  ? BoostAISearchScreenFull()
                  : SearchScreenFull();
            }),
        // GoRoute(
        //     path: Routes.boost_ai,
        //     builder: (_, __) => BoostAISearchScreenFull()),
        //  GoRoute(
        //    path: contactFormScreen,
        //    builder: (_, __) => ContactFormScreen()
        //  ),
        GoRoute(
            path: Routes.webUrlScreen,
            builder: (_, state) {
              WebViewPagesScreen webViewPagesScreen =
                  state.extra as WebViewPagesScreen;
              return WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body);
            }
            // =>WebViewPagesScreen(
            // Sample sample = state.extra as Sample;
            //           // titleMain: state.uri.queryParameters['titleMain']!,
            //           // urlToLoad: state.uri.queryParameters['urlToLoad']!,
            //           // bodyTags: state.uri.queryParameters['bodyTags']!,
            //          )
            ),
        GoRoute(
          path: Routes.ratingReviewWebViewScreen,
          builder: (_, state) {
            RatingReviewWebViewScreen ratingReviewWebViewScreen =
                  state.extra as RatingReviewWebViewScreen;
              return RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body);
          },
        ),
        GoRoute(
            path: Routes.customDashboardPage,
            builder: (_, state) {
              CustomPageScreen customPageScreen =
                  state.extra as CustomPageScreen;
              return CustomPageScreen(customPageScreen.pageId);
            }),

        //view all
        GoRoute(
            path: Routes.collectionViewAll,
            builder: (_, state) {
              CollectionGridData collectionGridData =
                  state.extra as CollectionGridData;
              return CollectionViewAll(collectionGridData);
            }),
        GoRoute(
            path: Routes.productViewAll,
            builder: (_, state) {
              ProductGridData productGridData = state.extra as ProductGridData;
              return ProductViewAll(productGridData);
            }),

        GoRoute(
            path: Routes.smileIoDashboardScreen,
            builder: (_, state) {
              SmileIoDashboardScreen smileIoDashboardScreen =
                  state.extra as SmileIoDashboardScreen;
              return SmileIoDashboardScreen(smileIoDashboardScreen.showappbar,
                  email: smileIoDashboardScreen.email);
            }),
        GoRoute(
            path: Routes.smileIoWaysToRedeemScreen,
            builder: (_, state) {
              SmileIoWaysToRedeemScreen smileIoWaysToRedeemScreen =
                  state.extra as SmileIoWaysToRedeemScreen;
              return SmileIoWaysToRedeemScreen(
                  smileIoWaysToRedeemScreen.totalPoints,
                  smileIoWaysToRedeemScreen.customerId);
            }),
        GoRoute(
            path: Routes.smileIoYourRewardsScreen,
            builder: (_, state) {
              SmileIoYourRewardsScreen smileIoYourRewardsScreen =
                  state.extra as SmileIoYourRewardsScreen;
              return SmileIoYourRewardsScreen(
                  smileIoYourRewardsScreen.customerId);
            }),
        GoRoute(
            path: Routes.smileIoYourActivityScreen,
            builder: (_, state) {
              SmileIoYourActivityScreen smileIoYourActivityScreen =
                  state.extra as SmileIoYourActivityScreen;
              return SmileIoYourActivityScreen(
                  smileIoYourActivityScreen.customerId);
            }),

        GoRoute(
            path: Routes.loyaltyLionDashboardScreen,
            builder: (_, state) {
              LoyaltyLionDashboardScreen loyaltyLionDashboardScreen =
                  state.extra as LoyaltyLionDashboardScreen;
              return LoyaltyLionDashboardScreen(
                  loyaltyLionDashboardScreen.showappbar,
                  email: loyaltyLionDashboardScreen.email);
            }),
        GoRoute(
            path: Routes.loyaltyLionWaysToRedeemScreen,
            builder: (_, state) {
              LoyaltyLionWaysToRedeemScreen loyaltyLionWaysToRedeemScreen =
                  state.extra as LoyaltyLionWaysToRedeemScreen;
              return LoyaltyLionWaysToRedeemScreen(
                  loyaltyLionWaysToRedeemScreen.totalPoints,
                  loyaltyLionWaysToRedeemScreen.customerMerchantId);
            }),
        GoRoute(
            path: Routes.loyaltyLionYourRewardsScreen,
            builder: (_, state) {
              LoyaltyLionYourRewardsScreen loyaltyLionYourRewardsScreen =
                  state.extra as LoyaltyLionYourRewardsScreen;
              return LoyaltyLionYourRewardsScreen(
                  loyaltyLionYourRewardsScreen.customerMerchantId);
            }),
        GoRoute(
            path: Routes.loyaltyLionYourActivityScreen,
            builder: (_, state) {
              LoyaltyLionYourActivityScreen loyaltyLionYourActivityScreen =
                  state.extra as LoyaltyLionYourActivityScreen;
              return LoyaltyLionYourActivityScreen(
                  loyaltyLionYourActivityScreen.customerMerchantId);
            }),

        GoRoute(
            path: Routes.tevelloWebViewScreen,
            builder: (_, state) {
              TevelloWebViewScreen tevelloWebViewScreen =
                  state.extra as TevelloWebViewScreen;
              return TevelloWebViewScreen(
                titleMain: tevelloWebViewScreen.title,
                urlToLoad: tevelloWebViewScreen.url,
              );
            }),
      ],
    ),
  ],
  //  errorPageBuilder: (context, state) {
  //    return ErrorScreen(onBack: onBack)
  //  },
);

class RouteGenerate {
  ///////////////////////////////////////MANGE USER CLICK
  static ManageUserClick(BuildContext context, String route_name,
      {Object? data, bool? button1, bool? button2}) {
    debugPrint("route_name is ${route_name}");
    debugPrint("arguments is ${data}");

    route_name = route_name.toUpperCase();

    if (route_name == "NONE" || route_name == "") {
      return;
    }

    if (data is ImageBanner) {
      if (button1 != null)
        GotoRouteAfterClick(context, route_name, data.primarybtnId.toString(),
            url: data.primarybtnId);
      if (button2 != null)
        GotoRouteAfterClick(context, route_name, data.secondarybtnId.toString(),
            url: data.secondarybtnId);
    } else if (data is ProductListScreen) {
      GotoRouteAfterClick(context, route_name, data.collection_id,
          title: data.collection_name);
    } else if (data is MenuItems) {
      GotoRouteAfterClick(context, route_name, data.resourceId,
          title: data.title!,
          url: data.url,
          handle: data.resource != null ? data.resource!["handle"] : "");
    } else if (data is ImageWithTextData) {
      GotoRouteAfterClick(context, route_name, data.id,
          url: data.id, title: data.productTitle!);
    } else if (data is ProductDetailsScreen) {
      GotoRouteAfterClick(context, route_name, data.ids);
    } else if (data is NotificationModel) {
      // context.go(route_name);
      GotoRouteAfterClick(context, route_name.replaceAll("/", ""), data.id);
    } else if (data is TextWithBackgroundImageData) {
      GotoRouteAfterClick(context, route_name, data.id, url: data.id);
    } else if (data is ButtonOnlyData) {
      GotoRouteAfterClick(context, route_name, data.id,
          url: data.id, title: data.productTitle!);
    } else if (data is ImageOnlyData) {
      GotoRouteAfterClick(context, route_name, data.id,
          url: data.id, title: data.productTitle!);
    } else if (data is ImageGridItem) {
      GotoRouteAfterClick(context, route_name, data.id,
          url: data.id, title: data.productTitle!);
    } else if (data is BlogViewItem) {
      GotoRouteAfterClick(context, route_name, data.id, title: data.title!);
    } else if (data is TextGridItem) {
      GotoRouteAfterClick(context, route_name, data.id,
          title: data.text!, url: data.id);
    }
  }

  static GotoRouteAfterClick(
      BuildContext context, String route_name, String? ids,
      {String title = "", String? url = "", String? handle = ""}) async {
    route_name = route_name.toUpperCase();
    Object? tempdata;
    Map<String, String> pathParameters = const <String, String>{};

    if (route_name == Routes.productListScreen ||
        route_name.toLowerCase() == "collection") {
      route_name = "/${Routes.productListScreen}";
      tempdata = ProductListScreen(
          ids!.replaceAll("gid://shopify/Collection/", ""), title);
    } else if (route_name == Routes.categoryScreen ||
        route_name == Routes.catalogScreen) {
      tempdata = true;
      route_name = "/${Routes.categoryScreen}";
    } else if (route_name == Routes.searchScreenFull) {
      route_name = "/${Routes.searchScreenFull}";
    } else if (route_name == Routes.profileScreen) {
      tempdata = true;
      route_name = "/${Routes.profileScreen}";
    } else if (route_name == Routes.contactUsScreen) {
      route_name = "/${Routes.contactUsScreen}";
    } else if (route_name == Routes.notificationscreen) {
      route_name = "/${Routes.notificationscreen}";
    } else if (route_name == Routes.homeScreen) {
      route_name = "/${Routes.dashboardScreen}";
    } else if (route_name == Routes.cartScreen) {
      route_name = "/${Routes.cartScreen}";
    } else if (route_name == Routes.favoriteListScreen) {
      route_name = "/${Routes.favoriteListScreen}";
    } else if (route_name == Routes.blogHandleListScreen) {
      if (ids!.contains("gid")) {
        tempdata = BlogHandleListScreen(
          ids,
          title: title,
        );
      } else {
        tempdata = BlogHandleListScreen(handle!, title: title);
      }
      route_name = "/${Routes.blogHandleListScreen}";
    } else if (route_name == Routes.articleScreen) {
      if (ids!.contains("gid")) {
        pathParameters = {"id": ids};
      } else {
        pathParameters = {"id": handle!};
      }
      tempdata = null;
      route_name = "${Routes.articleScreen}";
    } else if (route_name == Routes.pageViewScreen ||
        route_name.toLowerCase() == "page") {
      // tempdata = PageViewScreen(ids);
      // tempdata = PageViewScreen(url!.replaceAll("https://${AppConfig.APP_DOMAIN}/pages/", ""));
      if (ids!.contains("gid")) {
        tempdata = PageViewScreen(ids!);
      } else {
        String handle = Utils.extractFirstWordFromLastSegment(url!);
        debugPrint("------------handle $handle-----");
        tempdata = PageViewScreen(handle);
      }
      route_name = "/${Routes.pageViewScreen}";
    } else if (route_name == Routes.productDetailsScreen) {
      tempdata = ProductDetailsScreen(ids!);
      route_name = "/${Routes.productDetailsScreen}";
    } else if (route_name == Routes.webUrlScreen ||
        route_name == Routes.shopPolicyScreen) {
      tempdata = WebViewPagesScreen(
        titleMain: title,
        urlToLoad: url!,
        bodyTags: "",
      );
      if (!url.contains("http")) {
        urlLauncher(url);
        return;
      }
      route_name = "/${Routes.webUrlScreen}";
    } else if (route_name == Routes.chatScreen) {
      bool isLogin = await Session().IsLogin();
      if (isLogin) {
        ShopifyUser? user = await Session().getLoginData();
        String myId = user!.shopifyId!;
        String partnerId = user!.partnerId!;
        tempdata = ChatScreen(myId, partnerId, ApiConst.chatUrl);
        route_name = "/${Routes.chatScreen}";
      } else {
        bool? refresh = await (context.pushNamed("${Routes.loginScreen}",
            pathParameters: {"goBack": true.toString()}, extra: null)) as bool;
        if (refresh != null) {
          if (refresh as bool) {
            ShopifyUser? user = await Session().getLoginData();
            String myId = user!.shopifyId!;
            String partnerId = user!.partnerId!;
            tempdata = ChatScreen(myId, partnerId, ApiConst.chatUrl);
            route_name = "/${Routes.chatScreen}";
          }
        }
      }
    } else if (route_name == Routes.chatScreenShopifyInbox) {
      bool isLogin = await Session().IsLogin();
      if (isLogin) {
        tempdata = ChatScreenShopifyInboxScreen(ApiConst.chatUrlShopifyInbox);
        route_name = "/${Routes.chatScreenShopifyInbox}";
      } else {
        bool? refresh = await (context.pushNamed("${Routes.loginScreen}",
            pathParameters: {"goBack": true.toString()}, extra: null)) as bool;
        if (refresh != null) {
          if (refresh as bool) {
            tempdata =
                ChatScreenShopifyInboxScreen(ApiConst.chatUrlShopifyInbox);
            route_name = "/${Routes.chatScreenShopifyInbox}";
          }
        }
      }
    } else if (route_name == Routes.chatScreenGorgias) {
      bool isLogin = await Session().IsLogin();
      if (isLogin) {
        route_name = "/${Routes.chatScreenGorgias}";
      } else {
        bool? refresh = await (context.pushNamed("${Routes.loginScreen}",
            pathParameters: {"goBack": true.toString()}, extra: null)) as bool;
        if (refresh != null) {
          if (refresh as bool) {
            route_name = "/${Routes.chatScreenGorgias}";
          }
        }
      }
    } else if (route_name == Routes.chatScreenZendesk) {
      bool isLogin = await Session().IsLogin();
      if (isLogin) {
        route_name = "/${Routes.chatScreenZendesk}";
      } else {
        bool? refresh = await (context.pushNamed("${Routes.loginScreen}",
            pathParameters: {"goBack": true.toString()}, extra: null)) as bool;
        if (refresh != null) {
          if (refresh as bool) {
            route_name = "/${Routes.chatScreenZendesk}";
          }
        }
      }
    } else if (route_name == Routes.customDashboardPage) {
      if (url == "CustomizedCourse") {
        tempdata = TevelloWebViewScreen(
          titleMain: title,
          urlToLoad: ApiConst.tevelloUrl,
        );
        route_name = "/${Routes.tevelloWebViewScreen}";
        context.push(
          route_name,
          extra: tempdata,
        );
        return;
      }
      tempdata = CustomPageScreen(ids);
      route_name = "/${Routes.customDashboardPage}";
    }

    debugPrint("route_name is1 ${route_name}");
    debugPrint("arguments is2 ${tempdata}");

    if (pathParameters.isNotEmpty) {
      context.pushNamed(route_name,
          extra: tempdata, pathParameters: pathParameters);
    } else {
      context.push(
        route_name,
        extra: tempdata,
      );
    }
  }

  static urlLauncher(String url) async {
    debugPrint("----------url is2 ${url}---------");
    if (url.contains("mailto")) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: url.replaceAll("mailto:", ""),
      );
      launchUrl(emailLaunchUri);
    } else {
      final Uri launchUri = Uri.parse(url); // (path: url);
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
