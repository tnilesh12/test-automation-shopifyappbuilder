import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/validations.dart';
import 'package:shopifyappbuilder/preview_app/dashbaord/partner_dashboard.dart';
import '/views/common_screens/shop_not_valid_screen.dart';
import 'bloc/partner_login_bloc.dart';

class PartnerLoginScreen extends StatelessWidget {
  PartnerLoginScreen({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => PartnerLoginBloc(),
        child: BlocListener<PartnerLoginBloc, PartnerLoginState>(
          listener: (context, state) async {
            if (state is PartnerAlreadyLoggedInState) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return PartnerDashboard();
                },
              ));
            }
            if (state is PartnerLoginDialogSuccessState) {
              String? shopName = await Dialogs.showPartnerShopListDialog(
                  context, state.partnerShopList, "Select Your Shop");
              if (shopName != "") {
                AppConfig.APP_DOMAIN = shopName!;
                await Session().setShopName(shopName);
                context.read<PartnerLoginBloc>().add(OnLoginButtonClick(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    shopName));
              }
            }
            if (state is PartnerLoginSuccessState) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return PartnerDashboard();
                },
              ));
            }

            if (state is PartnerLoginScreenShopNotValidState) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return ShopNotValidScreen(showappbar: true);
                },
              ));
            }
            if (state is PartnerLoginErrorState) {
              Dialogs.ErrorAlertInOut(context: context, message: state.error);
            }
          },
          child: BlocBuilder<PartnerLoginBloc, PartnerLoginState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(30.0),
                width: double.infinity,
                // color: Colors.grey.shade300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 224, 246, 123),
                    Color.fromARGB(255, 246, 247, 241),
                  ],
                  // end: const FractionalOffset(1.0, 1.0),
                  // begin: const FractionalOffset(-1.0, -1.0),
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        // width: 200,
                        height: 200,
                        child: Image.asset("assets/app_logo/ic_app_icon.png")
                        // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                        ),

                    TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            // Set border for enabled state (default)
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // Set border for focused state
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            // Set border for enabled state (default)
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // Set border for focused state
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ))),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                          child: (state is PartnerLoginSubmittingState)
                              ? SizedBox(
                                  child: Image.asset(
                                    AppAssets.loadingImg,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  " Login ",
                                ),
                          onPressed: (state is PartnerLoginSubmittingState)
                              ? () {}
                              : () {
                                  if (emailController.text.isEmpty) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: 'Email Required');
                                  } else if (passwordController.text.isEmpty) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: 'Password Required');
                                  } else if (!Validations.emailValidation(
                                      emailController.text)) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: 'Email Invalid');
                                  } else if (passwordController.text
                                              .trim()
                                              .length <
                                          5 ||
                                      passwordController.text.contains(" ")) {
                                    Dialogs.ErrorAlertInOut(
                                        context: context,
                                        message: 'Password Character');
                                  } else {
                                    context.read<PartnerLoginBloc>().add(
                                        OnLoginButtonClick(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                            ""));
                                  }
                                }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("-------"),
                        Text(" OR "),
                        Text("-------"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                          icon: Icon(Icons.qr_code),
                          label: (state is PartnerBarcodeLoginSubmittingState)
                              ? SizedBox(
                                  child: Image.asset(
                                  AppAssets.loadingImg,
                                  color: Colors.white,
                                ))
                              : Text(
                                  "Scan BarCode",
                                ),
                          onPressed:
                              (state is PartnerBarcodeLoginSubmittingState)
                                  ? () {}
                                  : () {
                                      context
                                          .read<PartnerLoginBloc>()
                                          .add(OnBarcodeButtonClick());
                                    }),
                    ),
                    SizedBox(height: 30),

                    Text(
                      "For QR-Code Code open your mobilify app in shopify panel and at the top right you will see your store QR-Code for login in app.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                    // Text(
                    //   scanResult == null
                    //       ? "Scan a code!"
                    //       : "Scan Result : $scanResult",
                    //   style: TextStyle(fontSize: 15),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Future scanBarcode(BuildContext context) async {
  //   String scanResult;
  //   try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //         "#ffffff", "Exit", false, ScanMode.QR);
  //   } on PlatformException {
  //     scanResult = 'Failed to get platform version.';
  //   }
  //   // if (!mounted) return;
  //
  //   print("Scaning result... ${scanResult}");
  //   // if (scanResult == "-1") return;
  //   AppConfig.APP_DOMAIN = "itgeeks-mobilify.myshopify.com";
  //   scanResult == "Theme1"
  //       ? {
  //           print("theme1"),
  //           Navigator.pushReplacement(context, MaterialPageRoute(
  //             builder: (context) {
  //               return ThemePreviewScreen();
  //             },
  //           ))
  //         }
  //       : scanResult == "Theme2"
  //           ? Navigator.pushReplacement(context, MaterialPageRoute(
  //               builder: (context) {
  //                 return ThemePreviewScreen();
  //               },
  //             ))
  //           : scanResult == "Theme3"
  //               ? Navigator.pushReplacement(context, MaterialPageRoute(
  //                   builder: (context) {
  //                     return ThemePreviewScreen();
  //                   },
  //                 ))
  //               : Navigator.pushReplacement(context, MaterialPageRoute(
  //                   builder: (context) {
  //                     return ThemePreviewScreen();
  //                   },
  //                 ));
  //
  //   // setState(()
  //   // =>this.scanResult=scanResult
  //
  //   // );
  // }
}
