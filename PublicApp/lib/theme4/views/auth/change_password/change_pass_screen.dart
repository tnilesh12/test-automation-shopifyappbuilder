import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/setting_enum.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../utils/theme_size.dart';
import 'package:publicapp/common/bloc/change_password_screen_bloc/change_password_bloc.dart';
import 'package:publicapp/common/bloc/change_password_screen_bloc/change_password_event.dart';
import 'package:publicapp/common/bloc/change_password_screen_bloc/change_password_state.dart';
import '/theme4/views/common_screens/api_failure.dart';
import '../../../views/widgets/common/custom_button.dart';
import '/theme4/views/widgets/common/custom_dialog_button.dart';
import '/theme4/views/widgets/common/custom_textfield.dart';
import '/theme4/views/widgets/common/gap_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class ChangePassScreen extends StatelessWidget {
  // String defaultFontFamily = 'Roboto-Light.ttf';
  // double defaultFontSize = 14;
  // double defaultIconSize = 17;
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  // final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => ChangePasswordMessageBloc(),
            child: BlocListener<ChangePasswordMessageBloc, ChangePasswordState>(
                listener: (context, state) {
              if (state is ChangePasswordErrorState) {
                Dialogs.ErrorAlertInOut(context: context, message: state.error);
              }
              if (state is ChangePasswordSuccessState) {
                Dialogs.SuccessAlertInOut(context: context, message: state.msg);
                // context.go("/${Routes.dashboardScreen}");
                // Future.delayed(Duration(milliseconds: 1000));
                // Navigator.pop(context);
              }

              if (state is ChangePasswordAPIFailureState) {
                Dialogs.ErrorAlertInOut(
                    context: context, message: state.message);
              }
            }, child:
                    BlocBuilder<ChangePasswordMessageBloc, ChangePasswordState>(
                        builder: (context, state) {
              if (state is ChangePasswordAPIFailureState) {
                return APIFailureScreens(showButton: true, state.message);
              } else {
                return Container(
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
                      //     decoration: BoxDecoration(
                      //       color: AppTheme.primaryColor!,
                      //       // gradient: LinearGradient(
                      //       //   colors: [
                      //       //     AppTheme.black!.withOpacity(0.9),
                      //       //     AppTheme.borderColor!
                      //       //   ],
                      //       //   begin: Alignment.bottomLeft,
                      //       //   end: Alignment.topRight,
                      //       // ),
                      //     ),
                      //   ),
                      // ),
                      globals
                                  .Settings[SettingsEnum
                                      .Show_Intro_Screen_At_App_Start.name]
                                  .splashImages
                                  .imageOne !=
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
                      //   top: 280,
                      //   left: 0,
                      //   right: 0,
                      // child:
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              Container(
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
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 2, 5),
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
                              ),
                              Container(
                                  // height: MediaQuery.of(context).size.height / 3.5,
                                  alignment: Alignment.center,
                                  // margin: EdgeInsets.only(top: 60),
                                  child: globals.partnerInfoModel.appSettings !=
                                          null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                            ),
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
                                              globals.partnerInfoModel
                                                          .appSettings !=
                                                      null
                                                  ? globals.partnerInfoModel
                                                      .appSettings!.appName!
                                                  : globals.partnerInfoModel
                                                              .name !=
                                                          null
                                                      ? globals.partnerInfoModel
                                                          .name!
                                                      : "",
                                              style:
                                                  CustomTextTheme.getTextStyle(
                                                MyTextStyle.Heading,
                                                context,
                                              ).copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ],
                                        )
                                      : Text(
                                          globals.partnerInfoModel
                                                      .appSettings !=
                                                  null
                                              ? globals.partnerInfoModel
                                                  .appSettings!.appName!
                                              : globals.partnerInfoModel.name !=
                                                      null
                                                  ? globals
                                                      .partnerInfoModel.name!
                                                  : "",
                                          style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.Heading,
                                            context,
                                          ).copyWith(
                                              fontWeight: FontWeight.bold),
                                        )),
                              GapWidget(
                                size: -5,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 250,
                                    ),
                                    // Text("Login"),
                                    // CustomTextFormField()
                                    //     .SimpleTextFormFieldWithPrefixIcon(
                                    //         controller: oldPassController,
                                    //         hintText: "Old Password",
                                    //         prefixIcon: Icons.lock,
                                    //         context: context),
                                    // GapWidget(size: 10),
                                    SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                                        obscureText: true,
                                        controller: newPassController,
                                        hintText: LanguageManager
                                            .translations()["NewPassword"],
                                        prefixIcon:
                                            "assets/images/lock_pass.svg",
                                        context: context),
                                    GapWidget(size: 10),
                                    SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                                        obscureText: true,
                                        controller: confirmPassController,
                                        hintText:
                                            LanguageManager.translations()[
                                                "ConfirmNewPassword"],
                                        prefixIcon:
                                            "assets/images/lock_pass.svg",
                                        context: context),
                                    GapWidget(size: 10),
                                    state is ChangePasswordSubmittingState
                                        ? Container(
                                            height: ThemeSize.themeButtonSize,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(5.0),
                                            child: Image.asset(
                                              AppAssets.loadingImg,
                                              color: AppTheme.primaryButtonText,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40)),
                                                color: AppTheme
                                                    .primaryButtonBackground),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              if (newPassController
                                                  .text.isEmpty) {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message:
                                                        "Password required");
                                              } else if (confirmPassController
                                                  .text.isEmpty) {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message:
                                                        "confirmPassword required");
                                              } else if (newPassController.text
                                                          .trim()
                                                          .length <
                                                      6 ||
                                                  newPassController.text
                                                      .contains(" ")) {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message: LanguageManager
                                                            .translations()[
                                                        'passwordCharacter']);
                                              } else if (confirmPassController
                                                          .text.length <
                                                      6 ||
                                                  confirmPassController.text
                                                      .contains(" ")) {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message: LanguageManager
                                                            .translations()[
                                                        'confirmPasswordCharacter']);
                                              } else if (newPassController
                                                      .text !=
                                                  confirmPassController.text) {
                                                Dialogs.ErrorAlertInOut(
                                                    context: context,
                                                    message: LanguageManager
                                                            .translations()[
                                                        'confirmPasswordMatch']);
                                              } else {
                                                BlocProvider.of<
                                                            ChangePasswordMessageBloc>(
                                                        context)
                                                    .add(onSubmitEvent(
                                                        newPassController.text,
                                                        confirmPassController
                                                            .text));
                                                // GoRouter.of(context).pushNamed(Routes.dashboardScreen);
                                                // context.go(
                                                //     "/${Routes.dashboardScreen}"); //  /home_screen");
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
                                                    "ChangePassword"],
                                                style: TextStyle(
                                                    color: AppTheme
                                                        .primaryButtonText!,
                                                    fontSize: 16),
                                                textAlign: TextAlign.center,
                                              ),
                                              decoration: BoxDecoration(
                                                  // shape: BoxShape.circle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40)),
                                                  color: AppTheme
                                                      .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                                                  ),
                                            ),
                                          ),
                                    //  CustomButton(
                                    //     text:
                                    // LanguageManager.translations()[
                                    //     "ChangePassword"],
                                    //     onPressed: () {
                                    //       if (newPassController
                                    //           .text.isEmpty) {
                                    //         Dialogs.ErrorAlertInOut(
                                    //             context: context,
                                    //             message:
                                    //                 "Password required");
                                    //       } else if (confirmPassController
                                    //           .text.isEmpty) {
                                    //         Dialogs.ErrorAlertInOut(
                                    //             context: context,
                                    //             message:
                                    //                 "confirmPassword required");
                                    //       } else if (newPassController.text
                                    //                   .trim()
                                    //                   .length <
                                    //               6 ||
                                    //           newPassController.text
                                    //               .contains(" ")) {
                                    //         Dialogs.ErrorAlertInOut(
                                    //             context: context,
                                    //             message: LanguageManager
                                    //                     .translations()[
                                    //                 'passwordCharacter']);
                                    //       } else if (confirmPassController
                                    //                   .text.length <
                                    //               6 ||
                                    //           confirmPassController.text
                                    //               .contains(" ")) {
                                    //         Dialogs.ErrorAlertInOut(
                                    //             context: context,
                                    //             message: LanguageManager
                                    //                     .translations()[
                                    //                 'confirmPasswordCharacter']);
                                    //       } else if (newPassController
                                    //               .text !=
                                    //           confirmPassController.text) {
                                    //         Dialogs.ErrorAlertInOut(
                                    //             context: context,
                                    //             message: LanguageManager
                                    //                     .translations()[
                                    //                 'confirmPasswordMatch']);
                                    //       } else {
                                    //         BlocProvider.of<
                                    //                     ChangePasswordMessageBloc>(
                                    //                 context)
                                    //             .add(onSubmitEvent(
                                    //                 newPassController.text,
                                    //                 confirmPassController
                                    //                     .text));
                                    //         // GoRouter.of(context).pushNamed(Routes.dashboardScreen);
                                    //         // context.go(
                                    //         //     "/${Routes.dashboardScreen}"); //  /home_screen");
                                    //       }
                                    //     },
                                    //   ),
                                    GapWidget(
                                      size: -5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ),
                    ],
                  ),
                );
              }
            }))));
  }
}
