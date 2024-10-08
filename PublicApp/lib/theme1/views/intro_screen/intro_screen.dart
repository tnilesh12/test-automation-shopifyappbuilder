import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/intro_screen_bloc/intro_screen_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../utils/theme_size.dart';
import '/theme1/views/auth/login/login_screen.dart';
import '/theme1/views/auth/signup/sign_up_screen.dart';
import '/theme1/views/widgets/common/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/theme1/views/widgets/common/gap_widget.dart';
import 'package:shopify_code/globels.dart' as globals;

class IntroScreen extends StatelessWidget {
  // String defaultFontFamily = 'Roboto-Light.ttf';
  // double defaultFontSize = 14;
  // double defaultIconSize = 17;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroScreenBloc(),
      child: BlocListener<IntroScreenBloc, IntroScreenState>(
        listener: (context, state) {
          // TODO: implement listener}
          if (state is IntroScreenUserLogin) {
            context.pushReplacement("/${Routes.dashboardScreen}");
          }
        },
        child: Scaffold(
          body: Container(
            // padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                    // height : 350,
                    height: MediaQuery.of(context).size.height * .5,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppTheme.primaryColor),
                  ),
                ),
                // Positioned(
                //   top: 240,
                //   left: 0,
                //   right: 0,
                //   child: _buildContainer(context),
                // ),
                _buildContainer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
            ),
            Container(
                // height: MediaQuery.of(context).size.height / 3.5,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(top: 60),
                child: globals.partnerInfoModel.appSettings != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: WidgetImage(globals.partnerInfoModel
                                    .appSettings!.appIconSrc!)),
                          ),
                          GapWidget(
                            size: -10,
                          ),
                          Text(
                            globals.partnerInfoModel.appSettings != null
                                ? globals.partnerInfoModel.appSettings!.appName!
                                : globals.partnerInfoModel.name != null
                                    ? globals.partnerInfoModel.name!
                                    : "",
                            style: CustomTextTheme.getTextStyle(
                              MyTextStyle.Heading,
                              context,
                            ).copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    : Text(
                        globals.partnerInfoModel.appSettings != null
                            ? globals.partnerInfoModel.appSettings!.appName!
                            : globals.partnerInfoModel.name != null
                                ? globals.partnerInfoModel.name!
                                : "",
                        style: CustomTextTheme.getTextStyle(
                          MyTextStyle.Heading,
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                      )),
            GapWidget(
              size: -5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ThemeSize.themeBorderRadius),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    ThemeSize.themeBorderRadius,
                  )),
                  elevation: ThemeSize.themeElevation,
                  // color: AppTheme.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    // height: 480,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("Login"),
                        CustomButton(
                          text: LanguageManager.translations()["SignIn"] ?? "",
                          onPressed: () {
                            context.pushNamed("${Routes.loginScreen}",
                                pathParameters: {"goBack": false.toString()},
                                extra: null);
                          },
                        ),
                        GapWidget(),
                        CustomButton(
                          text: LanguageManager.translations()["SignUp"],
                          onPressed: () {
                            // context.push("/${Routes.signUpScreen}");
                            SignUpScreen signUpScreen = SignUpScreen(false);
                            context.push("/${Routes.signUpScreen}",
                                extra: signUpScreen);
                          },
                        ),
                        GapWidget(),
                        CustomButton(
                          text: LanguageManager.translations()["GuestUser"],
                          onPressed: () {
                            context
                                .pushReplacement("/${Routes.dashboardScreen}");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/*
  Widget _buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            ThemeSize.themeBorderRadius,
          )),
          elevation: ThemeSize.themeElevation,
          // color: AppTheme.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            // height: 480,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Login"),
                CustomButton(
                  text: LanguageManager.translations()["SignIn"] ?? "",
                  onPressed: () {
                    LoginScreen loginScreen = LoginScreen(false);
                    context.push("/${Routes.loginScreen}", extra: loginScreen);
                  },
                ),
                GapWidget(),
                CustomButton(
                  text: LanguageManager.translations()["SignUp"],
                  onPressed: () {
                    // context.push("/${Routes.signUpScreen}");
                    SignUpScreen signUpScreen = SignUpScreen(false);
                    context.push("/${Routes.signUpScreen}",
                        extra: signUpScreen);
                  },
                ),
                GapWidget(),
                CustomButton(
                  text: LanguageManager.translations()["GuestUser"],
                  onPressed: () {
                    context.pushReplacement("/${Routes.dashboardScreen}");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
*/
}
