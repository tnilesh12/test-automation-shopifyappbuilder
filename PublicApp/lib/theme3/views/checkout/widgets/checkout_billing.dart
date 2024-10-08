import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/routes.dart';
import '../../../utils/theme_size.dart';
import '../bloc/checkout_screen_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutBillingView extends StatefulWidget {
  const CheckoutBillingView({super.key});

  @override
  State<CheckoutBillingView> createState() => _CheckoutBillingViewState();
}

class _CheckoutBillingViewState extends State<CheckoutBillingView> {
  bool valueFirst = true;

  Widget GetBillingView() {
    return Container(child:
        BlocBuilder<CheckoutScreenBloc, CheckoutScreenState>(
            builder: (context, state) {
      if (state is CheckoutScreenAddressFound) {
        if (state.addressBilling != null) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                            LanguageManager.translations()['BillingAddress']!,
                            // AppLocalizations.of(context)!.billingaddress,
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.CheckoutAddress, context)
                            // style: Theme
                            //     .of(context)
                            //     .textTheme
                            //     .bodyLarge!
                            //     .copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                            ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                            color: AppTheme.primaryButtonBackground),
                        margin: EdgeInsets.only(bottom: 5, right: 0, top: 5),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextButton(
                          child: Text(LanguageManager.translations()['Change']!,
                              style: CustomTextTheme.getTextStyle(
                                  MyTextStyle.CheckoutDefault, context)
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .bodySmall!
                              //     .copyWith(color: AppTheme.white,fontFamily: 'Cinzel'),
                              ),
                          onPressed: () async {
                            Address? address = await context.push(
                                "/${Routes.addressListscreen}",
                                extra: true);
                            if (address != null) {
                              context.read<CheckoutScreenBloc>().add(
                                  CheckoutScreenAddressChangeBillingEvent(
                                      address!));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                          activeColor: AppTheme.primaryButtonBackground,
                          // fillColor: MaterialStatePropertyAll(Colors.red),
                          checkColor: AppTheme.primaryButtonText,
                          fillColor: MaterialStatePropertyAll(
                              AppTheme.primaryButtonBackground!.withAlpha(100)),
                          side: MaterialStateBorderSide.resolveWith((value) =>
                              BorderSide(width: 1.0, color: AppTheme.black!)),
                          value: valueFirst,
                          onChanged: (value) {
                            setState(() {
                              valueFirst = value!;
                            });
                            if (value == true) {
                              context
                                  .read<CheckoutScreenBloc>()
                                  .add(CheckoutScreenSameAddressEvent());
                            }
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        LanguageManager.translations()[
                            'SameasShippingAddress']!,
                        // AppLocalizations.of(context)!.sameasshippingaddress,
                        style: CustomTextTheme.getTextStyle(
                            MyTextStyle.CheckoutDefault, context)
                        // style: Theme
                        //     .of(context)
                        //     .textTheme
                        //     .bodySmall!
                        //     .copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                        )
                  ],
                ),
                valueFirst
                    ? Text("")
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                                "${state.addressBilling!.firstName} ${state.addressBilling!.lastName}",
                                style: CustomTextTheme.getTextStyle(
                                    MyTextStyle.CheckoutUserName, context)
                                // style: Theme
                                //     .of(context)
                                //     .textTheme
                                //     .bodyMedium!
                                //     .copyWith(color: AppTheme.black!.withAlpha(120),fontFamily: 'Cinzel')
                                ),
                          ),
                          Container(
                            child: Text(
                                "${state.addressBilling!.GetFormattedAddress()}",
                                style: CustomTextTheme.getTextStyle(
                                    MyTextStyle.CheckoutAddress, context)
                                // style: Theme
                                //     .of(context)
                                //     .textTheme
                                //     .bodyMedium!
                                //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                                ),
                          ),
                          Container(
                            child: Text(state.addressBilling!.phone.toString(),
                                style: CustomTextTheme.getTextStyle(
                                    MyTextStyle.CheckoutDefault, context)
                                // style: Theme
                                //     .of(context)
                                //     .textTheme
                                //     .bodySmall!
                                //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                                ),
                          ),
                        ],
                      ),
              ],
            ),
          );
        } else {
          return GetDefaultView(context);
        }
      } else {
        return GetDefaultView(context);
      }
    }));
  }

  Widget GetDefaultView(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(LanguageManager.translations()['BillingAddress']!,
                      // AppLocalizations.of(context)!.billingaddress,
                      style: CustomTextTheme.getTextStyle(
                          MyTextStyle.CheckoutAddress, context)
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .bodyLarge!
                      //     .copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                      ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                      color: AppTheme.primaryButtonBackground),
                  margin: EdgeInsets.only(bottom: 5, right: 0, top: 5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextButton(
                    child: Text(LanguageManager.translations()['Add']!,
                        // AppLocalizations.of(context)!.add,
                        style: CustomTextTheme.getTextStyle(
                            MyTextStyle.CheckoutDefault, context)
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .bodySmall!
                        //     .copyWith(color: AppTheme.white,fontFamily: 'Cinzel'),
                        ),
                    onPressed: () async {
                      Address? address = await context
                          .push("/${Routes.addressListscreen}", extra: true);
                      if (address != null) {
                        context.read<CheckoutScreenBloc>().add(
                            CheckoutScreenAddressChangeBillingEvent(address!));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: Text(
                LanguageManager.translations()[
                    'NOAddressAssociatedwithyouraccount']!,
                // AppLocalizations.of(context)!.noddressassociatedwithyouraccount,
                style: CustomTextTheme.getTextStyle(
                    MyTextStyle.CheckoutDefault, context)
                // style: Theme.of(context)
                //     .textTheme
                //     .bodySmall!
                //     .copyWith(color: AppTheme.black.withAlpha(120),fontFamily: 'Cinzel'),
                ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBillingView();
  }
}
