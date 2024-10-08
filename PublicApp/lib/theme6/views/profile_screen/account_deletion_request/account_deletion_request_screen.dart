import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publicapp/common/bloc/account_delete_bloc/account_deletion_request_bloc.dart';
import 'package:publicapp/common/bloc/account_delete_bloc/account_deletion_request_event.dart';
import 'package:publicapp/common/bloc/account_delete_bloc/account_deletion_request_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import '/theme6/views/shimmer/contact_us_shimmer_view.dart';
import '/theme6/views/widgets/common/custom_button.dart';
import '/theme6/views/widgets/common/custom_dialog_button.dart';
import '/theme6/views/widgets/common/custom_textfield.dart';
import '/theme6/views/widgets/common/gap_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AccountDeletionRequestScreen extends StatefulWidget {
  bool showappbar;
  AccountDeletionRequestScreen({this.showappbar = true, super.key});

  @override
  State<AccountDeletionRequestScreen> createState() =>
      _AccountDeletionRequestScreenState();
}

class _AccountDeletionRequestScreenState
    extends State<AccountDeletionRequestScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.showappbar) {
      return Scaffold(body: AccountDeletionRequestScreenBody());
    } else {
      return AccountDeletionRequestScreen();
    }
  }
}

class AccountDeletionRequestScreenBody extends StatefulWidget {
  bool isOpenedFromMain, showAppBar;
  AccountDeletionRequestScreenBody(
      {this.showAppBar = true, this.isOpenedFromMain = true});

  @override
  State<AccountDeletionRequestScreenBody> createState() =>
      _AccountDeletionRequestScreenBodyState();
}

class _AccountDeletionRequestScreenBodyState
    extends State<AccountDeletionRequestScreenBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String numberCode = "+1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  fillData(ShopifyUser user) async {
    nameController.text = "${user.firstName!} ${user.lastName!}";
    emailController.text = user.email!;
    messageController.text = "I am Requesting to kindly delete my account.";

    PhoneNumber phoneNumber =
        await PhoneNumber.getRegionInfoFromPhoneNumber(user.phone!);

    String? phoneN = phoneNumber.phoneNumber;

    // Remove the plus sign from the phone number
    String phoneNumberWithoutPlus = phoneN!.replaceAll('+', '');
    String dialCode = phoneNumber.dialCode!;

    numberController.text =
        removeDialCode(phoneNumberWithoutPlus, dialCode); // user.phone!;

    numberCode = "+" + dialCode;
  }

  String removeDialCode(String phoneNumber, String dialCode) {
    int index = phoneNumber.indexOf(dialCode);
    if (index != -1) {
      return phoneNumber.substring(index + dialCode.length);
    } else {
      // Dial code not found, return original phone number
      return phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AccountDeletionRequestBloc(),
        child: BlocListener<AccountDeletionRequestBloc,
            AccountDeletionRequestState>(
          listener: (context, state) {
            if (state is AccountDeletionRequestAPIFailureState) {
              Dialogs.ErrorAlertInOut(context: context, message: state.message);
            }
            if (state is AccountDeletionRequestSuccessSubmitState) {
              Dialogs.SuccessAlertInOut(
                context: context,
                message: state.message,
              );
              context.pop();
            }
            if (state is AccountDeletionRequestSuccessState) {
              fillData(state.shopifyUser);
            }
          },
          child: BlocBuilder<AccountDeletionRequestBloc,
              AccountDeletionRequestState>(
            builder: (context, state) {
              if (state is AccountDeletionRequestLoadingState) {
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
                                    child: Column(children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                LanguageManager.translations()[
                                                    "accountDeletionRequest"],
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
                                                            FontWeight.normal)),
                                          ]),
                                      GapWidget(),
                                      CustomTextFormField()
                                          .SimpleTextFormFieldWithPrefixIcon(
                                              textCapitalization:
                                                  TextCapitalization.sentences,
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
                                                            Routes.countryCode)
                                                        as Countries;
                                                print("data is ${data.code}");
                                                numberCode = CountryListData
                                                        .countryPhoneCodes[
                                                    data.code.toString()]!;
                                                setState(() {});
                                              }),
                                      GapWidget(),
                                      CustomTextFormField()
                                          .SimpleTextFormFieldWithPrefixIconMessageField(
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              controller: messageController,
                                              hintText: LanguageManager
                                                  .translations()["reason"],
                                              prefixIcon:
                                                  "assets/images/Email.svg", //Icons.subject,
                                              // obscureText: true,
                                              context: context),
                                      // maxLength: 500,
                                      // maxLines: 2,
                                      GapWidget(),
                                      state is AccountDeletionRequestSubmittingState
                                          ? CustomDialogButton()
                                          : CustomButton(
                                              text: LanguageManager
                                                  .translations()["Delete"],
                                              onPressed: () async {
                                                if (nameController
                                                    .text.isEmpty) {
                                                  Dialogs.ErrorAlertInOut(
                                                      context: context,
                                                      message: LanguageManager
                                                              .translations()[
                                                          'nameRequired']);
                                                } else if (!Validations
                                                    .emailValidation(
                                                        emailController.text)) {
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
                                                        15 ||
                                                    messageController
                                                        .text.isEmpty) {
                                                  Dialogs.ErrorAlertInOut(
                                                      context: context,
                                                      message: LanguageManager
                                                              .translations()[
                                                          'messageLength']);
                                                } else {
                                                  DialogAction action =
                                                      await Dialogs
                                                          .customAbortDialog(
                                                              context,
                                                              "Are you sure, you want to delete your account ?",
                                                              "");
                                                  if (action ==
                                                      DialogAction.YES) {
                                                    BlocProvider.of<
                                                                AccountDeletionRequestBloc>(
                                                            context)
                                                        .add(OnAccountDeletionRequestSubmitEvent(
                                                            nameController.text,
                                                            emailController
                                                                .text,
                                                            numberCode +
                                                                numberController
                                                                    .text,
                                                            messageController
                                                                .text));
                                                  }
                                                }
                                              },
                                            )
                                    ]),
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
