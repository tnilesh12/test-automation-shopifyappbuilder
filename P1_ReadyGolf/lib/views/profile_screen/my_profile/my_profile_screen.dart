import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/views/widgets/image_picker/custom_image_picker.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/utils/theme_size.dart';
import '/views/profile_screen/my_profile/bloc/my_profile_screen_bloc.dart';
import '/views/profile_screen/my_profile/bloc/my_profile_screen_event.dart';
import '/views/profile_screen/my_profile/bloc/my_profile_screen_state.dart';
import '/views/widgets/common/custom_button.dart';
import '/views/widgets/common/custom_dialog_button.dart';
import '/views/widgets/common/custom_textfield.dart';
import '/views/widgets/common/gap_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({super.key}) {}

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  String phoneCode = "+1";

  getData() async {
    ShopifyUser? shopifyUser = await Session().getLoginData();
    print("--------------------${shopifyUser!.toJson()}");
    firstNameController.text = shopifyUser.firstName.toString();
    lastNameController.text = shopifyUser.lastName.toString();
    //mobileController.text = shopifyUser.phone.toString();

    String OriginalPhoneNumber = shopifyUser.phone.toString();

    PhoneNumber phoneNumber =
        await PhoneNumber.getRegionInfoFromPhoneNumber(OriginalPhoneNumber);

    String? phoneN = phoneNumber.phoneNumber;

    // Remove the plus sign from the phone number
    String phoneNumberWithoutPlus = phoneN!.replaceAll('+', '');
    String dialCode = phoneNumber.dialCode!;

    mobileController.text = removeDialCode(phoneNumberWithoutPlus, dialCode);

    phoneCode = "+" + dialCode;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  File? _file = File("");
  String blocImage = "";

  @override
  Widget build(BuildContext context) {
    //
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
          title: Text(
            LanguageManager.translations()["UpdateProfile"],
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: BlocProvider(
            create: (context) => MyProfileScreenBloc(),
            child: BlocListener<MyProfileScreenBloc, MyProfileScreenState>(
              listener: (context, state) async {
                print(state);
                // if (state is MyProfileScreenLoading) {
                //   LoadingDialog.show(context);
                // } else if (state is MyProfileScreenInitialState) {
                // } else {
                //   LoadingDialog.hide(context);
                // }

                if (state is MyProfileScreenSuccessState) {
                  Dialogs.SuccessAlertInOut(
                    context: context,
                    message: state.success,
                  );
                  context.pop();
                }

                // if (state is ImageSuccessState) {
                //   Dialogs.SuccessAlertInOut(
                //       context: context, message: state.success.toString());
                //   // setState(() {});
                // }

                if (state is MyProfileAPIFailureState) {
                  Dialogs.ErrorAlertInOut(
                      context: context, message: state.message.toString());
                }

                if (state is MyProfileScreenErrorState) {
                  Dialogs.ErrorAlertInOut(
                      context: context, message: state.error.toString());
                }

                if (state is ProfileImageUploadedState) {
                  blocImage = state.data.toString();
                  if (blocImage == "null") {
                    blocImage = "";
                  }

                  print("blocImage.............${blocImage}");
                  // setState(() {});
                }

                // TODO: implement listener
              },
              child: BlocBuilder<MyProfileScreenBloc, MyProfileScreenState>(
                builder: (context1, state) {
                  return Container(
                    // padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child:
                              // Container(
                              //   height: 500,
                              //   width: 500,
                              //   child: InkResponse(
                              //     onTap: () async {
                              //       await imageSlideSheet(context);
                              //       setState(() {});
                              //     },
                              //     child: Icon(
                              //       Icons.edit,
                              //       size: 19,
                              //       color: AppTheme.appBarTextColor,
                              //     ),
                              //   ),
                              // )
                              Container(
                            // height : 350,
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: AppTheme.primaryColor!
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     AppTheme.black!.withOpacity(0.9),
                                    //     AppTheme.borderColor!
                                    //   ],
                                    //   begin: Alignment.bottomLeft,
                                    //   end: Alignment.topRight,
                                    // ),
                                    ),
                          ),
                        ),
                        // Positioned(
                        //     top: 240,
                        //     left: 0,
                        //     right: 0,
                        //     child:
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child:
                                      //  (state is ProfileImageLoadingState &&
                                      //         state is! ImageSuccessState)
                                      //     ?
                                      //     ClipRRect(
                                      //         borderRadius: BorderRadius.circular(100),
                                      //         child: Image.asset(
                                      //           AppAssets.loadingImg,
                                      //           height: 200,
                                      //           width: 200,
                                      //           fit: BoxFit.fill,
                                      //           alignment: Alignment.center,
                                      //         ),
                                      //       )
                                      //     :
                                      Stack(children: [
                                    blocImage.isEmpty
                                        // ||
                                        // blocImage == ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              AppAssets.placeholder,
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.fill,
                                              alignment: Alignment.center,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: _file!.path.isEmpty
                                                // &&
                                                //         blocImage.isNotEmpty
                                                ?
                                                // Image.network(
                                                //     blocImage,
                                                //     height: 150,
                                                //     width: 150,
                                                //     fit: BoxFit.fill,
                                                //     alignment: Alignment.center,
                                                //   )
                                                Container(
                                                    alignment: Alignment.center,
                                                    height: 150,
                                                    width: 150,
                                                    child: Container(
                                                      height: 150,
                                                      width: 150,
                                                      child: WidgetImage(
                                                        blocImage,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ))
                                                : Image.file(
                                                    File(
                                                        //  blocImage!
                                                        // BlocProvider.of<
                                                        //             MyProfileScreenBloc>(
                                                        //         context1)
                                                        //     .data['profileImage']

                                                        _file!.path),
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.fill,
                                                    alignment: Alignment.center,
                                                  )
                                            //  Image.file(
                                            //   File(_file!.path),
                                            //   fit: BoxFit.cover,
                                            // ),
                                            ),
                                    Positioned(
                                      top: 110,
                                      right: 10,
                                      child: InkWell(
                                          onTap: () async {
                                            // Image.file(File(_file!.path));
                                            // Future<String> imageSlideSheet(BuildContext ctx) async {
                                            // var res =
                                            await showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return BottomSheet(
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                          color:
                                                              Color(0xFF737373),
                                                          child: Container(
                                                              height: 210,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          12,
                                                                          18,
                                                                          10,
                                                                          0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      LanguageManager
                                                                              .translations()[
                                                                          'takeImage'],
                                                                      // LanguageManager.translations()[
                                                                      //     "Take the image"],
                                                                      maxLines:
                                                                          3,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppTheme.appBarTextColor),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        InkResponse(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              // Container(
                                                                              //   padding: EdgeInsets.fromLTRB(0, 14, 0, 11),
                                                                              //   child: Icon(Icons.cancel_outlined),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.08,
                                                                                height: MediaQuery.of(context).size.height * 0.08,
                                                                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                                                                child: SvgPicture.asset(
                                                                                  "assets/images/close-icon.svg",
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LanguageManager.translations()['Cancel'],
                                                                                // LanguageManager.translations()["Cancel"],
                                                                                maxLines: 1,
                                                                                style: TextStyle(color: AppTheme.appBarTextColor),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          onTap:
                                                                              () {
                                                                            context1.pop();
                                                                          },
                                                                        ),
                                                                        InkResponse(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              // Container(
                                                                              //   padding: EdgeInsets.fromLTRB(0, 14, 0, 11),
                                                                              //   child: Icon(Icons.camera_alt_outlined),
                                                                              // ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.08,
                                                                                height: MediaQuery.of(context).size.height * 0.08,
                                                                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                                                                child: SvgPicture.asset(
                                                                                  "assets/images/camera.svg",
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LanguageManager.translations()['Camera'],
                                                                                // LanguageManager.translations()["Camera"],
                                                                                maxLines: 1,
                                                                                style: TextStyle(color: AppTheme.appBarTextColor),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          onTap:
                                                                              () async {
                                                                            _file =
                                                                                await CustomImagePicker().imgFromCamera();
                                                                            if (_file!.path.isNotEmpty) {
                                                                              BlocProvider.of<MyProfileScreenBloc>(context1).add(ImageUploadEvent(_file!));
                                                                              blocImage = _file!.path.toString();
                                                                            } else {
                                                                              if (blocImage.contains("cache")) {
                                                                                var file = File(blocImage);
                                                                                _file = file;
                                                                              }
                                                                            }
                                                                            // print("Camera--------->" +
                                                                            //     _file!.path.toString() +
                                                                            //     "<---------->" +
                                                                            //     _file.toString());
                                                                            // BlocProvider.of<ImageUploadingBloc>(ctx)
                                                                            //     .add(StartUploadingEvent(
                                                                            //         _file!.path.toString()));
                                                                            // UploadedFileName = _file!.path;
                                                                            context1.pop();

                                                                            //await ImagesUpload().upload(_file);
                                                                          },
                                                                        ),
                                                                        InkResponse(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              // Container(
                                                                              //   padding: EdgeInsets.fromLTRB(0, 14, 0, 11),
                                                                              //   child: Icon(Icons.photo_album_outlined),
                                                                              // ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.08,
                                                                                height: MediaQuery.of(context).size.height * 0.08,
                                                                                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                                                                child: SvgPicture.asset(
                                                                                  "assets/images/gallery.svg",
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                LanguageManager.translations()['gallery'],
                                                                                // LanguageManager.translations()["gallery"],
                                                                                maxLines: 1,
                                                                                style: TextStyle(color: AppTheme.appBarTextColor),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          onTap:
                                                                              () async {
                                                                            _file =
                                                                                await CustomImagePicker().openGallery();
                                                                            if (_file!.path.isNotEmpty) {
                                                                              BlocProvider.of<MyProfileScreenBloc>(context1).add(ImageUploadEvent(_file!));
                                                                              blocImage = _file!.path.toString();
                                                                            } else {
                                                                              if (blocImage.contains("cache")) {
                                                                                var file = File(blocImage);
                                                                                _file = file;
                                                                              }
                                                                            }
                                                                            // print("Gallery--------->" +
                                                                            //     _file!.path.toString() +
                                                                            //     "<---------->" +
                                                                            //     _file.toString());

                                                                            // BlocProvider.of<ImageUploadingBloc>(ctx)
                                                                            //     .add(StartUploadingEvent(
                                                                            //         _file!.path.toString()));
                                                                            context1.pop();
                                                                          },
                                                                        )
                                                                      ],
                                                                    )
                                                                  ])));
                                                    },
                                                    onClosing: () {
                                                      print(
                                                          "on closing=========================");
                                                    },
                                                  );
                                                });
                                            //   return '';
                                            // }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: AppTheme.white,
                                                // .withAlpha(50),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              child: SvgPicture.asset(
                                                "assets/images/edit.svg",
                                              ),
                                            ),
                                          )),
                                    )
                                  ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        ThemeSize.themeBorderRadius),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                        ThemeSize.themeBorderRadius,
                                      )),
                                      elevation: ThemeSize.themeElevation,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 30),
                                          // height: 480,
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         0.6,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // SizedBox(
                                                //   height: 30,
                                                // ),
                                                CustomTextFormField()
                                                    .SimpleTextFormFieldWithPrefixIcon(
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        controller:
                                                            firstNameController,
                                                        hintText: LanguageManager
                                                                .translations()[
                                                            "Enterfirstnamehere"],
                                                        prefixIcon:
                                                            "assets/images/user.svg", //Icons.person,
                                                        context: context),
                                                GapWidget(size: 10),
                                                CustomTextFormField()
                                                    .SimpleTextFormFieldWithPrefixIcon(
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        controller:
                                                            lastNameController,
                                                        hintText: LanguageManager
                                                                .translations()[
                                                            "Enterlastnamehere"],
                                                        prefixIcon:
                                                            "assets/images/user.svg", //Icons.person,
                                                        context: context),
                                                GapWidget(size: 10),
                                                // CustomTextFormField()
                                                //     .SimpleTextFormFieldWithPrefixIcon(
                                                //         controller:
                                                //             emailController,
                                                //         hintText:
                                                //             "Enter email here",
                                                //         // prefixIcon: Icons.lock,
                                                //         context: context),
                                                // GapWidget(size: 10),

                                                CustomTextFormField()
                                                    .SimpleTextFormFieldWithPrefixIconAndCountryCodeWithCursor(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        controller:
                                                            mobileController,
                                                        hintText: LanguageManager
                                                                .translations()[
                                                            "Enterphonenohere"],
                                                        phoneCode: phoneCode,
                                                        prefixIcon:
                                                            "assets/images/phone_no.svg",
                                                        context: context,
                                                        onClickCountry:
                                                            () async {
                                                          Countries data =
                                                              await context
                                                                      .pushNamed(
                                                                          Routes
                                                                              .countryCode)
                                                                  as Countries;
                                                          print(
                                                              "data is ${data.code}");
                                                          phoneCode = CountryListData
                                                                  .countryPhoneCodes[
                                                              data.code
                                                                  .toString()]!;
                                                          setState(() {});
                                                        }),
                                                GapWidget(size: 10),
                                                //    (state is ProfileImageLoadingState &&
                                                // state is! ImageSuccessState)
                                                state is MyProfileScreenLoading ||
                                                        state
                                                            is ProfileImageLoadingState
                                                    ? CustomDialogButton()
                                                    : Container(
                                                        // width: MediaQuery.of(context).size.width * 0.3,
                                                        child: CustomButton(
                                                          text: LanguageManager
                                                                  .translations()[
                                                              "Update"],
                                                          onPressed: () {
                                                            print(
                                                                "sdfsdfsd...........");
                                                            BlocProvider.of<MyProfileScreenBloc>(context1).add(
                                                                MyProfileScreenSubmitEvent(
                                                                    firstNameController
                                                                        .text
                                                                        .trim(),
                                                                    lastNameController
                                                                        .text
                                                                        .trim(),
                                                                    mobileController
                                                                            .text
                                                                            .isEmpty
                                                                        ? " "
                                                                        : phoneCode +
                                                                            mobileController
                                                                                .text,
                                                                    BlocProvider.of<MyProfileScreenBloc>(context1).data ==
                                                                            null
                                                                        ? BlocProvider.of<MyProfileScreenBloc>(context1).profileImage ==
                                                                                null
                                                                            ? ""
                                                                            : BlocProvider.of<MyProfileScreenBloc>(context1)
                                                                                .profileImage
                                                                        : BlocProvider.of<MyProfileScreenBloc>(context1).data[0]
                                                                            [
                                                                            'url']));
                                                          },
                                                        ),
                                                      ),
                                              ])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }
}
