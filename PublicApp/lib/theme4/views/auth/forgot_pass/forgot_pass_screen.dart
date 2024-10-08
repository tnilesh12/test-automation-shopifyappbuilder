import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import 'package:publicapp/common/bloc/forgot_pass_screen_bloc/forgot_password_bloc.dart';
import 'package:publicapp/common/bloc/forgot_pass_screen_bloc/forgot_password_event.dart';
import 'package:publicapp/common/bloc/forgot_pass_screen_bloc/forgot_password_state.dart';
import '/theme4/views/auth/signup/sign_up_screen.dart';
import '/theme4/views/widgets/common/custom_button.dart';
import '/theme4/views/widgets/common/custom_dialog_button.dart';
import '/theme4/views/widgets/common/custom_textfield.dart';
import '/theme4/views/widgets/common/gap_widget.dart';
import '/theme4/views/widgets/common/link_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassScreen extends StatelessWidget {
  bool goBack;
  ForgetPassScreen(this.goBack);
  // String defaultFontFamily = 'Roboto-Light.ttf';
  // double defaultFontSize = 14;
  // double defaultIconSize = 17;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(25),
            //       bottomRight: Radius.circular(25)),
            //   child: Container(
            //     // height : 350,
            //     height: MediaQuery.of(context).size.height * .5,
            //     width: double.infinity,
            //     decoration: BoxDecoration(color: AppTheme.primaryColor
            //         // gradient: LinearGradient(
            //         //   colors: [
            //         //     AppTheme.black!.withOpacity(0.9),
            //         //     AppTheme.borderColor!
            //         //   ],
            //         //   begin: Alignment.bottomLeft,
            //         //   end: Alignment.topRight,
            //         // ),
            //         ),
            //   ),
            // ),
            globals.Settings[SettingsEnum.Show_Intro_Screen_At_App_Start.name]
                        .splashImages.imageOne !=
                    null
                ? Container(
                    color: Colors.blue.shade50,
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height,
                    child: WidgetImage(
                        fit: BoxFit.cover,
                        globals
                            .Settings[SettingsEnum
                                .Show_Intro_Screen_At_App_Start.name]
                            .splashImages
                            .imageOne),
                  )
                : Container(),
            Container(
              color: Colors.white.withOpacity(0.2),
              height: MediaQuery.of(context).size.height,
            ),
            // Positioned(
            //   top: 240,
            //   left: 0,
            //   right: 0,
            //   child: _buildContainer(context, goBack),
            // ),
            _buildContainer(context, goBack)
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, bool goBack) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccessState) {
              Dialogs.SuccessAlertInOut(
                context: context,
                message: LanguageManager.translations()['passwordResetLink'],
              );
            }
            if (state is ForgotPasswordAPIFailureState) {
              Dialogs.ErrorAlertInOut(
                context: context,
                message: LanguageManager.translations()['somethingWentWrong'],
              );
            }
          },
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: goBack ? 45 : 75,
                      ),
                      goBack
                          ? Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                  top: 0, left: 20, right: 10, bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width:
                                          35, //MediaQuery.of(context).size.width * 0.09,
                                      height:
                                          35, //MediaQuery.of(context).size.height * 0.09,
                                      padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                      child: SvgPicture.asset(
                                          "assets/images/close-icon.svg",
                                          colorFilter: ColorFilter.mode(
                                              AppTheme.appBarTextColor!,
                                              BlendMode.srcIn)),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: WidgetImage(globals
                                              .partnerInfoModel
                                              .appSettings!
                                              .appIconSrc!)),
                                    ),
                                    GapWidget(
                                      size: -10,
                                    ),
                                    Text(
                                      globals.partnerInfoModel.appSettings !=
                                              null
                                          ? globals.partnerInfoModel
                                              .appSettings!.appName!
                                          : globals.partnerInfoModel.name !=
                                                  null
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
                                      ? globals.partnerInfoModel.appSettings!
                                          .appName!
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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 220,
                            ),

                            Text(
                              LanguageManager.translations()[
                                  "Forgotyourpassword"],
                              style: CustomTextTheme.getTextStyle(
                                MyTextStyle.Heading,
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            GapWidget(
                              size: 10,
                            ),
                            // Text("Login"),
                            CustomTextFormField()
                                .SimpleTextFormFieldWithPrefixIcon(
                                  
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: LanguageManager.translations()["Email"],
                              prefixIcon: "assets/images/Email.svg",
                              context: context,
                            ),
                            GapWidget(size: 10),
                            state is ForgotPasswordSubmittingState
                                ? CustomDialogButton()
                                : InkWell(
                                    onTap: () {
                                      if (emailController.text.isEmpty) {
                                        Dialogs.ErrorAlertInOut(
                                            context: context,
                                            message:
                                                LanguageManager.translations()[
                                                    'emailRequired']);
                                      } else if (!Validations.emailValidation(
                                          emailController.text)) {
                                        Dialogs.ErrorAlertInOut(
                                            context: context,
                                            message:
                                                LanguageManager.translations()[
                                                    'emailInvalid']);
                                      } else {
                                        context.read<ForgotPasswordBloc>().add(
                                            onForgotPasswordButtonClick(
                                                emailController.text.trim()));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: ThemeSize.themeButtonSize,
                                      width: double.infinity,
                                      // child: ElevatedButton(
                                      padding: EdgeInsets.all(10.0),
                                      // onPressed: () {},
                                      child: Text(
                                        LanguageManager.translations()[
                                            "Forgotyourpassword"],
                                        style: TextStyle(
                                            color: AppTheme.primaryButtonText!,
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      decoration: BoxDecoration(
                                          // shape: BoxShape.circle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40)),
                                          color: AppTheme
                                              .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                                          ),
                                    ),
                                  ),

                            GapWidget(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    LanguageManager.translations()[
                                        "Donothaveanaccount"],
                                    style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.SimpleText, context),
                                    // style: TextStyle(
                                    //   color: Color(0xFF666666),
                                    //   fontFamily: AppTheme.bodyFont,
                                    //   fontSize: 15,
                                    //   fontStyle: FontStyle.normal,
                                    // ),
                                  ),
                                ),
                                GapWidget(size: -10),
                                LinkButton(
                                    text: LanguageManager.translations()[
                                        "SignUp"],
                                    onPressed: () {
                                      SignUpScreen signUpScreen =
                                          SignUpScreen(goBack);
                                      context.pushReplacement(
                                          "/${Routes.signUpScreen}",
                                          extra: signUpScreen);
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

/*
  Widget _buildContainer(BuildContext context, GlobalKey<FormState> _formKey) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccessState) {
              Dialogs.SuccessAlertInOut(
                context: context,
                message: "We have sent a password reset link to your mail ID.",
              );
            }
            if (state is ForgotPasswordAPIFailureState) {
              Dialogs.ErrorAlertInOut(
                context: context,
                message: "Something went wrong, Please try again later.",
              );
            }
          },
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            builder: (context, state) {
              return Container(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      // height: 480,
                      //  height: MediaQuery.of(context).size.height / 2,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LanguageManager.translations()[
                                  "Forgotyourpassword"],
                              style: CustomTextTheme.getTextStyle(
                                MyTextStyle.Heading,
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            GapWidget(
                              size: 10,
                            ),
                            // Text("Login"),
                            CustomTextFormField()
                                .SimpleTextFormFieldWithPrefixIcon(
                              controller: emailController,
                              hintText: LanguageManager.translations()["Email"],
                              prefixIcon: "assets/images/Email.svg",
                              context: context,
                            ),
                            GapWidget(size: 10),
                            state is ForgotPasswordSubmittingState
                                ? CustomDialogButton()
                                : CustomButton(
                                    text: LanguageManager.translations()[
                                        "Forgotyourpassword"],
                                    onPressed: () {
                                      if (emailController.text.isEmpty) {
                                        Dialogs.ErrorAlertInOut(
                                            context: context,
                                            message: "Email is required");
                                      } else if (!Validations.emailValidation(
                                          emailController.text)) {
                                        Dialogs.ErrorAlertInOut(
                                            context: context,
                                            message: "Email is Invalid");
                                      } else {
                                        context.read<ForgotPasswordBloc>().add(
                                            onForgotPasswordButtonClick(
                                                emailController.text.trim()));
                                      }
                                    },
                                  ),
                            GapWidget(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    LanguageManager.translations()[
                                        "Donothaveanaccount"],
                                    style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.SimpleText, context),
                                    // style: TextStyle(
                                    //   color: Color(0xFF666666),
                                    //   fontFamily: AppTheme.bodyFont,
                                    //   fontSize: 15,
                                    //   fontStyle: FontStyle.normal,
                                    // ),
                                  ),
                                ),
                                GapWidget(size: -10),
                                LinkButton(
                                    text: LanguageManager.translations()[
                                        "SignUp"],
                                    onPressed: () {
                                SignUpScreen signUpScreen = SignUpScreen(false);
                                context.pushReplacement(
                                    "/${Routes.signUpScreen}",
                                    extra: signUpScreen);
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
  */
}
