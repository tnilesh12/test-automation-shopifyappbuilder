import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:publicapp/common/bloc/add_address_screen_bloc/add_address_bloc.dart';
import 'package:publicapp/common/bloc/add_address_screen_bloc/add_address_event.dart';
import 'package:publicapp/common/bloc/add_address_screen_bloc/add_address_state.dart';
import 'package:publicapp/common/bloc/country_code_bloc/country_code_bloc.dart';
import 'package:publicapp/common/bloc/zip_code_bloc/zip_code_bloc.dart';
import 'package:publicapp/common/bloc/zip_code_bloc/zip_code_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import '/theme2/utils/theme_size.dart';
import '/theme2/utils/theme_size.dart';
import 'package:shopify_code/util/validations.dart';
import '/theme2/views/countrycode/state_code.dart';
import '/theme2/views/widgets/common/custom_button.dart';
import '/theme2/views/widgets/common/custom_dialog_button.dart';
import '/theme2/views/widgets/common/custom_textfield.dart';
import '/theme2/views/widgets/common/gap_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddressScreen extends StatefulWidget {
  Address? addressNode;
  String option;

  // Node? addressNode;
  AddressScreen(this.addressNode, this.option, {super.key}) {
    // if (option != null) addressNode = option as Address;
  }

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String countryName = "";
  String numberCode = "+1";
  String countryCode = "";
  String provinceCode = "";
  String phoneNo = "";

  //  CountryCodeList? list;
  //  Code? zipCode;
  final TextEditingController address1Controller = TextEditingController();

  final TextEditingController address2Controller = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController companyController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController provinceController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController zipController = TextEditingController();

  // final TextEditingController nameController = TextEditingController();

  // final TextEditingController provinceCodeController = TextEditingController();

  final TextEditingController countryCodeController = TextEditingController();

  // final TextEditingController countryNameController = TextEditingController();

  // getData() async {
  //   String OriginalPhoneNumber = widget.addressNode!.phone.toString();

  //   PhoneNumber phoneNumber =
  //       await PhoneNumber.getRegionInfoFromPhoneNumber(OriginalPhoneNumber);

  //   String? phoneN = phoneNumber.phoneNumber;

  //   // Remove the plus sign from the phone number
  //   String phoneNumberWithoutPlus = phoneN!.replaceAll('+', '');
  //   String dialCode = phoneNumber.dialCode!;

  //   phoneController.text = removeDialCode(phoneNumberWithoutPlus, dialCode);

  //   print("------------------>>>>>>>" + phoneNo);

  //   numberCode = "+" + dialCode;
  //   // return phoneController.text;
  // }

  // String removeDialCode(String phoneNumber, String dialCode) {
  //   int index = phoneNumber.indexOf(dialCode);
  //   if (index != -1) {
  //     return phoneNumber.substring(index + dialCode.length);
  //   } else {
  //     // Dial code not found, return original phone number
  //     return phoneNumber;
  //   }
  // }

  @override
  void initState() {
    if (widget.option == "edit") {
      // getData();
      address1Controller.text = widget.addressNode!.address1 == null ||
              widget.addressNode!.address1 == "null"
          ? ""
          : widget.addressNode!.address1.toString();

      // address2Controller.text = widget.addressNode!.address2 == null ||
      //         widget.addressNode!.address2 == "null"
      //     ? ""
      //     : widget.addressNode!.address2.toString();

      cityController.text =
          widget.addressNode!.city == null || widget.addressNode!.city == "null"
              ? ""
              : widget.addressNode!.city.toString();

      // companyController.text = widget.addressNode!.company == null ||
      //         widget.addressNode!.company == "null"
      //     ? ""
      //     : widget.addressNode!.company.toString();
      firstNameController.text = widget.addressNode!.firstName == null ||
              widget.addressNode!.firstName == "null"
          ? ""
          : widget.addressNode!.firstName.toString();
      lastNameController.text = widget.addressNode!.lastName == null ||
              widget.addressNode!.lastName == "null"
          ? ""
          : widget.addressNode!.lastName.toString();

      phoneController.text = widget.addressNode!.phone == null ||
              widget.addressNode!.phone == "null"
          ? ""
          : widget.addressNode!.phone.toString();
      provinceController.text = widget.addressNode!.province == null ||
              widget.addressNode!.province == "null"
          ? ""
          : widget.addressNode!.province.toString();
      countryController.text = widget.addressNode!.country == null ||
              widget.addressNode!.country == "null"
          ? ""
          : widget.addressNode!.country.toString();
      zipController.text =
          widget.addressNode!.zip == null || widget.addressNode!.zip == "null"
              ? ""
              : widget.addressNode!.zip.toString();
      // nameController.text = widget.addressNode!.name.toString();
      provinceCode = widget.addressNode!.provinceCode == null ||
              widget.addressNode!.provinceCode == "null"
          ? ""
          : widget.addressNode!.provinceCode.toString();
      countryCode = widget.addressNode!.countryCode == null ||
              widget.addressNode!.countryCode == "null"
          ? ""
          : widget.addressNode!.countryCode.toString();
      countryName = widget.addressNode!.country == null ||
              widget.addressNode!.country == "null"
          ? ""
          : widget.addressNode!.country.toString();
      countryCodeController.text = widget.addressNode!.country == null ||
              widget.addressNode!.country == "null"
          ? ""
          : widget.addressNode!.country.toString();

      CountryCodeBloc.GetCountryCode(
              widget.addressNode!.phone.toString(), countryCode)
          .then((value) {
        numberCode = value;
        phoneController.text =
            widget.addressNode!.phone.toString().replaceAll(numberCode, "");
        setState(() {});
      });
    }
    // TODO: implement initState
    super.initState();
  }

  Countries? data;
  String zipValidation = "";
  IconData? validInvalidZipIcon;
  bool zipcodestatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Container(
              width: 35, //MediaQuery.of(context).size.width * 0.09,
              height: 35, //MediaQuery.of(context).size.height * 0.09,
              padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
              child: SvgPicture.asset("assets/images/arrow-back.svg",
                  colorFilter: ColorFilter.mode(
                      AppTheme.appBarTextColor!, BlendMode.srcIn)),
            ),
            onPressed: () {
              context.pop();
            }),
        title: Text(LanguageManager.translations()['AddressScreen']!),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Container(
                  // height : 350,
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppTheme.primaryColor!
                      // gradient: LinearGradient(
                      //   colors: [AppTheme.black!.withOpacity(0.9), AppTheme.borderColor!],
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.topRight,
                      // ),
                      ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //   IconButton(onPressed: (){
                                //     // if(option=="back"){
                                //     //      context.goNamed("${Routes.addressListscreen}",pathParameters: {"type": "back"});
                                //     // }
                                // //  context.pop();
                                // context.go("/${Routes.dashboardScreen}");
                                // // Navigator.pop(context);
                                //   }, icon:  Icon(Icons.arrow_back))
                                //  ,
                              ],
                            ),
                          ),
                        ),
                        GapWidget(
                          size: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GapWidget(
                              size: -5,
                            ),
                            // Text('Address',
                            //     style: CustomTextTheme.getTextStyle(
                            //         MyTextStyle.CommonThemeTitle, context)
                            //     // style: TextStyle(
                            //     //   fontSize: 24,
                            //     //   color:AppTheme.white,
                            //     // ),
                            //     ),
                          ],
                        ),
                        GapWidget(
                          size: 5,
                        ),
                        // buildContactInfo(
                        //     Icons.phone, '1515151551515', context),
                        // buildContactInfo(Icons.email,
                        //     'mailto:itgeeks@example.caom', context),
                        // buildContactInfo(
                        //     Icons.location_city, 'Canada,USA,India', context),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: _buildContainer(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactInfo(IconData icon, String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        GapWidget(),
        Text(text,
            style: CustomTextTheme.getTextStyle(
                MyTextStyle.CommonThemeSubTitle, context)
            // style: TextStyle(
            //   fontSize: 15,
            //   color:AppTheme.white,
            // ),
            ),
      ],
    );
  }

  Widget _buildContainer(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddressScreenBloc(),
        ),
        BlocProvider(
          create: (context) => ZipCodeBloc(),
        ),
      ],
      child: BlocListener<AddressScreenBloc, AddressScreenState>(
        listener: (context, state) {
          // if (state is AddressScreenLoading) {
          //   LoadingDialog.show(context);
          // } else if (state is AddressScreenInitial) {
          // } else {
          //   LoadingDialog.hide(context);
          // }
          // if (state is AddAddressErrorState) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context, message: state.error);

          // }
          if (state is AddressScreenLoaded) {
            // LoadingDialog.show(context);
            if (widget.option == "edit") {
              // Dialogs.SuccessAlertInOut(
              //     context: context,
              //     message: LanguageManager.translations()['AddressUpdate']!);
              context.pop(true);
            } else {
              // Dialogs.SuccessAlertInOut(
              //     context: context,
              //     message: LanguageManager.translations()['AddressCreate']!);
              context.pop(true);
            }
            // context.pop();
            //  Future.delayed(Duration(seconds: 3));
            // context.push("/${Routes.addressListscreen}");
          }

          //   print(state);

          // TODO: implement listener}
          // if (state is Success) {
          //   Navigator.of(context).pop(true);
          // }
          // else if (state is RequiredCountry) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message:
          //          "country required");
          // }
          // if(state is ZipCodeLoaded){
          //   setState(() {
          //   provinceController.text=state.codeList!.first.state.toString();

          //   });
          // }
          // if (state is RequiredZip) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['ZipCodeRequired']!);
          // } else if (state is RequiredAddress1) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['Address1Required']!);
          // } else if (state is RequiredAddressFirstName) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['firstNameRequired']!);
          // } else if (state is RequiredAddressLastName) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['lastNameRequired']!);
          // } else if (state is RequiredAddressCompany) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['companyRequired']!);
          // } else if (state is RequiredAddress1) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['Address1Required']!);
          // } else if (state is RequiredAddress2) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['address2Required']!);
          // } else if (state is RequiredCity) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()['cityrequired']!);
          // } else if (state is RequiredProvince) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context, message: "state required");
          // } else if (state is RequiredPhoneNumber) {
          //   Dialogs.ErrorAlertInOut(
          //       context: context,
          //       message: LanguageManager.translations()[
          //           'phonenumbershouldnotbeempty']!);
          // }
        },
        child: BlocBuilder<AddressScreenBloc, AddressScreenState>(
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
                    padding: EdgeInsets.all(15),
                    // height: 480,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField()
                              .SimpleTextFormFieldWithSuffixIcon(
                                  canRequestFocus: false,
                                  controller: countryCodeController,
                                  hintText: LanguageManager.translations()[
                                      'SelectCountry']!,
                                  suffixIcon: Icons.arrow_drop_down,
                                  context: context,
                                  onClick: () async {
                                    data = await context.pushNamed(
                                        Routes.countryCode) as Countries;
                                    countryName =
                                        (data!.name.toString()).toUpperCase();
                                    countryCode =
                                        data!.code.toString().toUpperCase();
                                    numberCode =
                                        CountryListData.countryPhoneCodes[
                                            data!.code.toString()]!;
                                    countryCodeController.text = countryName;
                                    provinceController.text = "";
                                    setState(() {});
                                    print(
                                        "data is countryName  :${countryName}");
                                  }),
                          GapWidget(),

                          CustomTextFormField()
                              .SimpleTextFormFieldWithSuffixIcon(
                                  canRequestFocus: false,
                                  hintText: LanguageManager.translations()[
                                      'EnterYourProvince']!,
                                  suffixIcon: Icons.arrow_drop_down,
                                  context: context,
                                  controller: provinceController,
                                  onClick: () async {
                                    if (countryCodeController.text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'pleaseSelectCountryFirst']);
                                    } else if (data!.provinces!.length == 0) {
                                      provinceController.text =
                                          data!.name.toString();
                                    } else {
                                      StateCodeScreen stateCode =
                                          StateCodeScreen(data!);

                                      Provinces provinces = await (context.push(
                                          "/${Routes.stateCodeScreen}",
                                          extra: stateCode)) as Provinces;

                                      if (provinces != null) {
                                        provinceCode = provinces.code!;
                                        provinceController.text =
                                            provinces.name.toString();
                                        setState(() {});
                                      }
                                    }
                                  }),

                          GapWidget(),
                          CustomTextFormField().SimpleTextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              hintText: LanguageManager.translations()[
                                  'EnterYourAddress 1']!,
                              // prefixIcon:
                              //     "assets/images/Email.svg", //Icons.streetview,
                              context: context,
                              controller: address1Controller,
                              obscureText: false),
                          // GapWidget(),
                          // CustomTextFormField().SimpleTextFormField(
                          //     textCapitalization: TextCapitalization.sentences,
                          //     hintText: LanguageManager.translations()[
                          //         'EnterYourAddress 2']!,
                          //     // prefixIcon:
                          //     //     "assets/images/Email.svg", //Icons.location_city,
                          //     context: context,
                          //     controller: address2Controller,
                          //     obscureText: false),
                          GapWidget(),
                          CustomTextFormField().SimpleTextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              hintText: LanguageManager.translations()[
                                  'EnterYourCity']!,
                              // prefixIcon:
                              //     "assets/images/Email.svg", //Icons.location_city,
                              context: context,
                              controller: cityController,
                              obscureText: false),
                          GapWidget(),

                          globals.plugins.containsKey(
                                  PluginsEnum.ZIP_CODE_VALIDATOR.name)
                              ? BlocListener<ZipCodeBloc, ZipCodeState>(
                                  listener: ((context, state) {
                                    if (state is RequiredZipState) {
                                      validInvalidZipIcon = Icons.close;
                                      zipcodestatus = false;
                                    } else {
                                      validInvalidZipIcon = Icons.check;
                                      zipcodestatus = true;
                                    }
                                  }),
                                  child: BlocBuilder<ZipCodeBloc, ZipCodeState>(
                                      builder: ((context, state) {
                                    return Focus(
                                      onFocusChange: (hasFocus) {
                                        if (hasFocus == false) {
                                          print("focus are in working");
                                          BlocProvider.of<ZipCodeBloc>(context)
                                              .zipCodeApi(
                                                  countryCode, zipValidation);
                                          setState(() {
                                            // provinceController.text = BlocProvider.of<AddressScreenBloc>(context).province;
                                          });
                                        } else {
                                          validInvalidZipIcon = null;
                                          setState(() {});
                                        }
                                      },
                                      child: CustomTextFormField()
                                          .SimpleTextFormFieldWithBothIcon(
                                              keyboardType:
                                                  TextInputType.number,
                                              hintText: LanguageManager
                                                      .translations()[
                                                  'EnterYourZip']!,
                                              onChanged: (value) {
                                                zipValidation = value;
                                              },
                                              // prefixIcon: Icons.streetview,
                                              suffixIcon:
                                                  state is ZipCodeLoadingState
                                                      ? Icons.circle_outlined
                                                      : validInvalidZipIcon,
                                              context: context,
                                              controller: zipController,
                                              suffixIconColor: state
                                                      is ZipCodeLoadingState
                                                  ? Colors.yellow
                                                  : state is RequiredZipState
                                                      ? AppTheme.errorColor
                                                      : AppTheme.successColor,
                                              obscureText: false),
                                    );
                                  })),
                                )
                              : CustomTextFormField().SimpleTextFormField(
                                  keyboardType: TextInputType.number,
                                  hintText: LanguageManager.translations()[
                                      'EnterYourZip']!,
                                  // prefixIcon:
                                  //     "assets/images/Email.svg", //Icons.streetview,
                                  context: context,
                                  controller: zipController,
                                  obscureText: false),
                          GapWidget(),

                          // CustomTextFormField().SimpleTextFormField(
                          //     textCapitalization: TextCapitalization.sentences,
                          //     hintText: LanguageManager.translations()[
                          //         'EnterYourCompany']!,
                          //     // prefixIcon:
                          //     //     "assets/images/Email.svg", //Icons.location_city,
                          //     context: context,
                          //     controller: companyController,
                          //     obscureText: false),
                          // GapWidget(),
                          Row(children: [
                            Expanded(
                                child: CustomTextFormField()
                                    .SimpleTextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        hintText:
                                            LanguageManager.translations()[
                                                'EnterYourFirstName']!,
                                        // prefixIcon:
                                        //     "assets/images/Email.svg", //Icons.location_city,
                                        context: context,
                                        controller: firstNameController,
                                        obscureText: false)),
                            GapWidget(),
                            Expanded(
                                child: CustomTextFormField()
                                    .SimpleTextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        hintText:
                                            LanguageManager.translations()[
                                                'EnterYourLastName']!,
                                        // prefixIcon:
                                        //     "assets/images/Email.svg", //Icons.streetview,
                                        context: context,
                                        controller: lastNameController,
                                        obscureText: false))
                          ]),

                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          // keyboardType: TextInputType.number
                          GapWidget(),
                          CustomTextFormField()
                              .SimpleTextFormFieldWithPrefixIconAndCountryCodeWithCursor(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  hintText: LanguageManager.translations()[
                                      'Enterphonenumber']!,
                                  phoneCode: numberCode,
                                  prefixIcon: "",
                                  context: context,
                                  onClickCountry: () async {
                                    Countries data = await context.pushNamed(
                                        Routes.countryCode) as Countries;
                                    print("data is ${data.code}");
                                    numberCode =
                                        CountryListData.countryPhoneCodes[
                                            data.code.toString()]!;
                                    setState(() {});
                                  }),
                          GapWidget(),
                          state is AddressScreenLoading
                              ? CustomDialogButton()
                              : CustomButton(
                                  text: widget.option == "edit"
                                      ? LanguageManager.translations()[
                                          'Save Address']!
                                      : LanguageManager.translations()[
                                          'CreateAddress']!,
                                  onPressed: () async {
                                    //   print("object--->>>>${countryName}----==");
                                    if (countryName.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'countryRequired']);
                                    } else if (provinceController
                                        .text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'provinceRequired']);
                                    } else if (address1Controller
                                        .text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'addressRequired']);
                                    }
                                    // else if (address2Controller.text.isEmpty) {
                                    //   Dialogs.ErrorAlertInOut(
                                    //       context: context,
                                    //       message: "Address2 is Required");
                                    // }
                                    else if (cityController.text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message: LanguageManager
                                              .translations()['cityrequired']!);
                                    } else if (zipController.text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'ZipCodeRequired']!);
                                    }
                                    // else if (companyController.text.isEmpty) {
                                    //   Dialogs.ErrorAlertInOut(
                                    //       context: context,
                                    //       message: LanguageManager.translations()[
                                    //           'companyRequired']!);
                                    // }
                                    else if (firstNameController.text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'firstNameRequired']!);
                                    } else if (lastNameController
                                        .text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'lastNameRequired']!);
                                    } else if (phoneController.text.isEmpty) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message: LanguageManager
                                                  .translations()[
                                              'phonenumbershouldnotbeempty']!);
                                    } else if (!Validations.mobileValidation(
                                        phoneController.text)) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message: LanguageManager
                                              .translations()['contactNumber']
                                          // LanguageManager
                                          //         .translations()[
                                          //     'phonenumbershouldnotbeempty']!
                                          );
                                    } else if (address1Controller.text.length <
                                        6) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'Address1Required']!);
                                    }

                                    // else if (address2Controller.text.length < 6) {
                                    //   Dialogs.ErrorAlertInOut(
                                    //       context: context,
                                    //       message: LanguageManager.translations()[
                                    //           'Address2Required']!);
                                    // }
                                    //
                                    else if (zipcodestatus == false &&
                                        globals.plugins.containsKey(PluginsEnum
                                            .ZIP_CODE_VALIDATOR.name)) {
                                      Dialogs.ErrorAlertInOut(
                                          context: context,
                                          message:
                                              LanguageManager.translations()[
                                                  'zipCodeInvalid']);
                                    } else {
                                      // bool? pnov =
                                      //     await p.PhoneNumberUtil.isValidPhoneNumber(
                                      //         phoneController.text, countryCode);
                                      // print("countryCode..${countryCode}");
                                      // print("isValidPhoneNumber .... ${pnov}");
                                      //
                                      // if (pnov == false) {
                                      //   Dialogs.ErrorAlertInOut(
                                      //       context: context,
                                      //       message: "Invalid mobile no.");
                                      //   return;
                                      // }

                                      BlocProvider.of<AddressScreenBloc>(
                                              context)
                                          .add(
                                        AddressEvent(
                                          widget.option == "add"
                                              ? null
                                              : widget.addressNode!.id,
                                          address1Controller.text.trim(),
                                          // address2Controller.text.trim(),
                                          cityController.text.trim(),
                                          // companyController.text.trim(),
                                          firstNameController.text.trim(),
                                          lastNameController.text.trim(),
                                          widget.option == "add"
                                              ? numberCode +
                                                  phoneController.text.trim()
                                              : numberCode +
                                                  phoneController.text.trim(),
                                          provinceController.text.trim(),
                                          countryName.trim(),
                                          zipController.text.trim(),
                                          firstNameController.text.trim() +
                                              " " +
                                              lastNameController.text.trim(),
                                          provinceController.text == countryName
                                              ? countryCode.trim()
                                              : provinceCode.trim(),
                                          countryCode.trim(),
                                          countryName.trim(),
                                          widget.addressNode == null
                                              ? false
                                              : true,
                                        ),
                                      );
                                      //  context.read<AddressAddBloc>().add(OnAddAddressButtonClick(
                                      //        address1Controller.text,
                                      //        address2Controller.text,
                                      //        cityController.text,
                                      //        companyController.text,
                                      //        firstNameController.text,
                                      //        lastNameController.text,
                                      //        phoneController.text,
                                      //           provinceController.text,
                                      //           countryController.text,
                                      //           zipController.text,
                                      //           nameController.text,
                                      //           provinceCodeController.text,
                                      //           countryCodeController.text,
                                      //           countryNameController.text,

                                      //           ));
                                      // await Future.delayed(Duration(seconds: 2));
                                      // Navigator.pop(context);
                                      setState(() {});
                                    }
                                  },
                                )
                        ],
                      ),
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
}
/*
 {id: gid://shopify/MailingAddress/8876106350844?model_name=CustomerAddress, address1: Xhexjefjx. Jejed, address2: Jecjedef efehd, city: Hedje, company: Hsxjexj, firstName: Hedje, lastName: Hedhe, phone: +12119466456, province: Alaska, country: INDIA, zip: 99501, name: Hedje Hedhe, province_code: AK, country_code: null, country_name: INDIA}

{id: gid://shopify/MailingAddress/8876106350844?model_name=CustomerAddress, address1: Xhexjefjx. Jejed, address2: Jecjedef efehd, city: Hedje, company: Hsxjexj, firstName: Hedje, lastName: Hedhe, phone: +91+12119466456, province: Alaska, country: INDIA, zip: 99501, name: Hedje Hedhe, province_code: AK, country_code: US, country_name: INDIA}

{id: gid://shopify/MailingAddress/8876106350844?model_name=CustomerAddress, address1: Xhexjefjx. Jejed, address2: Jecjedef efehd, city: Hedje, company: Hsxjexj, firstName: Hedje, lastName: Hedhe, phone: +1+12119466456, province: Alaska, country: UNITED STATES, zip: 99501, name: Hedje Hedhe, province_code: AK, country_code: US, country_name: UNITED STATES}
 */
