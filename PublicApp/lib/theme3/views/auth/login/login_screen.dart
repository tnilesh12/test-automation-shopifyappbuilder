import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import '/theme3/views/auth/forgot_pass/forgot_pass_screen.dart';
import 'package:publicapp/common/bloc/login_screen_bloc/login_bloc.dart';
import 'package:publicapp/common/bloc/login_screen_bloc/login_event.dart';
import 'package:publicapp/common/bloc/login_screen_bloc/login_state.dart';
import '/theme3/views/auth/signup/sign_up_screen.dart';
import '../../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '/theme3/views/common_screens/api_failure.dart';
import '/theme3/views/widgets/common/custom_button.dart';
import '/theme3/views/widgets/common/custom_dialog_button.dart';
import '/theme3/views/widgets/common/custom_textfield.dart';
import '/theme3/views/widgets/common/gap_widget.dart';
import '/theme3/views/widgets/common/link_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  bool goBack;
  LoginScreen(this.goBack);
  // double defaultFontSize = 14;
  // double defaultIconSize = 17;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: BoxDecoration(color: AppTheme.primaryColor!),
              ),
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
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (goBack) {
              print("------ context.pop(true);-------");
              context.pop(true);
            } else {
              context.read<CartBloc>().GetFavList();
              // Dialogs.SuccessAlertInOutWithCallBack(
              //     context: context,
              //     message: LanguageManager.translations()["LoginSuccessfully"],
              //     onFinish: () {
              context.pushReplacement("/${Routes.dashboardScreen}");
              // });
            }
          }
          if (state is LoginErrorState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.error);
          }
          if (state is LoginAPIFailureState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.message);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: goBack ? 45 : 75,
                    ),
                    goBack
                        ? Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Container(
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
                                  onPressed: () {
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
                                        borderRadius: BorderRadius.circular(5),
                                        child: WidgetImage(globals
                                            .partnerInfoModel
                                            .appSettings!
                                            .appIconSrc!)),
                                  ),
                                  GapWidget(
                                    size: -10,
                                  ),
                                  Text(
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
                                  )
                                ],
                              )
                            : Text(
                                globals.partnerInfoModel.appSettings != null
                                    ? globals
                                        .partnerInfoModel.appSettings!.appName!
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            // height: 480,
                            // height: MediaQuery.of(context).size.height / 1.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LanguageManager.translations()["Login"],
                                  style: CustomTextTheme.getTextStyle(
                                    MyTextStyle.Heading,
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                GapWidget(
                                  size: 10,
                                ),
                                CustomTextFormField()
                                    .SimpleTextFormFieldWithPrefixIcon(
                                  hintText:
                                      LanguageManager.translations()["Email"],
                                  prefixIcon: "assets/images/Email.svg",
                                  context: context,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                GapWidget(),
                                SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                                  context: context,
                                  controller: passwordController,
                                  hintText: LanguageManager.translations()[
                                      "Password"],
                                  prefixIcon: "assets/images/lock_pass.svg",
                                  obscureText: true,
                                ),
                                GapWidget(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    LinkButton(
                                      text: LanguageManager.translations()[
                                          "Forgotyourpassword"],
                                      onPressed: () {
                                        ForgetPassScreen forgetPassScreen =
                                            ForgetPassScreen(goBack);
                                        context.pushReplacement(
                                            "/${Routes.forgotPassScreen}",
                                            extra: forgetPassScreen);
                                      },
                                    )
                                  ],
                                ),
                                GapWidget(),
                                state is LoginSubmittingState
                                    ? CustomDialogButton()
                                    : CustomButton(
                                        text: LanguageManager.translations()[
                                            "SignIn"],
                                        onPressed: () {
                                          if (emailController.text.isEmpty) {
                                            Dialogs.ErrorAlertInOut(
                                                context: context,
                                                message: LanguageManager
                                                        .translations()[
                                                    'emailRequired']);
                                          } else if (passwordController
                                              .text.isEmpty) {
                                            Dialogs.ErrorAlertInOut(
                                                context: context,
                                                message: LanguageManager
                                                        .translations()[
                                                    'passwordRequired']);
                                          } else if (!Validations
                                              .emailValidation(
                                                  emailController.text)) {
                                            Dialogs.ErrorAlertInOut(
                                                context: context,
                                                message: LanguageManager
                                                        .translations()[
                                                    'emailInvalid']);
                                          } else if (passwordController.text
                                                      .trim()
                                                      .length <
                                                  5 ||
                                              passwordController.text
                                                  .contains(" ")) {
                                            Dialogs.ErrorAlertInOut(
                                                context: context,
                                                message: LanguageManager
                                                        .translations()[
                                                    'passwordCharacter']);
                                          } else {
                                            context.read<LoginBloc>().add(
                                                OnLoginButtonClick(
                                                    emailController.text.trim(),
                                                    passwordController.text
                                                        .trim()));
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
                                        onPressed: () async {
                                          if (goBack) {
                                            SignUpScreen signUpScreen =
                                                SignUpScreen(goBack);
                                            bool? refresh = await context.push(
                                                "/${Routes.signUpScreen}",
                                                extra: signUpScreen);
                                            if (refresh != null) {
                                              if (refresh as bool) {
                                                context.pop(true);
                                              }
                                            }
                                          } else {
                                            SignUpScreen signUpScreen =
                                                SignUpScreen(goBack);
                                            context.pushReplacement(
                                                "/${Routes.signUpScreen}",
                                                extra: signUpScreen);
                                          }
                                        }),
                                  ],
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
          },
        ),
      ),
    );
  }

