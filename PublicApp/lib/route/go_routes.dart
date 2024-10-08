import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio_quiz_bloc.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_start_quiz.dart';
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
import 'package:shopify_code/views/web_view_screen/tevello_web_view_screen.dart';
import '/common/views/splash_screen/main_splash_screen.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme1.dart' as theme1;
import 'theme2.dart' as theme2;
import 'theme3.dart' as theme3;
import 'theme4.dart' as theme4;
import 'theme5.dart' as theme5;
import 'theme6.dart' as theme6;

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
            switch (globals.publishedTheme) {
              case "second":
                theme2.SignUpScreen signUpScreen =
                    state.extra as theme2.SignUpScreen;
                return theme2.SignUpScreen(signUpScreen.goBack);
              case "third":
                theme3.SignUpScreen signUpScreen =
                    state.extra as theme3.SignUpScreen;
                return theme3.SignUpScreen(signUpScreen.goBack);
              case "fourth":
                theme4.SignUpScreen signUpScreen =
                    state.extra as theme4.SignUpScreen;
                return theme4.SignUpScreen(signUpScreen.goBack);
              case "fifth":
                theme5.SignUpScreen signUpScreen =
                    state.extra as theme5.SignUpScreen;
                return theme5.SignUpScreen(signUpScreen.goBack);
              case "sixth":
                theme6.SignUpScreen signUpScreen =
                    state.extra as theme6.SignUpScreen;
                return theme6.SignUpScreen(signUpScreen.goBack);
              default:
                theme1.SignUpScreen signUpScreen =
                    state.extra as theme1.SignUpScreen;
                return theme1.SignUpScreen(signUpScreen.goBack);
            }
          },
        ),
        GoRoute(
          path: Routes.introScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.IntroScreen();
              case "third":
                return theme3.IntroScreen();
              case "fourth":
                return theme4.IntroScreen();
              case "fifth":
                return theme5.IntroScreen();
              case "sixth":
                return theme6.IntroScreen();
              default:
                return theme1.IntroScreen();
            }
          },
        ),
        GoRoute(
          name: Routes.loginScreen,
          path: Routes.loginScreen + "/:goBack",
          builder: (_, state) {
            bool goBack = bool.parse(state.pathParameters["goBack"].toString());
            switch (globals.publishedTheme) {
              case "second":
                return theme2.LoginScreen(goBack);
              case "third":
                return theme3.LoginScreen(goBack);
              case "fourth":
                return theme4.LoginScreen(goBack);
              case "fifth":
                return theme5.LoginScreen(goBack);
              case "sixth":
                return theme6.LoginScreen(goBack);
              default:
                return theme1.LoginScreen(goBack);
            }
          },
        ),
        GoRoute(
          path: Routes.dashboardScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.DashboardScreen();
              case "third":
                return theme3.DashboardScreen();
              case "fourth":
                return theme4.DashboardScreen();
              case "fifth":
                return theme5.DashboardScreen();
              case "sixth":
                return theme6.DashboardScreen();
              default:
                return theme1.DashboardScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.shopNotValidScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ShopNotValidScreen();
              case "third":
                return theme3.ShopNotValidScreen();
              case "fourth":
                return theme4.ShopNotValidScreen();
              case "fifth":
                return theme5.ShopNotValidScreen();
              case "sixth":
                return theme6.ShopNotValidScreen();
              default:
                return theme1.ShopNotValidScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.homeScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.HomeScreen();
              case "third":
                return theme3.HomeScreen();
              case "fourth":
                return theme4.HomeScreen();
              case "fifth":
                return theme5.HomeScreen();
              case "sixth":
                return theme6.HomeScreen();
              default:
                return theme1.HomeScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.customerDataNotFoundScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CustomerDataNotFoundScreen();
              case "third":
                return theme3.CustomerDataNotFoundScreen();
              case "fourth":
                return theme4.CustomerDataNotFoundScreen();
              case "fifth":
                return theme5.CustomerDataNotFoundScreen();
              case "sixth":
                return theme6.CustomerDataNotFoundScreen();
              default:
                return theme1.CustomerDataNotFoundScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.splashScreen,
          builder: (_, __) {
            debugPrint(
                "--------route to splashScreen ${globals.publishedTheme}--------------");
            switch (globals.publishedTheme) {
              case "second":
                return theme2.SplashScreen();
              case "third":
                return theme3.SplashScreen();
              case "fourth":
                return theme4.SplashScreen();
              case "fifth":
                return theme5.SplashScreen();
              case "sixth":
                return theme6.SplashScreen();
              default:
                return theme1.SplashScreen();
            }
          },
        ),

        //  GoRoute(
        //    path: onBoardingScreen ,
        //    builder: (_, __) => OnBoardingScreen()
        //  ),
        //  GoRoute(
        //    path: onBoardingTwoScreen,
        //    builder: (_, __) => OnBoardingTwoScreen()
        //  ),

        GoRoute(
          path: Routes.productFilterScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.ProductFilterScreen productFilterScreen =
                    state.extra as theme2.ProductFilterScreen;
                return theme2.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
              case "third":
                theme3.ProductFilterScreen productFilterScreen =
                    state.extra as theme3.ProductFilterScreen;
                return theme3.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
              case "fourth":
                theme4.ProductFilterScreen productFilterScreen =
                    state.extra as theme4.ProductFilterScreen;
                return theme4.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
              case "fifth":
                theme5.ProductFilterScreen productFilterScreen =
                    state.extra as theme5.ProductFilterScreen;
                return theme5.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
              case "sixth":
                theme6.ProductFilterScreen productFilterScreen =
                    state.extra as theme6.ProductFilterScreen;
                return theme6.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
              default:
                theme1.ProductFilterScreen productFilterScreen =
                    state.extra as theme1.ProductFilterScreen;
                return theme1.ProductFilterScreen(
                    productFilterScreen.FilterHandle);
            }
          },
        ),
        GoRoute(
          path: Routes.forgotPassScreen,
          builder: (_, state) {
            // bool goBack = state.extra as bool;
            switch (globals.publishedTheme) {
              case "second":
                theme2.ForgetPassScreen forgotPassScreen =
                    state.extra as theme2.ForgetPassScreen;
                return theme2.ForgetPassScreen(forgotPassScreen.goBack);
              case "third":
                theme3.ForgetPassScreen forgotPassScreen =
                    state.extra as theme3.ForgetPassScreen;
                return theme3.ForgetPassScreen(forgotPassScreen.goBack);
              case "fourth":
                theme4.ForgetPassScreen forgotPassScreen =
                    state.extra as theme4.ForgetPassScreen;
                return theme4.ForgetPassScreen(forgotPassScreen.goBack);
              case "fifth":
                theme5.ForgetPassScreen forgotPassScreen =
                    state.extra as theme5.ForgetPassScreen;
                return theme5.ForgetPassScreen(forgotPassScreen.goBack);
              case "sixth":
                theme6.ForgetPassScreen forgotPassScreen =
                    state.extra as theme6.ForgetPassScreen;
                return theme6.ForgetPassScreen(forgotPassScreen.goBack);
              default:
                theme1.ForgetPassScreen forgotPassScreen =
                    state.extra as theme1.ForgetPassScreen;
                return theme1.ForgetPassScreen(forgotPassScreen.goBack);
            }
          },
        ),
        GoRoute(
          path: Routes.notificationscreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.NotificationScreen();
              case "third":
                return theme3.NotificationScreen();
              case "fourth":
                return theme4.NotificationScreen();
              case "fifth":
                return theme5.NotificationScreen();
              case "sixth":
                return theme6.NotificationScreen();
              default:
                return theme1.NotificationScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.productDetailsScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme2.ProductDetailsScreen;
                return theme2.ProductDetailsScreen(productDetailsScreen.ids);
              case "third":
                theme3.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme3.ProductDetailsScreen;
                return theme3.ProductDetailsScreen(productDetailsScreen.ids);
              case "fourth":
                theme4.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme4.ProductDetailsScreen;
                return theme4.ProductDetailsScreen(productDetailsScreen.ids);
              case "fifth":
                theme5.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme5.ProductDetailsScreen;
                return theme5.ProductDetailsScreen(productDetailsScreen.ids);
              case "sixth":
                theme6.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme6.ProductDetailsScreen;
                return theme6.ProductDetailsScreen(productDetailsScreen.ids);
              default:
                theme1.ProductDetailsScreen productDetailsScreen =
                    state.extra as theme1.ProductDetailsScreen;
                return theme1.ProductDetailsScreen(productDetailsScreen.ids);
            }
          },
        ),
        GoRoute(
          path: Routes.cartScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CartScreen();
              case "third":
                return theme3.CartScreen();
              case "fourth":
                return theme4.CartScreen();
              case "fifth":
                return theme5.CartScreen();
              case "sixth":
                return theme6.CartScreen();
              default:
                return theme1.CartScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.myProfile,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.MyProfileScreen();
              case "third":
                return theme3.MyProfileScreen();
              case "fourth":
                return theme4.MyProfileScreen();
              case "fifth":
                return theme5.MyProfileScreen();
              case "sixth":
                return theme6.MyProfileScreen();
              default:
                return theme1.MyProfileScreen();
            }
          },
        ),
        GoRoute(
          name: Routes.webCheckoutScreen,
          path: Routes.webCheckoutScreen + "/:url",
          builder: (_, state) {
            String url = state.pathParameters["url"].toString();
            switch (globals.publishedTheme) {
              case "second":
                return theme2.WebCheckoutScreen(url);
              case "third":
                return theme3.WebCheckoutScreen(url);
              case "fourth":
                return theme4.WebCheckoutScreen(url);
              case "fifth":
                return theme5.WebCheckoutScreen(url);
              case "sixth":
                return theme6.WebCheckoutScreen(url);
              default:
                return theme1.WebCheckoutScreen(url);
            }
          },
        ),
        GoRoute(
          path: Routes.profileScreen,
          builder: (_, state) {
            bool showappbar = state.extra as bool;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ProfileScreen(showappbar);
              case "third":
                return theme3.ProfileScreen(showappbar);
              case "fourth":
                return theme4.ProfileScreen(showappbar);
              case "fifth":
                return theme5.ProfileScreen(showappbar);
              case "sixth":
                return theme6.ProfileScreen(showappbar);
              default:
                return theme1.ProfileScreen(showappbar);
            }
          },
        ),
        GoRoute(
          name: Routes.addressScreen,
          path: Routes.addressScreen + "/:type",
          builder: (_, state) {
            debugPrint("path is ${state.path}");
            debugPrint("path is ${state.pathParameters}");
            Address? args = state.extra == null
                ? null
                : Address.fromJson(state.extra as Map<String, dynamic> ?? {});
            switch (globals.publishedTheme) {
              case "second":
                return theme2.AddressScreen(
                    args, state.pathParameters["type"].toString());
              case "third":
                return theme3.AddressScreen(
                    args, state.pathParameters["type"].toString());
              case "fourth":
                return theme4.AddressScreen(
                    args, state.pathParameters["type"].toString());
              case "fifth":
                return theme5.AddressScreen(
                    args, state.pathParameters["type"].toString());
              case "sixth":
                return theme6.AddressScreen(
                    args, state.pathParameters["type"].toString());
              default:
                return theme1.AddressScreen(
                    args, state.pathParameters["type"].toString());
            }
          },
        ),
        GoRoute(
          path: Routes.addReviewScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.AddReviewScreen addReviewScreen =
                    state.extra as theme2.AddReviewScreen;
                return theme2.AddReviewScreen(addReviewScreen.product);
              case "third":
                theme3.AddReviewScreen addReviewScreen =
                    state.extra as theme3.AddReviewScreen;
                return theme3.AddReviewScreen(addReviewScreen.product);
              case "fourth":
                theme4.AddReviewScreen addReviewScreen =
                    state.extra as theme4.AddReviewScreen;
                return theme4.AddReviewScreen(addReviewScreen.product);
              case "fifth":
                theme5.AddReviewScreen addReviewScreen =
                    state.extra as theme5.AddReviewScreen;
                return theme5.AddReviewScreen(addReviewScreen.product);
              case "sixth":
                theme6.AddReviewScreen addReviewScreen =
                    state.extra as theme6.AddReviewScreen;
                return theme6.AddReviewScreen(addReviewScreen.product);
              default:
                theme1.AddReviewScreen addReviewScreen =
                    state.extra as theme1.AddReviewScreen;
                return theme1.AddReviewScreen(addReviewScreen.product);
            }
          },
        ),
        GoRoute(
          path: Routes.ratingReviewList,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.RatingReviewListScreen ratingReviewList =
                    state.extra as theme2.RatingReviewListScreen;
                return theme2.RatingReviewListScreen(
                    ratingReviewList.productId);
              case "third":
                theme3.RatingReviewListScreen ratingReviewList =
                    state.extra as theme3.RatingReviewListScreen;
                return theme3.RatingReviewListScreen(
                    ratingReviewList.productId);
              case "fourth":
                theme4.RatingReviewListScreen ratingReviewList =
                    state.extra as theme4.RatingReviewListScreen;
                return theme4.RatingReviewListScreen(
                    ratingReviewList.productId);
              case "fifth":
                theme5.RatingReviewListScreen ratingReviewList =
                    state.extra as theme5.RatingReviewListScreen;
                return theme5.RatingReviewListScreen(
                    ratingReviewList.productId);
              case "sixth":
                theme6.RatingReviewListScreen ratingReviewList =
                    state.extra as theme6.RatingReviewListScreen;
                return theme6.RatingReviewListScreen(
                    ratingReviewList.productId);
              default:
                theme1.RatingReviewListScreen ratingReviewList =
                    state.extra as theme1.RatingReviewListScreen;
                return theme1.RatingReviewListScreen(
                    ratingReviewList.productId);
            }
          },
        ),
        GoRoute(
          path: Routes.ratingReviewFullScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme2.RatingReviewFullViewWidget;
                return theme2.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
              case "third":
                theme3.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme3.RatingReviewFullViewWidget;
                return theme3.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
              case "fourth":
                theme4.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme4.RatingReviewFullViewWidget;
                return theme4.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
              case "fifth":
                theme5.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme5.RatingReviewFullViewWidget;
                return theme5.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
              case "sixth":
                theme6.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme6.RatingReviewFullViewWidget;
                return theme6.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
              default:
                theme1.RatingReviewFullViewWidget ratingReviewFullViewWidget =
                    state.extra as theme1.RatingReviewFullViewWidget;
                return theme1.RatingReviewFullViewWidget(
                    ratingReviewFullViewWidget.reviewList,
                    ratingReviewFullViewWidget.index);
            }
          },
        ),
        GoRoute(
          path: Routes.countryCode,
          name: Routes.countryCode,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CountryCodeScreen();
              case "third":
                return theme3.CountryCodeScreen();
              case "fourth":
                return theme4.CountryCodeScreen();
              case "fifth":
                return theme5.CountryCodeScreen();
              case "sixth":
                return theme6.CountryCodeScreen();
              default:
                return theme1.CountryCodeScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.addressListscreen,
          builder: (_, state) {
            bool isReturn = state.extra as bool;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.AddressListScreen(isReturn);
              case "third":
                return theme3.AddressListScreen(isReturn);
              case "fourth":
                return theme4.AddressListScreen(isReturn);
              case "fifth":
                return theme5.AddressListScreen(isReturn);
              case "sixth":
                return theme6.AddressListScreen(isReturn);
              default:
                return theme1.AddressListScreen(isReturn);
            }
          },
        ),
        GoRoute(
          path: Routes.orderListScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.OrderListScreen();
              case "third":
                return theme3.OrderListScreen();
              case "fourth":
                return theme4.OrderListScreen();
              case "fifth":
                return theme5.OrderListScreen();
              case "sixth":
                return theme6.OrderListScreen();
              default:
                return theme1.OrderListScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.multiStoreScreen,
          builder: (context, state) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.MultiStoreScreen();
              case "third":
                return theme3.MultiStoreScreen();
              case "fourth":
                return theme4.MultiStoreScreen();
              case "fifth":
                return theme5.MultiStoreScreen();
              case "sixth":
                return theme6.MultiStoreScreen();
              default:
                return theme1.MultiStoreScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.changePassScreen,
          builder: (context, state) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ChangePassScreen();
              case "third":
                return theme3.ChangePassScreen();
              case "fourth":
                return theme4.ChangePassScreen();
              case "fifth":
                return theme5.ChangePassScreen();
              case "sixth":
                return theme6.ChangePassScreen();
              default:
                return theme1.ChangePassScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.settingsScreen,
          builder: (context, state) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.SettingScreen();
              case "third":
                return theme3.SettingScreen();
              case "fourth":
                return theme4.SettingScreen();
              case "fifth":
                return theme5.SettingScreen();
              case "sixth":
                return theme6.SettingScreen();
              default:
                return theme1.SettingScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.orderDetailsScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme2.OrderDetailsScreen;
                return theme2.OrderDetailsScreen(orderDetailsScreen.order);
              case "third":
                theme3.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme3.OrderDetailsScreen;
                return theme3.OrderDetailsScreen(orderDetailsScreen.order);
              case "fourth":
                theme4.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme4.OrderDetailsScreen;
                return theme4.OrderDetailsScreen(orderDetailsScreen.order);
              case "fifth":
                theme5.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme5.OrderDetailsScreen;
                return theme5.OrderDetailsScreen(orderDetailsScreen.order);
              case "sixth":
                theme6.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme6.OrderDetailsScreen;
                return theme6.OrderDetailsScreen(orderDetailsScreen.order);
              default:
                theme1.OrderDetailsScreen orderDetailsScreen =
                    state.extra as theme1.OrderDetailsScreen;
                return theme1.OrderDetailsScreen(orderDetailsScreen.order);
            }
          },
        ),
        GoRoute(
          path: Routes.categoryScreen,
          builder: (_, state) {
            bool showappbar = state.extra as bool;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CategoryScreenFromMenu(showappbar);
              case "third":
                return theme3.CategoryScreenFromMenu(showappbar);
              case "fourth":
                return theme4.CategoryScreenFromMenu(showappbar);
              case "fifth":
                return theme5.CategoryScreenFromMenu(showappbar);
              case "sixth":
                return theme6.CategoryScreenFromMenu(showappbar);
              default:
                return theme1.CategoryScreenFromMenu(showappbar);
            }
          },
        ),
        GoRoute(
          path: Routes.categoryScreenAll,
          builder: (_, state) {
            bool showappbar = state.extra as bool;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CategoryScreenFromCollection(showappbar);
              case "third":
                return theme3.CategoryScreenFromCollection(showappbar);
              case "fourth":
                return theme4.CategoryScreenFromCollection(showappbar);
              case "fifth":
                return theme5.CategoryScreenFromCollection(showappbar);
              case "sixth":
                return theme6.CategoryScreenFromCollection(showappbar);
              default:
                return theme1.CategoryScreenFromCollection(showappbar);
            }
          },
        ),
        GoRoute(
          path: Routes.favoriteListScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.FavoriteListScreen();
              case "third":
                return theme3.FavoriteListScreen();
              case "fourth":
                return theme4.FavoriteListScreen();
              case "fifth":
                return theme5.FavoriteListScreen();
              case "sixth":
                return theme6.FavoriteListScreen();
              default:
                return theme1.FavoriteListScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.contactUsScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ContactUsScreen();
              case "third":
                return theme3.ContactUsScreen();
              case "fourth":
                return theme4.ContactUsScreen();
              case "fifth":
                return theme5.ContactUsScreen();
              case "sixth":
                return theme6.ContactUsScreen();
              default:
                return theme1.ContactUsScreen();
            }
          },
        ),
        GoRoute(
          path: Routes.accountDeletionRequestScreen,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return theme2.AccountDeletionRequestScreen();
              case "third":
                return theme3.AccountDeletionRequestScreen();
              case "fourth":
                return theme4.AccountDeletionRequestScreen();
              case "fifth":
                return theme5.AccountDeletionRequestScreen();
              case "sixth":
                return theme6.AccountDeletionRequestScreen();
              default:
                return theme1.AccountDeletionRequestScreen();
            }
          },
        ),

        //    GoRoute(
        //    path: termsOfUseScreen ,
        //    builder: (_, __) => TermsOfUseScreen()
        //  ),
        //    GoRoute(
        //    path: pageScreen ,
        //    builder: (_, __) => PageScreen()
        //  ),
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
        //    GoRoute(
        //    path: passwordUpdateScreen,
        //    builder: (_, __) => PasswordUpdateScreen()
        //  ),
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
        //  GoRoute(
        //    path: blogHandleScreen,
        //    builder: (_, __) => BlogHandleScreen()
        //  ),
        //  GoRoute(
        //    path:pageByIdScreen ,
        //    builder: (_, __) => PageByIdScreen()
        //  ),

        GoRoute(
          path: Routes.blogHandleListScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme2.BlogHandleListScreen;
                return theme2.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
              case "third":
                theme3.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme3.BlogHandleListScreen;
                return theme3.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
              case "fourth":
                theme4.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme4.BlogHandleListScreen;
                return theme4.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
              case "fifth":
                theme5.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme5.BlogHandleListScreen;
                return theme5.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
              case "sixth":
                theme6.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme6.BlogHandleListScreen;
                return theme6.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
              default:
                theme1.BlogHandleListScreen blogHandleListScreen =
                    state.extra as theme1.BlogHandleListScreen;
                return theme1.BlogHandleListScreen(
                  blogHandleListScreen.blogId,
                  title: blogHandleListScreen.title,
                );
            }
          },
        ),
        GoRoute(
          path: Routes.pageViewScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.PageViewScreen pageViewScreen =
                    state.extra as theme2.PageViewScreen;
                return theme2.PageViewScreen(
                  pageViewScreen.id,
                );
              case "third":
                theme3.PageViewScreen pageViewScreen =
                    state.extra as theme3.PageViewScreen;
                return theme3.PageViewScreen(
                  pageViewScreen.id,
                );
              case "fourth":
                theme4.PageViewScreen pageViewScreen =
                    state.extra as theme4.PageViewScreen;
                return theme4.PageViewScreen(
                  pageViewScreen.id,
                );
              case "fifth":
                theme5.PageViewScreen pageViewScreen =
                    state.extra as theme5.PageViewScreen;
                return theme5.PageViewScreen(
                  pageViewScreen.id,
                );
              case "sixth":
                theme6.PageViewScreen pageViewScreen =
                    state.extra as theme6.PageViewScreen;
                return theme6.PageViewScreen(
                  pageViewScreen.id,
                );
              default:
                theme1.PageViewScreen pageViewScreen =
                    state.extra as theme1.PageViewScreen;
                return theme1.PageViewScreen(
                  pageViewScreen.id,
                );
            }
          },
        ),
        GoRoute(
          path: Routes.productListScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.ProductListScreen productListScreen =
                    state.extra as theme2.ProductListScreen;
                return theme2.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
              case "third":
                theme3.ProductListScreen productListScreen =
                    state.extra as theme3.ProductListScreen;
                return theme3.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
              case "fourth":
                theme4.ProductListScreen productListScreen =
                    state.extra as theme4.ProductListScreen;
                return theme4.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
              case "fifth":
                theme5.ProductListScreen productListScreen =
                    state.extra as theme5.ProductListScreen;
                return theme5.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
              case "sixth":
                theme6.ProductListScreen productListScreen =
                    state.extra as theme6.ProductListScreen;
                return theme6.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
              default:
                theme1.ProductListScreen productListScreen =
                    state.extra as theme1.ProductListScreen;
                return theme1.ProductListScreen(
                  productListScreen.collection_id,
                  productListScreen.collection_name,
                );
            }
          },
        ),
        GoRoute(
          path: Routes.stateCodeScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.StateCodeScreen stateCode =
                    state.extra as theme2.StateCodeScreen;
                return theme2.StateCodeScreen(stateCode.cCode);
              case "third":
                theme3.StateCodeScreen stateCode =
                    state.extra as theme3.StateCodeScreen;
                return theme3.StateCodeScreen(stateCode.cCode);
              case "fourth":
                theme4.StateCodeScreen stateCode =
                    state.extra as theme4.StateCodeScreen;
                return theme4.StateCodeScreen(stateCode.cCode);
              case "fifth":
                theme5.StateCodeScreen stateCode =
                    state.extra as theme5.StateCodeScreen;
                return theme5.StateCodeScreen(stateCode.cCode);
              case "sixth":
                theme6.StateCodeScreen stateCode =
                    state.extra as theme6.StateCodeScreen;
                return theme6.StateCodeScreen(stateCode.cCode);
              default:
                theme1.StateCodeScreen stateCode =
                    state.extra as theme1.StateCodeScreen;
                return theme1.StateCodeScreen(stateCode.cCode);
            }
          },
        ),
        GoRoute(
          path: Routes.thanksScreen,
          builder: (_, state) {
            List<String> str = state.extra as List<String>;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ThanksScreen(str.first, str.last);
              case "third":
                return theme3.ThanksScreen(str.first, str.last);
              case "fourth":
                return theme4.ThanksScreen(str.first, str.last);
              case "fifth":
                return theme5.ThanksScreen(str.first, str.last);
              case "sixth":
                return theme6.ThanksScreen(str.first, str.last);
              default:
                return theme1.ThanksScreen(str.first, str.last);
            }
          },
        ),
        GoRoute(
          name: Routes.articleScreen,
          path: Routes.articleScreen + "/:id",
          builder: (_, state) {
            String articleId = state.pathParameters["id"].toString();
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ArticleScreen(articleId);
              case "third":
                return theme3.ArticleScreen(articleId);
              case "fourth":
                return theme4.ArticleScreen(articleId);
              case "fifth":
                return theme5.ArticleScreen(articleId);
              case "sixth":
                return theme6.ArticleScreen(articleId);
              default:
                return theme1.ArticleScreen(articleId);
            }
          },
        ),
        GoRoute(
          path: Routes.searchScreenFull,
          builder: (_, __) {
            switch (globals.publishedTheme) {
              case "second":
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme2.BoostAISearchScreenFull()
                    : theme2.SearchScreenFull();
              case "third":
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme3.BoostAISearchScreenFull()
                    : theme3.SearchScreenFull();
              case "fourth":
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme4.BoostAISearchScreenFull()
                    : theme4.SearchScreenFull();
              case "fifth":
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme5.BoostAISearchScreenFull()
                    : theme5.SearchScreenFull();
              case "sixth":
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme6.BoostAISearchScreenFull()
                    : theme6.SearchScreenFull();
              default:
                return globals.plugins
                        .containsKey(PluginsEnum.BOOST_AI_SEARCH.name)
                    ? theme1.BoostAISearchScreenFull()
                    : theme1.SearchScreenFull();
            }
          },
        ),

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
            switch (globals.publishedTheme) {
              case "second":
                theme2.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme2.WebViewPagesScreen;
                return theme2.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
              case "third":
                theme3.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme3.WebViewPagesScreen;
                return theme3.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
              case "fourth":
                theme4.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme4.WebViewPagesScreen;
                return theme4.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
              case "fifth":
                theme5.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme5.WebViewPagesScreen;
                return theme5.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
              case "sixth":
                theme6.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme6.WebViewPagesScreen;
                return theme6.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
              default:
                theme1.WebViewPagesScreen webViewPagesScreen =
                    state.extra as theme1.WebViewPagesScreen;
                return theme1.WebViewPagesScreen(
                  titleMain: webViewPagesScreen.title,
                  urlToLoad: webViewPagesScreen.url,
                  bodyTags: webViewPagesScreen.body,
                );
            }
          },
        ),
        GoRoute(
          path: Routes.ratingReviewWebViewScreen,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme2.RatingReviewWebViewScreen;
                return theme2.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
              case "third":
                theme3.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme3.RatingReviewWebViewScreen;
                return theme3.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
              case "fourth":
                theme4.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme4.RatingReviewWebViewScreen;
                return theme4.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
              case "fifth":
                theme5.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme5.RatingReviewWebViewScreen;
                return theme5.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
              case "sixth":
                theme6.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme6.RatingReviewWebViewScreen;
                return theme6.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
              default:
                theme1.RatingReviewWebViewScreen ratingReviewWebViewScreen =
                    state.extra as theme1.RatingReviewWebViewScreen;
                return theme1.RatingReviewWebViewScreen(
                  titleMain: ratingReviewWebViewScreen.title,
                  urlToLoad: ratingReviewWebViewScreen.url,
                  bodyTags: ratingReviewWebViewScreen.body,
                );
          }},
        ),
        GoRoute(
          path: Routes.customDashboardPage,
          builder: (_, state) {
            switch (globals.publishedTheme) {
              case "second":
                theme2.CustomPageScreen customPageScreen =
                    state.extra as theme2.CustomPageScreen;
                return theme2.CustomPageScreen(customPageScreen.pageId);
              case "third":
                theme3.CustomPageScreen customPageScreen =
                    state.extra as theme3.CustomPageScreen;
                return theme3.CustomPageScreen(customPageScreen.pageId);
              case "fourth":
                theme4.CustomPageScreen customPageScreen =
                    state.extra as theme4.CustomPageScreen;
                return theme4.CustomPageScreen(customPageScreen.pageId);
              case "fifth":
                theme5.CustomPageScreen customPageScreen =
                    state.extra as theme5.CustomPageScreen;
                return theme5.CustomPageScreen(customPageScreen.pageId);
              case "sixth":
                theme6.CustomPageScreen customPageScreen =
                    state.extra as theme6.CustomPageScreen;
                return theme6.CustomPageScreen(customPageScreen.pageId);
              default:
                theme1.CustomPageScreen customPageScreen =
                    state.extra as theme1.CustomPageScreen;
                return theme1.CustomPageScreen(customPageScreen.pageId);
            }
          },
        ),
        GoRoute(
          path: Routes.collectionViewAll,
          builder: (_, state) {
            CollectionGridData collectionGridData =
                state.extra as CollectionGridData;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.CollectionViewAll(collectionGridData);
              case "third":
                return theme3.CollectionViewAll(collectionGridData);
              case "fourth":
                return theme4.CollectionViewAll(collectionGridData);
              case "fifth":
                return theme5.CollectionViewAll(collectionGridData);
              case "sixth":
                return theme6.CollectionViewAll(collectionGridData);
              default:
                return theme1.CollectionViewAll(collectionGridData);
            }
          },
        ),
        GoRoute(
          path: Routes.productViewAll,
          builder: (_, state) {
            ProductGridData productGridData = state.extra as ProductGridData;
            switch (globals.publishedTheme) {
              case "second":
                return theme2.ProductViewAll(productGridData);
              case "third":
                return theme3.ProductViewAll(productGridData);
              case "fourth":
                return theme4.ProductViewAll(productGridData);
              case "fifth":
                return theme5.ProductViewAll(productGridData);
              case "sixth":
                return theme6.ProductViewAll(productGridData);
              default:
                return theme1.ProductViewAll(productGridData);
            }
          },
        ),

        // GoRoute(
        //     path: Routes.presidioStartQuiz,
        //     builder: (_, state) {
        //       print("lksdjfdsfkjsfdlkjsfkjsflkjsfkjsflkjsflkjsflkj");
        //       PresidioQuizBloc presidioStartQuiz =
        //           state.extra as PresidioQuizBloc;
        //       return PresidioStartQuiz();
        //     }),
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

    if (data is theme1.ProductDetailsScreen ||
        data is theme2.ProductDetailsScreen ||
        data is theme3.ProductDetailsScreen ||
        data is theme4.ProductDetailsScreen ||
        data is theme5.ProductDetailsScreen ||
        data is theme6.ProductDetailsScreen) {
      final productDetails = data as dynamic;
      GotoRouteAfterClick(context, route_name, data.ids);
    } else if (data is theme1.ProductListScreen ||
        data is theme2.ProductListScreen ||
        data is theme3.ProductListScreen ||
        data is theme4.ProductListScreen ||
        data is theme5.ProductListScreen ||
        data is theme6.ProductListScreen) {
      final productListScreen = data as dynamic;
      GotoRouteAfterClick(context, route_name, data.collection_id,
          title: data.collection_name);
    } else if (data is ImageBanner) {
      if (button1 != null)
        GotoRouteAfterClick(context, route_name, data.primarybtnId.toString(),
            url: data.primarybtnId);
      if (button2 != null)
        GotoRouteAfterClick(context, route_name, data.secondarybtnId.toString(),
            url: data.secondarybtnId);
    } else if (data is MenuItems) {
      GotoRouteAfterClick(context, route_name, data.resourceId,
          title: data.title!,
          url: data.url,
          handle: data.resource != null ? data.resource!["handle"] : "");
    } else if (data is ImageWithTextData) {
      GotoRouteAfterClick(context, route_name, data.id,
          url: data.id, title: data.productTitle!);
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
      GotoRouteAfterClick(context, route_name, data.id, title: data.text!, url: data.id);
    }
  }

  static GotoRouteAfterClick(
      BuildContext context, String route_name, String? ids,
      {String title = "", String? url = "", String? handle = ""}) async {
    route_name = route_name.toUpperCase();
    Object? tempdata;
    Map<String, String> pathParameters = const <String, String>{};
    debugPrint(
        "Values  . route: ${route_name}, ids:${ids} ,url:${url}, title: ${title}, handle:${handle}");

    if (route_name == Routes.productListScreen ||
        route_name.toLowerCase() == "collection") {
      route_name = "/${Routes.productListScreen}";

      switch (globals.publishedTheme) {
        case "second":
          tempdata = theme2.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
        case "third":
          tempdata = theme3.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
        case "fourth":
          tempdata = theme4.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
        case "fifth":
          tempdata = theme5.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
        case "sixth":
          tempdata = theme6.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
        default:
          tempdata = theme1.ProductListScreen(
              ids!.replaceAll("gid://shopify/Collection/", ""), title);
      }
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
        switch (globals.publishedTheme) {
          case "second":
            tempdata = theme2.BlogHandleListScreen(ids, title: title);
          case "third":
            tempdata = theme3.BlogHandleListScreen(ids, title: title);
          case "fourth":
            tempdata = theme4.BlogHandleListScreen(ids, title: title);
          case "fifth":
            tempdata = theme5.BlogHandleListScreen(ids, title: title);
          case "sixth":
            tempdata = theme6.BlogHandleListScreen(ids, title: title);
          default:
            tempdata = theme1.BlogHandleListScreen(ids, title: title);
        }
      } else {
        switch (globals.publishedTheme) {
          case "second":
            tempdata = theme2.BlogHandleListScreen(handle!, title: title);
          case "third":
            tempdata = theme3.BlogHandleListScreen(handle!, title: title);
          case "fourth":
            tempdata = theme4.BlogHandleListScreen(handle!, title: title);
          case "fifth":
            tempdata = theme5.BlogHandleListScreen(handle!, title: title);
          case "sixth":
            tempdata = theme6.BlogHandleListScreen(handle!, title: title);
          default:
            tempdata = theme1.BlogHandleListScreen(handle!, title: title);
        }
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
        switch (globals.publishedTheme) {
          case "second":
            tempdata = theme2.PageViewScreen(ids);
          case "third":
            tempdata = theme3.PageViewScreen(ids);
          case "fourth":
            tempdata = theme4.PageViewScreen(ids);
          case "fifth":
            tempdata = theme5.PageViewScreen(ids);
          case "sixth":
            tempdata = theme6.PageViewScreen(ids);
          default:
            tempdata = theme1.PageViewScreen(ids);
        }
      } else {
        String handle = Utils.extractFirstWordFromLastSegment(url!);
        debugPrint("------------handle $handle-----");
        switch (globals.publishedTheme) {
          case "second":
            tempdata = theme2.PageViewScreen(handle);
          case "third":
            tempdata = theme3.PageViewScreen(handle);
          case "fourth":
            tempdata = theme4.PageViewScreen(handle);
          case "fifth":
            tempdata = theme5.PageViewScreen(handle);
          case "sixth":
            tempdata = theme6.PageViewScreen(handle);
          default:
            tempdata = theme1.PageViewScreen(handle);
        }
      }
      route_name = "/${Routes.pageViewScreen}";
    } else if (route_name == Routes.productDetailsScreen) {
      switch (globals.publishedTheme) {
        case "second":
          tempdata = theme2.ProductDetailsScreen(ids!);
        case "third":
          tempdata = theme3.ProductDetailsScreen(ids!);
        case "fourth":
          tempdata = theme4.ProductDetailsScreen(ids!);
        case "fifth":
          tempdata = theme5.ProductDetailsScreen(ids!);
        case "sixth":
          tempdata = theme6.ProductDetailsScreen(ids!);
        default:
          tempdata = theme1.ProductDetailsScreen(ids!);
      }
      route_name = "/${Routes.productDetailsScreen}";
    } else if (route_name == Routes.webUrlScreen ||
        route_name == Routes.shopPolicyScreen) {
      switch (globals.publishedTheme) {
        case "second":
          tempdata = theme2.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
        case "third":
          tempdata = theme3.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
        case "fourth":
          tempdata = theme4.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
        case "fifth":
          tempdata = theme5.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
        case "sixth":
          tempdata = theme6.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
        default:
          tempdata = theme1.WebViewPagesScreen(
            titleMain: title,
            urlToLoad: url!,
            bodyTags: "",
          );
      }
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
      switch (globals.publishedTheme) {
        case "second":
          tempdata = theme2.CustomPageScreen(ids);
        case "third":
          tempdata = theme3.CustomPageScreen(ids);
        case "fourth":
          tempdata = theme4.CustomPageScreen(ids);
        case "fifth":
          tempdata = theme5.CustomPageScreen(ids);
        case "sixth":
          tempdata = theme6.CustomPageScreen(ids);
        default:
          tempdata = theme1.CustomPageScreen(ids);
      }
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
