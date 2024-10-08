// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:shopify_code/modelClass/cart/cart.dart';
// import 'package:shopify_code/session/session.dart';
// import 'package:shopify_code/theme/app_theme.dart';
// import 'package:shopify_code/util/dialogs.dart';
// import 'package:shopify_code/theme/custom_text_theme.dart';
// import 'package:shopify_code/theme/my_text_style.dart';
// import 'package:shopify_code/util/routes.dart';
// import 'package:shopify_code/util/setting_enum.dart';
// import '/utils/theme_size.dart';
// import '/theme3/views/checkout/lineitems_count.dart';
// import '/theme3/views/checkout/widgets/checkout_billing.dart';
// import '/theme3/views/checkout/widgets/checkout_shipping_view.dart';
// import '/theme3/views/shimmer/checkout_screen_shimmer_effect.dart';
// import '/theme3/views/widgets/common/custom_textfield.dart';
// import '/theme3/views/widgets/common/gap_widget.dart';
// import '/theme3/views/widgets/common/link_button.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../views/checkout/bloc/checkout_screen_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shopify_code/globels.dart' as globals;
// import 'package:flutter_svg/flutter_svg.dart';

// class CheckoutScreen extends StatefulWidget {
//   Cart cart;

//   CheckoutScreen(this.cart, {super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   TextEditingController offerCodeController = TextEditingController();
//   TextEditingController noteController = TextEditingController();

//   bool clear = false;
//   double sum = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CheckoutScreenBloc(widget.cart),
//       child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//                 icon: Container(
//                   width: 35, //MediaQuery.of(context).size.width * 0.09,
//                   height: 35, //MediaQuery.of(context).size.height * 0.09,
//                   padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
//                   child: SvgPicture.asset("assets/images/arrow-back.svg",
//                       colorFilter: ColorFilter.mode(
//                           AppTheme.appBarTextColor!, BlendMode.srcIn)),
//                 ),
//                 onPressed: () {
//                   context.pop();
//                 }),
//             title: Text(LanguageManager.translations()[
//                     'Checkout']! // AppLocalizations.of(context)!.checkout,
//                 ),
//           ),
//           bottomNavigationBar: Container(
//               decoration: BoxDecoration(
//                   color: AppTheme.primaryColor,
//                   border: Border.all(color: AppTheme.primaryColor!),
//                   borderRadius:  BorderRadius.only(
//                       topLeft: Radius.circular(ThemeSize.themeBorderRadius),
//                       topRight: Radius.circular(ThemeSize.themeBorderRadius))),
//               height: 80,
//               padding:
//                   EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//               child: BlocBuilder<CheckoutScreenBloc, CheckoutScreenState>(
//                 builder: (context, state) {
//                   return TextButton(
//                     onPressed: () async {
//                       try {
//                         if (context
//                                     .read<CheckoutScreenBloc>()
//                                     .shippingAddress ==
//                                 null ||
//                             context.read<CheckoutScreenBloc>().billingAddress ==
//                                 null) {
//                           Dialogs.ErrorAlertInOut(
//                               context: context,
//                               message: LanguageManager.translations()[
//                                   'pleaseenteryourbillingandshippingaddress']! //AppLocalizations.of(context)!.pleaseenteryourbillingandshippingaddress
//                               );
//                           return;
//                         }
//                         // final Uri url = Uri.parse(
//                         final String url = context
//                             .read<CheckoutScreenBloc>()
//                             .cart
//                             .checkoutUrl!;
//                         // .checkouts
//                         // .webUrl
//                         // .toString());

//                         // bool value = await Navigator.of(context).pushNamed(Routes.webCheckoutScreen, arguments: {url.toString()}) as bool;
//                         // Session().setCartId("");
//                         print("sdjfsdkfsd");
//                         context.pushReplacement("/${Routes.thanksScreen}",
//                             extra: ["order id here", "name here"]);
//                         // bool value = await (context.pushNamed(
//                         //     "${Routes.webCheckoutScreen}",
//                         //     pathParameters: {"url": url},
//                         //     extra: null)) as bool;