/*  Widget _buildContainer2(BuildContext context, bool goBack) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // if (state is LoginLoadingState) {
          //   LoadingDialog.show(context);
          // } else {
          //   LoadingDialog.hide(context);
          // }

          if (state is LoginSuccessState) {
            if (goBack) {
              print("------ context.pop(true);-------");
              context.pop(true);
            } else {
              context.read<CartBloc>().GetFavList();
              // Dialogs.SuccessAlertInOutWithCallBack(
              //     context: context,
              //     message: LanguageManager.translations()["LoginSuccessfully"],
              //     onFinish: () {
              context.pushReplacement("/${Routes.dashboardScreen}");
              // });
            }
          }
          if (state is LoginErrorState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.error);
          }
          if (state is LoginAPIFailureState) {
            APIFailureScreens(state.message);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    // height: 480,
                    // height: MediaQuery.of(context).size.height / 1.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LanguageManager.translations()["Login"],
                          style: CustomTextTheme.getTextStyle(
                            MyTextStyle.Heading,
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        GapWidget(
                          size: 10,
                        ),
                        CustomTextFormField().SimpleTextFormFieldWithPrefixIcon(
                          hintText: LanguageManager.translations()["Email"],
                          prefixIcon: "assets/images/Email.svg",
                          context: context,
                          controller: emailController,
                        ),
                        GapWidget(),
                        SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                          context: context,
                          controller: passwordController,
                          hintText: LanguageManager.translations()["Password"],
                          prefixIcon: "assets/images/lock_pass.svg",
                          obscureText: true,
                        ),
                        GapWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            LinkButton(
                              text: LanguageManager.translations()[
                                  "Forgotyourpassword"],
                              onPressed: () {
                                context.pushReplacement(
                                    "/${Routes.forgotPassScreen}");
                              },
                            )
                          ],
                        ),
                        GapWidget(),
                        state is LoginSubmittingState
                            ? CustomDialogButton()
                            : CustomButton(
                                text: LanguageManager.translations()["SignIn"],
                                onPressed: () {
                                  if (emailController.text.isEmpty) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: "Email is required");
                                  } else if (passwordController.text.isEmpty) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: "Password is required");
                                  } else if (!Validations.emailValidation(
                                      emailController.text)) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: "Email is Invalid");
                                  } else if (passwordController.text
                                              .trim()
                                              .length <
                                          5 ||
                                      passwordController.text.contains(" ")) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message:
                                            "Password must be greater than 5");
                                  } else {
                                    context.read<LoginBloc>().add(
                                        OnLoginButtonClick(
                                            emailController.text.trim(),
                                            passwordController.text.trim()));
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
                                text: LanguageManager.translations()["SignUp"],
                                onPressed: () {
                                SignUpScreen signUpScreen = SignUpScreen(goBack);
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
            );
          },
        ),
      ),
    );
  }
  */
}
