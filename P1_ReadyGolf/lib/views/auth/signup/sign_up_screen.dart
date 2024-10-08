import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import '/views/auth/login/login_screen.dart';
import '/views/auth/signup/bloc/signup_bloc.dart';
import '/views/auth/signup/bloc/signup_event.dart';
import '/views/auth/signup/bloc/signup_state.dart';
import '/views/common_screens/api_failure.dart';
import '/views/widgets/common/custom_button.dart';
import '/views/widgets/common/custom_dialog_button.dart';
import '/views/widgets/common/custom_textfield.dart';
import '/views/widgets/common/gap_widget.dart';
import '/views/widgets/common/link_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

// class SignUpScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String defaultFontFamily = 'Roboto-Light.ttf';
//     double defaultFontSize = 14;
//     double defaultIconSize = 17;
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: ClampingScrollPhysics(),
//         child: Container(
//           padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           // color: AppTheme.backgroundColor,
//           child: Column(
//             children: <Widget>[
//               // Flexible(
//               //   flex: 1,
//               //   child: InkWell(
//               //     child: Container(
//               //       child: Align(
//               //         alignment: Alignment.topLeft,
//               //         child: Icon(Icons.close),
//               //       ),
//               //     ),
//               //     onTap: (){
//               //       Navigator.pop(context);
//               //     },
//               //   ),
//               // ),
//               Flexible(
//                 flex: 5,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       width: 130,
//                       height: 130,
//                       alignment: Alignment.center,
//                       child: Image.asset("assets/images/ic_app_icon.png"),
//                     ),
//                     GapWidget(),
//                     Row(
//                       children: <Widget>[
//                         Flexible(
//                           flex: 1,
//                           child: CustomTextFormField()
//                               .SimpleTextFormField(hintText: "First Name"),
//                         ),
//                         GapWidget(
//                           size: -5,
//                         ),
//                         Flexible(
//                           flex: 1,
//                           child: CustomTextFormField()
//                               .SimpleTextFormField(hintText: "Last Name"),
//                         ),
//                       ],
//                     ),
//                     GapWidget(),
//                     CustomTextFormField().SimpleTextFormFieldWithPrefixIcon(
//                         hintText: "Email", prefixIcon: Icons.email),
//                     GapWidget(),
//                     CustomTextFormField().SimpleTextFormFieldWithPrefixIcon(
//                         hintText: "Password", prefixIcon: Icons.lock),
//                     GapWidget(),
//                     CustomButton(
//                       text: 'Sign Up',
//                       onPressed: () {
//                         context.go("/${Routes.loginScreen}");
//                       },
//                     ),
//                     GapWidget(
//                       size: -5,
//                     ),
//                   ],
//                 ),
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         child: Text(
//                           "Already have an account? ",
//                           style: TextStyle(
//                             color: Color(0xFF666666),
//                             fontFamily: defaultFontFamily,
//                             fontSize: defaultFontSize,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                       ),
//                       LinkButton(
//                           text: "Sign In",
//                           onPressed: () {
//                             context.go("/${Routes.loginScreen}");
//                           }),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SignUpScreen extends StatefulWidget {
  bool goBack;
  SignUpScreen(this.goBack);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // String defaultFontFamily = 'Roboto-Light.ttf';
  String phoneCode = "+1";
  // double defaultFontSize = 14;
  // double defaultIconSize = 17;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  bool acceptsMarketing = false;

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
                  decoration: BoxDecoration(color: AppTheme.primaryColor!
                      // gradient: LinearGradient(
                      //   colors: [
                      //     AppTheme.black!.withOpacity(0.9),
                      //     AppTheme.borderColor!
                      //   ],
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      // ),
                      )),
            ),
            // Positioned(
            //   top: 170,
            //   left: 0,
            //   right: 0,
            //   child: _buildContainer(context),
            // ),
            _buildContainer(context, widget.goBack)
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, bool goBack) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          // if (state is SignupLoadingState) {
          //   LoadingDialog.show(context);
          // } else {
          //   LoadingDialog.hide(context);
          // }

          if (state is SignupSuccessState) {
            // Dialogs.SuccessAlertInOut(
            //     context: context, message: "User Created Successfully!!!");
            if (goBack) {
              print("------ context.pop(true);-------");
              context.pop(true);
            } else {
              context.pushReplacement("/${Routes.dashboardScreen}");
            }
          }
          if (state is SignupErrorState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.error);
          }
          if (state is SignupAPIFailureState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.message);
            // APIFailureScreens(showButton: goBack, state.message);
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: goBack ? 35 : 75,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          // height: 480,
                          //height: MediaQuery.of(context).size.height / 1.2, //1.7
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LanguageManager.translations()["CreateAccount"],
                                style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.Heading,
                                  context,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                              GapWidget(
                                size: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: CustomTextFormField()
                                        .SimpleTextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType: TextInputType.name,
                                      controller: firstNameController,
                                      hintText: LanguageManager.translations()[
                                          "EnterYourFirstName"],
                                      context: context,
                                    ),
                                  ),
                                  GapWidget(
                                    size: -5,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: CustomTextFormField()
                                        .SimpleTextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType: TextInputType.name,
                                      controller: lastNameController,
                                      hintText: LanguageManager.translations()[
                                          "EnterYourLastName"],
                                      context: context,
                                    ),
                                  ),
                                ],
                              ),
                              GapWidget(),
                              CustomTextFormField()
                                  .SimpleTextFormFieldWithPrefixIcon(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText:
                                    LanguageManager.translations()["Email"],
                                prefixIcon: "assets/images/Email.svg",
                                context: context,
                              ),
                              GapWidget(),
                              CustomTextFormField()
                                  .SimpleTextFormFieldWithPrefixIconAndCountryCodeWithCursor(
                                      controller: mobileController,
                                      keyboardType: TextInputType.number,
                                      hintText: LanguageManager.translations()[
                                          "Mobile"],
                                      phoneCode: phoneCode,
                                      prefixIcon: "assets/images/phone_no.svg",
                                      context: context,
                                      onClickCountry: () async {
                                        Countries data = await context
                                                .pushNamed(Routes.countryCode)
                                            as Countries;
                                        print("data is ${data.code}");
                                        phoneCode =
                                            CountryListData.countryPhoneCodes[
                                                data.code.toString()]!;

                                        setState(() {});
                                      }),
                              GapWidget(),
                              SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                                context: context,
                                controller: passwordController,
                                hintText:
                                    LanguageManager.translations()["Password"],
                                prefixIcon: "assets/images/lock_pass.svg",
                                obscureText: true,
                              ),
                              GapWidget(),
                              SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                                controller: cPasswordController,
                                hintText: LanguageManager.translations()[
                                    "ConfirmPassword"],
                                prefixIcon: "assets/images/lock_pass.svg",
                                context: context,
                                obscureText: true,
                              ),
                              GapWidget(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    acceptsMarketing = !acceptsMarketing;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 24.0,
                                      width: 24.0,
                                      child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: acceptsMarketing,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            acceptsMarketing = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Subscribe to our emails"),
                                  ],
                                ),
                              ),
                              GapWidget(),
                              state is SignupSubmittingState
                                  ? CustomDialogButton()
                                  : CustomButton(
                                      text: LanguageManager.translations()[
                                          "SignUp"],
                                      onPressed: () {
                                        if (firstNameController.text
                                            .trim()
                                            .isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'firstNameRequired']);
                                        } else if (lastNameController.text
                                            .trim()
                                            .isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'lastNameRequired']);
                                        } else if (emailController
                                            .text.isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'emailRequired']);
                                        } else if (AppConfig
                                                .PHONE_NO_REQUIRED &&
                                            mobileController.text.isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'contactRequired']);
                                        } else if (passwordController
                                            .text.isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'passwordRequired']);
                                        } else if (cPasswordController
                                            .text.isEmpty) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'confirmPasswordRequired']);
                                        } else if (!Validations.emailValidation(
                                            emailController.text)) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'emailInvalid']);
                                        } else
                                        //  if (!Validations.mobileValidation(
                                        //     mobileController.text)) {
                                        //   Dialogs.ErrorAlertInOut(
                                        //       context: context,
                                        //       message:
                                        //           "Mobile Number must be of 10 digit");
                                        // } else
                                        if (passwordController.text.length <
                                                5 ||
                                            cPasswordController.text.length <
                                                5) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'passwordCharacter']);
                                        } else if (cPasswordController.text !=
                                            passwordController.text) {
                                          Dialogs.ErrorAlertInOut(
                                              context: context,
                                              message: LanguageManager
                                                      .translations()[
                                                  'passwordNotMatch']);
                                        } else {
                                          context.read<SignupBloc>().add(
                                              OnSignupButtonClick(
                                                  firstNameController.text
                                                      .trim(),
                                                  lastNameController.text
                                                      .trim(),
                                                  emailController.text.trim(),
                                                  mobileController.text.trim(),
                                                  passwordController.text
                                                      .trim(),
                                                  cPasswordController.text
                                                      .trim(),
                                                  phoneCode,
                                                  acceptsMarketing));
                                        }
                                      },
                                    ),
                              GapWidget(
                                size: -10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      LanguageManager.translations()[
                                          "Already have an account"],

                                      style: CustomTextTheme.getTextStyle(
                                          MyTextStyle.SimpleText, context),
                                      // style: TextStyle(
                                      //   color: Color(0xFF666666),
                                      //   fontFamily: defaultFontFamily,
                                      //   fontSize: defaultFontSize,
                                      //   fontStyle: FontStyle.normal,
                                      // ),
                                    ),
                                  ),
                                  GapWidget(size: -10),
                                  LinkButton(
                                      text: LanguageManager.translations()[
                                          "SignIn"],
                                      onPressed: () {
                                        context.pushNamed(
                                            "${Routes.loginScreen}",
                                            pathParameters: {
                                              "goBack": goBack.toString()
                                            },
                                            extra: null);
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
        }),
      ),
    );
  }

