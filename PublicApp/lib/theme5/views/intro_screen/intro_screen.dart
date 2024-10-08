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
import '/theme5/views/auth/login/login_screen.dart';
import '/theme5/views/auth/signup/sign_up_screen.dart';
import '/theme5/views/widgets/common/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/theme5/views/widgets/common/gap_widget.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // String defaultFontFamily = 'Roboto-Light.ttf';
  List<String> sliderImages = [];

  final CarouselSliderController carouselController = CarouselSliderController();

  Color indicatorSelectedColor = AppTheme.appBarTextColor!;

  Color indicatorUnSelectedColor = AppTheme.appBarTextColor!.withAlpha(80);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
            .splashImages.imageOne !=
        null) {
      sliderImages.add(globals
          .Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
          .splashImages
          .imageOne);
    }
    if (globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
            .splashImages.imageTwo !=
        null) {
      sliderImages.add(globals
          .Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
          .splashImages
          .imageTwo);
    }
    if (globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
            .splashImages.imageThree !=
        null) {
      sliderImages.add(globals
          .Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
          .splashImages
          .imageThree);
    }
  }

  int currentIndex = 0;

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
          resizeToAvoidBottomInset: false,
          body: Container(
            // padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(25),
                  //     bottomRight: Radius.circular(25)),
                  child: Container(
                      // height : 350,
                      height: MediaQuery.of(context).size.height * .60,
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppTheme.primaryColor),
                      child: _buildContainerTop(context)),
                ),
                _buildContainer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerTop(BuildContext context) {
    return (sliderImages.isEmpty)
        ? Container(
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
                            child: WidgetImage(globals
                                .partnerInfoModel.appSettings!.appIconSrc!)),
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
                        ).copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.appBarTextColor),
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
                    ).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.appBarTextColor),
                  ))
        : _buildSlider(context);
  }

  Widget _buildContainer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        // height: 480,
        height: MediaQuery.of(context).size.height * .40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Login"),
            CustomButton(
              text: LanguageManager.translations()["SignIn"] ?? "",
              onPressed: () {
                context.pushNamed("${Routes.loginScreen}",
                    pathParameters: {"goBack": false.toString()}, extra: null);
              },
            ),
            GapWidget(),
            CustomButton(
              text: LanguageManager.translations()["SignUp"],
              onPressed: () {
                // context.push("/${Routes.signUpScreen}");
                SignUpScreen signUpScreen = SignUpScreen(false);
                context.push("/${Routes.signUpScreen}", extra: signUpScreen);
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
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .6,
            child: CarouselSlider(
              items: [
                // print("-----intro screen-----${globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name].splashImages.imageOne}------------");
                // return
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  // height: 30,
                  child: WidgetImage(globals
                      .Settings[
                          SettingsEnum.Show_Intro_Screen_At_App_Start.name]
                      .splashImages
                      .imageOne),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  // height: 30,
                  child: WidgetImage(globals
                      .Settings[
                          SettingsEnum.Show_Intro_Screen_At_App_Start.name]
                      .splashImages
                      .imageTwo),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  // height: 30,
                  child: WidgetImage(globals
                      .Settings[
                          SettingsEnum.Show_Intro_Screen_At_App_Start.name]
                      .splashImages
                      .imageThree),
                )
                // },
              ],
              carouselController: carouselController,
              options: CarouselOptions(
                  enlargeCenterPage: false, //myBool,
                  autoPlay: false,
                  height: MediaQuery.of(context).size.height * .6, //180
                  // aspectRatio: 0.93, //16 / 9,
                  // aspectRatio: widget.imageBannerSliderData.sliderAspectRatio!,
                  autoPlayCurve: Curves.linear,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enableInfiniteScroll: true,
                  viewportFraction: 1, // 0.88,
                  // autoPlayAnimationDuration: Duration(seconds: widget.imageBannerSliderData.changeSlidesEvery!),
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
          sliderImages.length > 1
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5,
                  child: Container(
                      height: 15,
                      child: Container(
                        width: (sliderImages.length * 28),
                        height: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: AppTheme.primaryLightTextColor!.withAlpha(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliderImages.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentIndex == entry.key ? 20 : 20,
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == entry.key
                                        ? indicatorSelectedColor
                                        : indicatorUnSelectedColor),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                )
              : Container(),
        ],
      ),
    );
  }
}


                    /*Container(
                      // width: 150,
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * .25,
                      color: Colors.blueAccent,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          // itemCount: 3,
                          // itemBuilder: (context, index) {
                          children: [
                            // print("-----intro screen-----${globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name].splashImages.imageOne}------------");
                            // return
                            Container(
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: WidgetImage(globals
                                  .Settings[SettingsEnum
                                      .Show_Intro_Screen_At_App_Start.name]
                                  .splashImages
                                  .imageOne),
                            ),
                            Container(
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: WidgetImage(globals
                                  .Settings[SettingsEnum
                                      .Show_Intro_Screen_At_App_Start.name]
                                  .splashImages
                                  .imageTwo),
                            ),
                            Container(
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 30,
                              child: WidgetImage(globals
                                  .Settings[SettingsEnum
                                      .Show_Intro_Screen_At_App_Start.name]
                                  .splashImages
                                  .imageThree),
                            )
                            // },
                          ]),
                    ),
                    */