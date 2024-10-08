import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';

class CustomTextTheme {
  static TextStyle getTextStyle(MyTextStyle style, BuildContext context) {
    switch (style) {
      case MyTextStyle.SimpleText:
        return Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 12, fontStyle: FontStyle.normal);
      case MyTextStyle.TextFormFieldInput:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 13, color: AppTheme.editTextControllerTextColor);
      case MyTextStyle.TextFormFieldHint:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 13,
            color: AppTheme.editTextControllerTextColor!.withAlpha(150));
      case MyTextStyle.LinkTextButton:
        return Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 12, fontWeight: FontWeight.bold);
      case MyTextStyle.ProductGridViewCardTitle:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.ProductGridViewCardFrom:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
            );
      case MyTextStyle.ProductGridViewCardPrice:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppTheme.priceTagColor);
      case MyTextStyle.ProductGridViewCardCart:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.ProductListViewCardTitle:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.ProductListViewCardPrice:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.AddressListCardTitle:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 20,
            );
      case MyTextStyle.AddressListCardSubTitle:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CommonThemeTitle:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.CommonThemeSubTitle:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 15,
            );
      case MyTextStyle.MultiStoreListCardTitle:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.MenuItemListTitle:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.OrderListCardOrderNumber:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.OrderListCardDate:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.OrderListCardStatus:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.OrderListCardTotalAmount:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.Heading:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 24,
            );
      case MyTextStyle.SettingDefault:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CartRowTitle:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CartRowVariant:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 10,
            );
      case MyTextStyle.CartRowPrice:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.priceTagColor,
            );
      case MyTextStyle.CartScreenNumberOfItems:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppTheme.appBarTextColor,
              fontSize: 16,
            );
      case MyTextStyle.CartScreenTotal:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppTheme.appBarTextColor,
              fontSize: 18,
            );
      case MyTextStyle.CartScreenCheckout:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppTheme.appBarTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.ThanksScreenOrderId:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
            );
      case MyTextStyle.ThanksScreenUserName:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
            );
      case MyTextStyle.ThanksScreenDescription:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
            );
      case MyTextStyle.CheckoutAddress:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutDefault:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutUserName:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutScreenTotal:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutScreenPlaceOrder:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutScreenOfferCode:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutScreenDefault:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutScreenPrice:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutLineItems:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.CheckoutLineItemsDefault:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.ProductDetailAddToCart:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppTheme.appBarTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.ProductDetailTitle:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.ProductDetailVendor:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            );
      case MyTextStyle.ProductDetailPrice:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppTheme.priceTagColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.ProductDetailDefault:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
            );
      case MyTextStyle.ProductDetailDescription:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            );
      case MyTextStyle.NotificationCardTitle:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            );
      case MyTextStyle.NotificationCardMessage:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            );
      case MyTextStyle.ListTileTitle:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            );
      default:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
            ); // Default style\\
    }
  }
}