/*
  Widget _buildContainer2(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          // if (state is SignupLoadingState) {
          //   LoadingDialog.show(context);
          // } else {
          //   LoadingDialog.hide(context);
          // }

          if (state is SignupSuccessState) {
            // Dialogs.SuccessAlertInOut(
            //     context: context, message: "User Created Successfully!!!");
            context.pushReplacement("/${Routes.dashboardScreen}");
          }
          if (state is SignupErrorState) {
            Dialogs.ErrorAlertInOut(context: context, message: state.error);
          }
          if (state is SignupAPIFailureState) {
            APIFailureScreens(state.message);
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
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
                  //height: MediaQuery.of(context).size.height / 1.2, //1.7
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageManager.translations()["CreateAccount"],
                        style: CustomTextTheme.getTextStyle(
                          MyTextStyle.Heading,
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      GapWidget(
                        size: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: CustomTextFormField().SimpleTextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.name,
                              controller: firstNameController,
                              hintText: "First Name",
                              context: context,
                            ),
                          ),
                          GapWidget(
                            size: -5,
                          ),
                          Flexible(
                            flex: 1,
                            child: CustomTextFormField().SimpleTextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.name,
                              controller: lastNameController,
                              hintText: "Last Name",
                              context: context,
                            ),
                          ),
                        ],
                      ),
                      GapWidget(),
                      CustomTextFormField().SimpleTextFormFieldWithPrefixIcon(
                        controller: emailController,
                        hintText: LanguageManager.translations()["Email"],
                        prefixIcon: "assets/images/Email.svg",
                        context: context,
                      ),
                      GapWidget(),
                      CustomTextFormField()
                          .SimpleTextFormFieldWithPrefixIconAndCountryCodeWithCursor(
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              hintText:
                                  LanguageManager.translations()["Mobile"],
                              phoneCode: phoneCode,
                              prefixIcon: "assets/images/phone_no.svg",
                              context: context,
                              onClickCountry: () async {
                                Countries data = await context
                                    .pushNamed(Routes.countryCode) as Countries;
                                print("data is ${data.code}");
                                phoneCode = CountryListData
                                    .countryPhoneCodes[data.code.toString()]!;

                                setState(() {});
                              }),
                      GapWidget(),
                      SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                        context: context,
                        controller: passwordController,
                        hintText: LanguageManager.translations()["Password"],
                        prefixIcon: "assets/images/lock_pass.svg",
                        obscureText: true,
                      ),
                      GapWidget(),
                      SimpleTextFormFieldWithPrefixIconAndVisibilityToggle(
                        controller: cPasswordController,
                        hintText:
                            LanguageManager.translations()["ConfirmPassword"],
                        prefixIcon: "assets/images/lock_pass.svg",
                        context: context,
                        obscureText: true,
                      ),
                      GapWidget(),
                      state is SignupSubmittingState
                          ? CustomDialogButton()
                          : CustomButton(
                              text: LanguageManager.translations()["SignUp"],
                              onPressed: () {
                                if (firstNameController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "First Name is Required");
                                } else if (lastNameController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Last Name is Required");
                                } else if (emailController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Email is Required");
                                } else if (mobileController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Mobile Number is Required");
                                } else if (passwordController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Password is Required");
                                } else if (cPasswordController.text.isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Confirm Password is Required");
                                } else if (!Validations.emailValidation(
                                    emailController.text)) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Email is Invalid");
                                } else
                                //  if (!Validations.mobileValidation(
                                //     mobileController.text)) {
                                //   Dialogs.ErrorAlertInOut(
                                //       context: context,
                                //       message:
                                //           "Mobile Number must be of 10 digit");
                                // } else
                                if (passwordController.text.length < 5 ||
                                    cPasswordController.text.length < 5) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message:
                                          "Password Must be greater than 5 digit");
                                } else if (cPasswordController.text !=
                                    passwordController.text) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: "Password doesn't match");
                                } else {
                                  context.read<SignupBloc>().add(
                                      OnSignupButtonClick(
                                          firstNameController.text.trim(),
                                          lastNameController.text.trim(),
                                          emailController.text.trim(),
                                          mobileController.text.trim(),
                                          passwordController.text.trim(),
                                          cPasswordController.text.trim(),
                                          phoneCode));
                                }
                              },
                            ),
                      GapWidget(
                        size: -10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              LanguageManager.translations()[
                                  "Already have an account"],

                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.SimpleText, context),
                              // style: TextStyle(
                              //   color: Color(0xFF666666),
                              //   fontFamily: defaultFontFamily,
                              //   fontSize: defaultFontSize,
                              //   fontStyle: FontStyle.normal,
                              // ),
                            ),
                          ),
                          GapWidget(size: -10),
                          LinkButton(
                              text: LanguageManager.translations()["SignIn"],
                              onPressed: () {
                                LoginScreen loginScreen = LoginScreen(false);
                                context.pushReplacement(
                                    "/${Routes.loginScreen}",
                                    extra: loginScreen);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
*/
}
