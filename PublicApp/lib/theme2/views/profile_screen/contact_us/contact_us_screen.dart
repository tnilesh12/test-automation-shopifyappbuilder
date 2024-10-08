import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publicapp/common/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:publicapp/common/bloc/contact_us_bloc/contact_us_event.dart';
import 'package:publicapp/common/bloc/contact_us_bloc/contact_us_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/routes.dart';
import '/theme2/utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import '/theme2/views/common_screens/api_failure.dart';
import '/theme2/views/shimmer/contact_us_shimmer_view.dart';
import '/theme2/views/widgets/common/custom_button.dart';
import '/theme2/views/widgets/common/custom_dialog_button.dart';
import '/theme2/views/widgets/common/custom_textfield.dart';
import '/theme2/views/widgets/common/gap_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  bool showappbar;
  ContactUsScreen({this.showappbar = true, super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.showappbar) {
      return Scaffold(
          // appBar: AppBar(
          //   title: Text('Contact Us'),
          // ),
          body: ContactUsScreenBody());
    } else {
      return ContactUsScreen();
    }
  }
}

class ContactUsScreenBody extends StatefulWidget {
  bool isOpenedFromMain, showAppBar;
  ContactUsScreenBody({this.showAppBar = true, this.isOpenedFromMain = true});

  @override
  State<ContactUsScreenBody> createState() => _ContactUsScreenBodyState();
}

