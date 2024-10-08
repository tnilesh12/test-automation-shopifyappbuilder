import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:publicapp/common/bloc/intro_screen_bloc/intro_screen_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../utils/theme_size.dart';
import '/theme4/views/auth/login/login_screen.dart';
import '/theme4/views/auth/signup/sign_up_screen.dart';
import '/theme4/views/widgets/common/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/theme4/views/widgets/common/gap_widget.dart';
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
            color: Colors.white.withOpacity(0.5),
            // padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                (globals
                                .Settings[SettingsEnum
                                    .Show_Intro_Screen_At_App_Start.name]
                                .splashImages
                                .imageOne !=
                            null ||
                        globals
                                .Settings[SettingsEnum
                                    .Show_Intro_Screen_At_App_Start.name]
                                .splashImages
                                .imageTwo !=
                            null ||
                        globals
                                .Settings[SettingsEnum
                                    .Show_Intro_Screen_At_App_Start.name]
                                .splashImages
                                .imageThree !=
                            null)
                    ? Container(
                        color: Colors.white.withOpacity(0.5),
                        height: MediaQuery.of(context).size.height,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 1,
                              height: MediaQuery.of(context).size.height,
                              autoPlay: true),
                          items: [
                            // print("-----intro screen-----${globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name].splashImages.imageOne}------------");
                            // return
                            globals
                                        .Settings[SettingsEnum
                                            .Show_Intro_Screen_At_App_Start
                                            .name]
                                        .splashImages
                                        .imageOne !=
                                    null
                                ? Container(
                                    color: Colors.blue.shade50,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    child: WidgetImage(
                                        fit: BoxFit.cover,
                                        globals
                                            .Settings[SettingsEnum
                                                .Show_Intro_Screen_At_App_Start
                                                .name]
                                            .splashImages
                                            .imageOne),
                                  )
                                : Container(),
                            globals
                                        .Settings[SettingsEnum
                                            .Show_Intro_Screen_At_App_Start
                                            .name]
                                        .splashImages
                                        .imageTwo !=
                                    null
                                ? Container(
                                    color: Colors.blue.shade50,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    child: WidgetImage(globals
                                        .Settings[SettingsEnum
                                            .Show_Intro_Screen_At_App_Start
                                            .name]
                                        .splashImages
                                        .imageTwo),
                                  )
                                : Container(),
                            globals
                                        .Settings[SettingsEnum
                                            .Show_Intro_Screen_At_App_Start
                                            .name]
                                        .splashImages
                                        .imageThree !=
                                    null
                                ? Container(
                                    color: Colors.blue.shade50,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 30,
                                    child: WidgetImage(globals
                                        .Settings[SettingsEnum
                                            .Show_Intro_Screen_At_App_Start
                                            .name]
                                        .splashImages
                                        .imageThree),
                                  )
                                : Container()
                            // },
                          ],
                        ),
                      )
                    : Container(),

                Container(
                  color: Colors.white.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height,
                ),

                // ClipRRect(
                //   borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(25),
                //       bottomRight: Radius.circular(25)),
                //   child: Container(
                //     // height : 350,
                //     height: MediaQuery.of(context).size.height * .5,
                //     width: double.infinity,
                //     decoration: BoxDecoration(color: AppTheme.primaryColor),
                //   ),
                // ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: _buildContainer(context),
                ),
                // _buildContainer(context),
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
                            style:
                                // TextStyle(
                                //     fontSize: 30,
                                //     fontWeight: FontWeight.bold,
                                //     backgroundColor:
                                //         Colors.white.withOpacity(0.5))
                                CustomTextTheme.getTextStyle(
                              MyTextStyle.Heading,
                              context,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 150,
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
              size: -10,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Login"),
                  InkWell(
                    onTap: () {
                      // context.push("/${Routes.signUpScreen}");
                      context.pushNamed("${Routes.loginScreen}",
                          pathParameters: {"goBack": false.toString()},
                          extra: null);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ThemeSize.themeButtonSize,
                      width: double.infinity,
                      // child: ElevatedButton(
                      padding: EdgeInsets.all(10.0),
                      // onPressed: () {},
                      child: Text(
                        LanguageManager.translations()["SignIn"] ?? "",
                        style: TextStyle(
                            color: AppTheme.primaryButtonText!, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: AppTheme
                              .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                          ),
                    ),
                  ),
                  GapWidget(),

                  InkWell(
                    onTap: () {
                      // context.push("/${Routes.signUpScreen}");
                      SignUpScreen signUpScreen = SignUpScreen(false);
                      context.push("/${Routes.signUpScreen}",
                          extra: signUpScreen);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ThemeSize.themeButtonSize,
                      width: double.infinity,
                      // child: ElevatedButton(
                      padding: EdgeInsets.all(10.0),
                      // onPressed: () {},
                      child: Text(
                        LanguageManager.translations()["SignUp"],
                        style: TextStyle(
                            color: AppTheme.primaryButtonText!, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: AppTheme
                              .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                          ),
                    ),
                  ),
                  GapWidget(),

                  InkWell(
                    onTap: () {
                      context.pushReplacement("/${Routes.dashboardScreen}");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ThemeSize.themeButtonSize,
                      width: double.infinity,
                      // child: ElevatedButton(
                      padding: EdgeInsets.all(10.0),
                      // onPressed: () {},
                      child: Text(
                        LanguageManager.translations()["GuestUser"],
                        style: TextStyle(
                            color: AppTheme.primaryButtonText!, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: AppTheme
                              .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                          ),
                    ),
                  )
                ],
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