//                         if (true) {
//                           // Checkout ck = await ShopifyCheckout.instance.getCheckoutQuery(
//                           //     context
//                           //         .read<CheckoutScreenBloc>()
//                           //         .checkouts
//                           //         .id
//                           //         .toString());
//                           //
//                           // String t1 = ck.order!.name.toString();
//                           // String t2 = ck.shippingAddress!.firstName.toString() +
//                           //     ck.shippingAddress!.lastName.toString();
//                           //
//                           // // remove cart items from local database
//                           // await DataBaseUtil.deleteCartAll();

//                           // Session().setCartId("");
//                           // context.pushReplacement(
//                           //      Routes.thanksScreen,
//                           //     extra: [context
//                           //         .read<CheckoutScreenBloc>().cart.buyerIdentity!.deliveryAddressPreferences!.first.firstName, context
//                           //     .read<CheckoutScreenBloc>().cart.id]);
//                         } else {
//                           Dialogs.ErrorAlertInOut(
//                               context: context,
//                               message: LanguageManager.translations()[
//                                   'errorinplaceorderplaceordertryagain']!);
//                         }
//                       } catch (e) {
//                         print(e.toString());
//                       }
//                     },
//                     child: Text(LanguageManager.translations()['PlaceOrder']!,
//                         style: CustomTextTheme.getTextStyle(
//                             MyTextStyle.CheckoutScreenPlaceOrder, context)
//                         // AppLocalizations.of(context)!.placeOrder,
//                         // style: Theme.of(context)
//                         //     .textTheme
//                         //     .titleLarge!
//                         //     .copyWith(color: Colors.black,)
//                         ),
//                   );
//                 },
//               )),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             color: Theme.of(context).colorScheme.background,
//             child: SingleChildScrollView(
//               child: BlocListener<CheckoutScreenBloc, CheckoutScreenState>(
//                 listener: (context, state) {
//                   if (state is CheckoutError) {
//                     Dialogs.ErrorAlertInOut(
//                         context: context, message: state.message.toString());
//                     offerCodeController.text = "";
//                   }
//                   if (state is CheckoutScreenAddressFound) {
//                     // if (state.message != "") {
//                     //   if (state.isSuccess) {
//                     //     Dialogs.SuccessAlertInOut(
//                     //         context: context,
//                     //         message: state.message.toString());
//                     //   } else {
//                     //     Dialogs.ErrorAlertInOut(
//                     //         context: context,
//                     //         message: state.message.toString());
//                     //   }
//                     // }
//                     // noteController.text = "";
//                   }
//                 },
//                 child: BlocBuilder<CheckoutScreenBloc, CheckoutScreenState>(
//                   builder: (context, state) {
//                     if (state is CheckoutScreenAddressFound) {
//                       noteController.text = state.cart.note.toString();
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CheckoutShippingView().GetShippingView(),
//                           Divider(
//                             thickness: 1,
//                             color: AppTheme.borderColor,
//                           ),
//                           CheckoutBillingView(),
//                           Divider(thickness: 1, color: AppTheme.borderColor),
//                           // end of billing address
//                           ItemCountView()
//                               .getItemCountView(context, state.cart!),
//                           // end of Line items
//                           Divider(thickness: 1, color: AppTheme.borderColor),
//                           Container(
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                     LanguageManager.translations()[
//                                         'OfferCode']!,
//                                     // AppLocalizations.of(context)!.offercode,
//                                     style: CustomTextTheme.getTextStyle(
//                                         MyTextStyle.CheckoutScreenOfferCode,
//                                         context)
//                                     // style: Theme.of(context)
//                                     //     .textTheme
//                                     //     .bodyLarge!
//                                     //     .copyWith(color: Colors.black,),
//                                     ),
//                                 GapWidget(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Expanded(
//                                       flex: 4,
//                                       child: CustomTextFormField()
//                                           .SimpleTextFormField(
//                                               context: context,
//                                               hintText: LanguageManager
//                                                   .translations()['OfferCode']!,
//                                               controller: offerCodeController),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Expanded(
//                                       flex: 2,
//                                       child: LinkButton(
//                                         text: LanguageManager.translations()[
//                                             'Apply']!,
//                                         onPressed: () {
//                                           if (offerCodeController
//                                               .text.isNotEmpty) {
//                                             context
//                                                 .read<CheckoutScreenBloc>()
//                                                 .add(
//                                                     CheckoutScreenApplyOfferEvent(
//                                                         offerCodeController
//                                                             .text));
//                                           } else {
//                                             Dialogs.ErrorAlertInOut(
//                                                 context: context,
//                                                 message: LanguageManager
//                                                         .translations()[
//                                                     'Pleaseenteroffercode']! // AppLocalizations.of(context)!.pleaseenteroffercode
//                                                 );
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 offerCodeController.text.isNotEmpty
//                                     ? Container(
//                                         padding: EdgeInsets.only(left: 5),
//                                         width: 200,
//                                         margin: EdgeInsets.only(left: 10),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadiusDirectional.only(
//                                                     topEnd: Radius.elliptical(
//                                                         80, 35),
//                                                     bottomEnd:
//                                                         Radius.elliptical(
//                                                             80, 35)),
//                                             color: AppTheme.primaryColor!
//                                                 .withAlpha(
//                                                     100) // Colors.grey.shade300
//                                             ),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               child: Text(
//                                                   offerCodeController.text,
//                                                   maxLines: 2,
//                                                   style: CustomTextTheme
//                                                       .getTextStyle(
//                                                           MyTextStyle
//                                                               .CheckoutScreenDefault,
//                                                           context)
//                                                   // style: TextStyle(
//                                                   //     color: Colors.black,  ,),
//                                                   ),
//                                             ),
//                                             IconButton(
//                                                 onPressed: () {
//                                                   context
//                                                       .read<
//                                                           CheckoutScreenBloc>()
//                                                       .add(CheckoutScreenRemoveOfferEvent(
//                                                           offerCodeController
//                                                               .text));
//                                                   setState(() {
//                                                     offerCodeController.text =
//                                                         "";
//                                                   });
//                                                 },
//                                                 icon: Icon(
//                                                   Icons.cancel,
//                                                   // color: Colors.black
//                                                 ))
//                                           ],
//                                         ),
//                                       )
//                                     : SizedBox()
//                               ],
//                             ),
//                           ),
//                           //end of offer code
//                           Divider(thickness: 1, color: AppTheme.borderColor),
//                           globals.Settings.containsKey(
//                                   SettingsEnum.Order_Note.name)
//                               ? Container(
//                                   padding: EdgeInsets.all(15),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text("Add a Note",
//                                           // LanguageManager.translations()['addANote']!,
//                                           // AppLocalizations.of(context)!.offercode,
//                                           style: CustomTextTheme.getTextStyle(
//                                               MyTextStyle
//                                                   .CheckoutScreenOfferCode,
//                                               context)
//                                           // style: Theme.of(context)
//                                           //     .textTheme
//                                           //     .bodyLarge!
//                                           //     .copyWith(color: Colors.black,),
//                                           ),
//                                       GapWidget(),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Expanded(
//                                             flex: 4,
//                                             child: CustomTextFormField()
//                                                 .SimpleTextFormFieldWithPrefixIcon(
//                                               controller: noteController,
//                                               hintText: "Add a Note",
//                                               // LanguageManager.translations()['addANote']!,
//                                               prefixIcon:
//                                                   "assets/images/addNote.svg",
//                                               //Icons.note_add,
//                                               context: context,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Expanded(
//                                             flex: 2,
//                                             child: LinkButton(
//                                               text: LanguageManager
//                                                   .translations()['Apply']!,
//                                               onPressed: () {
//                                                 if (noteController
//                                                     .text.isNotEmpty) {
//                                                   context
//                                                       .read<
//                                                           CheckoutScreenBloc>()
//                                                       .add(
//                                                           CheckoutScreenAddNoteEvent(
//                                                               noteController
//                                                                   .text));
//                                                 } else {
//                                                   Dialogs.ErrorAlertInOut(
//                                                       context: context,
//                                                       message:
//                                                           "Please Enter a Note"
//                                                       //  LanguageManager.translations()['pleaseEnterANote']!
//                                                       );
//                                                 }
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : Container(),
//                           //end of add note
//                           Divider(thickness: 1, color: AppTheme.borderColor),
//                           Container(
//                               margin: EdgeInsets.all(10),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                             child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                               child: Text("Sub Total",
//                                                   // LanguageManager.translations()[
//                                                   //     'subTotal']!,
//                                                   // AppLocalizations.of(context)!.subTotal,
//                                                   style: CustomTextTheme
//                                                       .getTextStyle(
//                                                           MyTextStyle
//                                                               .CheckoutScreenTotal,
//                                                           context)
//                                                   // style: Theme.of(context)
//                                                   //     .textTheme
//                                                   //     .bodyMedium!
//                                                   //     .copyWith(
//                                                   //         color: Colors.black,),
//                                                   ),
//                                             ),
//                                             Container(
//                                               child: Text(
//                                                   context
//                                                       .read<
//                                                           CheckoutScreenBloc>()
//                                                       .cart
//                                                       .cost!
//                                                       .subtotalAmount!
//                                                       .formattedPrice
//                                                       .toString(),
//                                                   style: CustomTextTheme
//                                                       .getTextStyle(
//                                                           MyTextStyle
//                                                               .CheckoutScreenPrice,
//                                                           context)
//                                                   // style: Theme.of(context)
//                                                   //     .textTheme
//                                                   //     .bodyMedium!
//                                                   //     .copyWith(
//                                                   //         color: Colors.black,),
//                                                   ),
//                                             ),
//                                           ],
//                                         )),
//                                         Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 child: Text(
//                                                     LanguageManager
//                                                         .translations()['Tax']!,
//                                                     // AppLocalizations.of(context)!.tax,
//                                                     style: CustomTextTheme
//                                                         .getTextStyle(
//                                                             MyTextStyle
//                                                                 .CheckoutScreenPrice,
//                                                             context)
//                                                     // style: Theme.of(context)
//                                                     //     .textTheme
//                                                     //     .bodyMedium!
//                                                     //     .copyWith(
//                                                     //         color:
//                                                     //             Colors.black,),
//                                                     ),
//                                               ),
//                                               Container(
//                                                 child: Text(
//                                                     context
//                                                                 .read<
//                                                                     CheckoutScreenBloc>()
//                                                                 .cart
//                                                                 .cost!
//                                                                 .totalTaxAmount ==
//                                                             null
//                                                         ? "0.00"
//                                                         : context
//                                                             .read<
//                                                                 CheckoutScreenBloc>()
//                                                             .cart
//                                                             .cost!
//                                                             .totalTaxAmount!
//                                                             .formattedPrice
//                                                             .toString(),
//                                                     // context
//                                                     //     .read<
//                                                     //         CheckoutScreenBloc>()
//                                                     //     .checkouts
//                                                     //     .totalTaxV2!
//                                                     //     .formattedPrice
//                                                     //     .toString(),
//                                                     style: CustomTextTheme
//                                                         .getTextStyle(
//                                                             MyTextStyle
//                                                                 .CheckoutScreenPrice,
//                                                             context)
//                                                     // style: Theme.of(context)
//                                                     //     .textTheme
//                                                     //     .bodyMedium!
//                                                     //     .copyWith(
//                                                     //         color:
//                                                     //             Colors.black,),
//                                                     ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         /*    context
//                                                     .read<CheckoutScreenBloc>()
//                                                     .checkouts
//                                                     .availableShippingRates !=
//                                                 null
//                                             ? Container(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Container(
//                                                       child: Text(
//                                                           LanguageManager
//                                                                   .translations()[
//                                                               'Shipping']!,
//                                                           // AppLocalizations.of(context)!.shipping,
//                                                           style: CustomTextTheme
//                                                               .getTextStyle(
//                                                                   MyTextStyle
//                                                                       .CheckoutScreenPrice,
//                                                                   context)
//                                                           // style: Theme.of(context)
//                                                           //     .textTheme
//                                                           //     .bodyMedium!
//                                                           //     .copyWith(
//                                                           //         color: Colors
//                                                           //             .black,),
//                                                           ),
//                                                     ),
//                                                     Container(
//                                                       child: Text(
//                                                           context
//                                                               .read<
//                                                                   CheckoutScreenBloc>()
//                                                               .checkouts
//                                                               .availableShippingRates!
//                                                               .shippingRates![0]
//                                                               .priceV2!
//                                                               .formattedPrice
//                                                               .toString(),
//                                                           style: CustomTextTheme
//                                                               .getTextStyle(
//                                                                   MyTextStyle
//                                                                       .CheckoutScreenPrice,
//                                                                   context)
//                                                           // style: Theme.of(context)
//                                                           //     .textTheme
//                                                           //     .bodyMedium!
//                                                           //     .copyWith(
//                                                           //         color: Colors
//                                                           //             .black,),
//                                                           ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             : SizedBox(),
//                                     */
//                                         Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   children: [
//                                                     Text(
//                                                         LanguageManager
//                                                                 .translations()[
//                                                             'Discount']!,
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .bodyMedium!
//                                                         // .copyWith(color:Colors.blackLight),
//                                                         ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Container(
//                                                 child: Text(
//                                                     //"25",
//                                                     context
//                                                         .read<
//                                                             CheckoutScreenBloc>()
//                                                         .getDiscountAmount()
//                                                         .toString(),
//                                                     style: CustomTextTheme
//                                                         .getTextStyle(
//                                                             MyTextStyle
//                                                                 .CheckoutScreenPrice,
//                                                             context)
//                                                     // style: Theme.of(context)
//                                                     //     .textTheme
//                                                     //     .bodyMedium!
//                                                     //     .copyWith(
//                                                     //         color:
//                                                     //             Colors.black,),
//                                                     ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Divider(
//                                             thickness: 1,
//                                             color: AppTheme.borderColor),
//                                         Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 child: Text(
//                                                     LanguageManager
//                                                             .translations()[
//                                                         'Total']!,
//                                                     // AppLocalizations.of(context)!.total,
//                                                     style: CustomTextTheme
//                                                         .getTextStyle(
//                                                             MyTextStyle
//                                                                 .CheckoutScreenTotal,
//                                                             context)
//                                                     // style: Theme.of(context)
//                                                     //     .textTheme
//                                                     //     .bodyMedium!
//                                                     //     .copyWith(
//                                                     //         color: Colors.black,),
//                                                     ),
//                                               ),
//                                               Container(
//                                                 child: Text(
//                                                     context
//                                                         .read<
//                                                             CheckoutScreenBloc>()
//                                                         .cart
//                                                         .cost!
//                                                         .totalAmount!
//                                                         .formattedPrice
//                                                         .toString(),
//                                                     style: CustomTextTheme
//                                                         .getTextStyle(
//                                                             MyTextStyle
//                                                                 .CheckoutScreenPrice,
//                                                             context)
//                                                     // style: Theme.of(context)
//                                                     //     .textTheme
//                                                     //     .bodyMedium!
//                                                     //     .copyWith(
//                                                     //         color: Colors.black,),
//                                                     ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         // end of paid
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )),
//                           // end of paid view
//                         ],
//                       );
//                     } else {
//                       return CheckoutShimmerEffect()
//                           .checkoutshimmereffect(context);
//                     }
//                   },
//                 ),
//               ),
//             ),
//             // ),
//           )),
//     );
//   }
// }