class _ContactUsScreenBodyState extends State<ContactUsScreenBody> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  String numberCode = "+1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ContactUsBloc(),
        child: BlocListener<ContactUsBloc, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsErrorState) {
              Dialogs.ErrorAlertInOut(context: context, message: state.error);
            }
            if (state is ContactUsAPIFailureState) {
              Dialogs.ErrorAlertInOut(context: context, message: state.message);
            }
            if (state is ContactUsSuccessSubmitState) {
              Dialogs.SuccessAlertInOut(
                context: context,
                message: state.message,
              );
              context.pop();
            }
            // if (state is ContactUsAPIFailureState) {
            //   Dialogs.ErrorAlertInOut(context: context, message: state.message);
            // }
          },
          child: BlocBuilder<ContactUsBloc, ContactUsState>(
            builder: (context, state) {
              if (state is ContactUsLoadingState) {
                return ContactUsSchimmerView().contactUsSchimmerView(context);
                // Center(
                //   child: Text("Loading.."),
                // );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child: Container(
                            // height : 350,
                            height: MediaQuery.of(context).size.height / 2.3,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: AppTheme.primaryColor!),
                            child: Center(
                              child: Container(),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Container(
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
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ThemeSize.themeBorderRadius),
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

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        context.read<ContactUsBloc>().email !=
                                                    null &&
                                                context
                                                        .read<ContactUsBloc>()
                                                        .address !=
                                                    null &&
                                                context
                                                        .read<ContactUsBloc>()
                                                        .phone !=
                                                    null
                                            ? Column(children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          LanguageManager
                                                                  .translations()[
                                                              'ContactUs'],
                                                          style: CustomTextTheme
                                                                  .getTextStyle(
                                                                      MyTextStyle
                                                                          .CommonThemeTitle,
                                                                      context)
                                                              .copyWith(
                                                                  fontSize:
                                                                      DashboardFontSize
                                                                          .headingFontSize,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                    ]),
                                                GapWidget(
                                                  size: 5,
                                                ),
                                                context
                                                            .read<
                                                                ContactUsBloc>()
                                                            .phone !=
                                                        null
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            child: SvgPicture
                                                                .asset(
                                                              height: 20,
                                                              "assets/images/phone_no.svg",
                                                            ),
                                                          ),
                                                          GapWidget(),
                                                          Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  LanguageManager
                                                                          .translations()[
                                                                      "Enterphonenumber"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                  // LanguageManager
                                                                  //       .translations()[
                                                                  //   "Enterphonenumber"]
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    final Uri
                                                                        launchUri =
                                                                        Uri(
                                                                      scheme:
                                                                          'tel',
                                                                      path: context
                                                                          .read<
                                                                              ContactUsBloc>()
                                                                          .phone!,
                                                                    );
                                                                    await launchUrl(
                                                                        launchUri);
                                                                    //  FlutterPhone
                                                                  },
                                                                  child: Text(
                                                                      context
                                                                          .read<
                                                                              ContactUsBloc>()
                                                                          .phone!,
                                                                      style: CustomTextTheme.getTextStyle(
                                                                              MyTextStyle.CommonThemeSubTitle,
                                                                              context)
                                                                          .copyWith(fontSize: ThemeSize.themeFontSize)),
                                                                )
                                                              ]),
                                                        ],
                                                      )
                                                    : Container(),
                                                GapWidget(
                                                  size: -8,
                                                ),
                                                context
                                                            .read<
                                                                ContactUsBloc>()
                                                            .email !=
                                                        null
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            child: SvgPicture
                                                                .asset(
                                                              height: 20,
                                                              "assets/images/Email.svg",
                                                            ),
                                                          ),
                                                          GapWidget(),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  LanguageManager
                                                                          .translations()[
                                                                      "Email"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10)
                                                                  // LanguageManager
                                                                  //       .translations()[
                                                                  //   "Email"]
                                                                  ),
                                                              InkWell(
                                                                onTap: () {
                                                                  final Uri
                                                                      emailLaunchUri =
                                                                      Uri(
                                                                    scheme:
                                                                        'mailto',
                                                                    path: context
                                                                        .read<
                                                                            ContactUsBloc>()
                                                                        .email!,
                                                                  );

                                                                  launchUrl(
                                                                      emailLaunchUri);
                                                                },
                                                                child: Text(
                                                                    context
                                                                        .read<
                                                                            ContactUsBloc>()
                                                                        .email!,
                                                                    style: CustomTextTheme.getTextStyle(
                                                                            MyTextStyle
                                                                                .CommonThemeSubTitle,
                                                                            context)
                                                                        .copyWith(
                                                                            fontSize:
                                                                                ThemeSize.themeFontSize)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                                GapWidget(
                                                  size: -8,
                                                ),
                                                context
                                                            .read<
                                                                ContactUsBloc>()
                                                            .address !=
                                                        null
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            child: SvgPicture
                                                                .asset(
                                                              height: 20,
                                                              "assets/images/address-list.svg",
                                                            ),
                                                          ),
                                                          GapWidget(),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  LanguageManager
                                                                          .translations()[
                                                                      "AddressScreen"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10)
                                                                  // LanguageManager
                                                                  //       .translations()[
                                                                  //   "Address"]
                                                                  ),
                                                              Text(
                                                                  context
                                                                      .read<
                                                                          ContactUsBloc>()
                                                                      .address!,
                                                                  style: CustomTextTheme.getTextStyle(
                                                                          MyTextStyle
                                                                              .CommonThemeSubTitle,
                                                                          context)
                                                                      .copyWith(
                                                                          fontSize:
                                                                              ThemeSize.themeFontSize)),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                                GapWidget(
                                                  size: 10,
                                                ),
                                              ])
                                            : Container(),
                                        Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    // "Get in touch",
                                                    LanguageManager
                                                            .translations()[
                                                        "getInTouch"],
                                                    // LanguageManager
                                                    //         .translations()[
                                                    //     'ContactUs'],
                                                    style: CustomTextTheme
                                                            .getTextStyle(
                                                                MyTextStyle
                                                                    .CommonThemeTitle,
                                                                context)
                                                        .copyWith(
                                                            fontSize:
                                                                DashboardFontSize
                                                                    .headingFontSize,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                              ]),
                                          GapWidget(),
                                          CustomTextFormField()
                                              .SimpleTextFormFieldWithPrefixIcon(
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  controller: nameController,
                                                  hintText: LanguageManager
                                                      .translations()["Name"],
                                                  prefixIcon:
                                                      "assets/images/user.svg", //Icons.person,
                                                  // obscureText: true,
                                                  context: context),
                                          GapWidget(),
                                          CustomTextFormField()
                                              .SimpleTextFormFieldWithPrefixIcon(
                                                  controller: emailController,
                                                  hintText: LanguageManager
                                                      .translations()["Email"],
                                                  prefixIcon:
                                                      "assets/images/Email.svg",
                                                  // obscureText: true,
                                                  context: context),
                                          GapWidget(),
                                          CustomTextFormField()
                                              .SimpleTextFormFieldWithPrefixIconAndCountryCodeWithCursor(
                                                  controller: numberController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText: LanguageManager
                                                          .translations()[
                                                      'Enterphonenumber']!,
                                                  phoneCode: numberCode,
                                                  prefixIcon: "",
                                                  context: context,
                                                  onClickCountry: () async {
                                                    Countries data =
                                                        await context.pushNamed(
                                                                Routes
                                                                    .countryCode)
                                                            as Countries;
                                                    print(
                                                        "data is ${data.code}");
                                                    numberCode = CountryListData
                                                            .countryPhoneCodes[
                                                        data.code.toString()]!;
                                                    setState(() {});
                                                  }),
                                          // .SimpleTextFormFieldWithPrefixIcon(
                                          //     controller: numberController,
                                          //     hintText: LanguageManager
                                          //         .translations()["Number"],
                                          //     prefixIcon:
                                          //         "assets/images/phone_no.svg",
                                          //     // obscureText: true,
                                          //     keyboardType:
                                          //         TextInputType.number,
                                          //     context: context),
                                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                                          GapWidget(),
                                          CustomTextFormField()
                                              .SimpleTextFormFieldWithPrefixIconMessageField(
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  controller: messageController,
                                                  hintText: LanguageManager
                                                          .translations()[
                                                      "Message"],
                                                  prefixIcon:
                                                      "assets/images/Email.svg", //Icons.subject,
                                                  // obscureText: true,
                                                  context: context),
                                          // maxLength: 500,
                                          // maxLines: 2,
                                          GapWidget(),
                                          state is ContactUsSubmittingState
                                              ? CustomDialogButton()
                                              : CustomButton(
                                                  text: LanguageManager
                                                      .translations()["Submit"],
                                                  onPressed: () {
                                                    if (nameController
                                                        .text.isEmpty) {
                                                      Dialogs.ErrorAlertInOut(
                                                          context: context,
                                                          message: LanguageManager
                                                                  .translations()[
                                                              'nameRequired']);
                                                    } else if (!Validations
                                                        .emailValidation(
                                                            emailController
                                                                .text)) {
                                                      Dialogs.ErrorAlertInOut(
                                                          context: context,
                                                          message: LanguageManager
                                                                  .translations()[
                                                              'emailRequired']);
                                                    } else if (!Validations
                                                        .mobileValidation(
                                                            numberController
                                                                .text)) {
                                                      Dialogs.ErrorAlertInOut(
                                                          context: context,
                                                          message: LanguageManager
                                                                  .translations()[
                                                              'contactRequired']);
                                                    } else if (messageController
                                                                .text.length <
                                                            15 &&
                                                        messageController
                                                            .text.isEmpty) {
                                                      Dialogs.ErrorAlertInOut(
                                                          context: context,
                                                          message: LanguageManager
                                                                  .translations()[
                                                              'messageLength']);
                                                    } else {
                                                      BlocProvider.of<
                                                                  ContactUsBloc>(
                                                              context)
                                                          .add(OnSubmitEvent(
                                                              nameController
                                                                  .text,
                                                              emailController
                                                                  .text,
                                                              numberCode +
                                                                  numberController
                                                                      .text,
                                                              messageController
                                                                  .text));
                                                    }
                                                  },
                                                )
                                        ])
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
