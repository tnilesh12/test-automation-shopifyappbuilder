import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/modelClass/cart/cart.dart';
import 'package:shopify_code/modelClass/cart/cart_item.dart';
import 'package:shopify_code/modelClass/src/order/order.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';

part 'checkout_screen_event.dart';

part 'checkout_screen_state.dart';

// checkouts replace by cart

class CheckoutScreenBloc
    extends Bloc<CheckoutScreenEvent, CheckoutScreenState> {
  CheckoutScreenBloc(this.cart) : super(CheckoutScreenInitial()) {
    on<CheckoutScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CheckoutScreenAddressChangeEvent>((event, emit) async {
      shippingAddress = event.address;
      ChangeAddressShipping();
    });

    on<CheckoutScreenAddressChangeBillingEvent>((event, emit) {
      billingAddress = event.address;
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "", true));
    });

    on<CheckoutScreenSameAddressEvent>((event, emit) {
      billingAddress = shippingAddress;
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "", true));
    });

    on<CheckoutScreenApplyOfferEvent>((event, emit) {
      ApplyOfferCode(event.code);
    });
    on<CheckoutScreenRemoveOfferEvent>((event, emit) {
      RemoveOfferCode();
    });

    on<CheckoutScreenAddNoteEvent>((event, emit) {
      updateCartCustomerNote(event.note);
    });

    LoadData();
  }

/*
  CreateCheckout2(bool withaddress) async {
    // List<CartItem> cartItemList = [];
    // List<Cart> list = await DataBaseUtil.getCartList();

    if (cartItemList.isNotEmpty) {
      List<LineItem>? lineItems = [];
      for (CartItem c in cartItemList) {
        Merchandise pv = c.merchandise!;
        ProductVariantCheckout vv = ProductVariantCheckout();
        vv.title = pv.title;
        vv.priceV2 = pv.priceV2;
        vv.image = pv.image;
        vv.sku = pv.sku;
        vv.weight = pv.weight;
        // vv.weightUnit = pv.weightUnit;
        vv.id = pv.id;
        vv.compareAtPrice = pv.compareAtPrice;
        vv.quantityAvailable = pv.quantityAvailable;
        vv.availableForSale = pv.availableForSale;
        vv.requiresShipping = pv.requiresShipping;

        LineItem va = LineItem(
            title: c.merchandise!.title,
            id: c.merchandise!.product!.id.toString(),
            variantId: c.merchandise!.id,
            quantity: c.quantity,
            variant: vv);

        lineItems.add(va);
      }

      var formData = {
        'input': {
          'allowPartialAddresses': true,
          if (lineItems != null)
            'lineItems': [
              for (var lineItem in lineItems)
                {
                  'variantId': lineItem.variantId,
                  'quantity': lineItem.quantity,
                  'customAttributes': lineItem.customAttributes
                      ?.map((e) => {
                            'key': e.key,
                            'value': e.value,
                          })
                      .toList(),
                }
            ],
          if (user!.email != null) 'email': user!.email,
          if (shippingAddress != null)
            'shippingAddress': {
              'address1': shippingAddress!.address1,
              'address2': shippingAddress!.address2,
              'city': shippingAddress!.city,
              'company': shippingAddress!.company,
              'country': shippingAddress!.country,
              'firstName': shippingAddress!.firstName,
              'lastName': shippingAddress!.lastName,
              'phone': shippingAddress!.phone,
              'province': shippingAddress!.province,
              'zip': shippingAddress!.zip
            }
        }
      };

      debugPrint("--------------formData--------------$formData");
      // print("------------------CreateCheckout  CheckoutScreenAddressFound() emitted    |  ${shippingAddress!.address1}  |  cart ${cart.id} |");

      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart));

      if (false) {
        ApiResponse apiResponse = await ApiRepository.postAPI(
            ApiConst.createCheckout, formData); // cart.id.toString(),);
        if (apiResponse.status) {}

        // cart = await ShopifyCheckout.instance.createCheckout(
        //     lineItems: item,
        //     shippingAddress: shippingAddress,
        //     email: user!.email);
        // }
        // else {
        //   cart = await ShopifyCheckout.instance
        //       .checkoutCreateWithoutShippingAddress(
        //       lineItems: item, email: user!.email);
        // }

        print(cart.id);
        print(
            "------------------CreateCheckout  CheckoutScreenAddressFound() emitted    |  ${shippingAddress!.address1}  |  cart $cart |");
        emit(CheckoutScreenAddressFound(
            shippingAddress, billingAddress, cart));
      }
    }
  }
*/
  // List<CartItem> cartItemList = [];
  Address? shippingAddress;
  Address? billingAddress;

  // late ShopifyUser? user;
  // late Checkout cart = Checkout();
  late Cart cart = Cart();
  bool data = false;
  ShopifyUser? user;

  Future<void> getShopifyUser() async {
    String accessToken = await Session().getAccessToken();

    debugPrint(
        "----------------------------------getShopifyUser accessToken $accessToken ---------");
    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.getShopifyUser.replaceAll("{accessToken}", accessToken));
    if (apiResponse.status) {
      debugPrint(
          "-------------response${apiResponse.data["result"]["body"]["data"]["customer"]}");
      user = ShopifyUser.fromGraphJson(
          apiResponse.data["result"]["body"]["data"]["customer"]);
      debugPrint(
          "----------------------------------getShopifyUser bloc success ---------");
    } else {
      debugPrint(
          "--------------------getShopifyUser--------------api failure bloc ");
    }
  }

  LoadData() async {
    await getShopifyUser();

    //print("----------LoadData ${user!.toJson()}------");

    if (user!.address!.addressList!.length == 0) {
      // emit(CheckoutScreenShippinAddressNotFound());
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "", true));
      // CreateCheckout(false);
    } else {
      print(
          "----------LoadData user defaultAddress ${user!.defaultAddress!.toJson()}------");

      shippingAddress = user!.address!.addressList!.first;
      billingAddress = user!.address!.addressList!.first;
     // await ChangeAddressShipping();
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "", true));

      // CreateCheckout(true);
    }
  }

  updateCartCustomerNote(String notes) async {
    String? cartId = await Session().getCartId();
    debugPrint(
        "--------------updateCartCustomerNote------------cartId$cartId ");
    var formData = {"notes": notes};
    ApiResponse apiResponse = await ApiRepository.putAPI(
        ApiConst.updateCartCustomerNote.replaceAll("{cart_id}", cartId!),
        formData);
    if (apiResponse.status) {
      debugPrint(" -------------response${apiResponse.data["result"]}");
      debugPrint(
          "----------------------------------updateCartCustomerNote bloc success ");
      cart.note = apiResponse.data["result"]["body"]["data"]["cartNoteUpdate"]
          ["cart"]["note"];
      emit(CheckoutScreenAddressFound(shippingAddress, billingAddress, cart,
          "Note Added Successfully", true));
    } else {
      debugPrint(
          "--------------------updateCartCustomerNote--------------api failure bloc -------${apiResponse.message} ");
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "Error Adding Note!", true));
    }
  }

  ChangeAddressShipping() async {
    String? cartId = await Session().getCartId();
    String accessToken = await Session().getAccessToken();
    debugPrint(
        "--------------ChangeAddressShipping------------cartId$cartId  accessToken  $accessToken");

// "customerAddressId": "gid://shopify/MailingAddress/8513843888320?model_name=CustomerAddress&customer_access_token=tPsraytVy68au0QQ5hLmHuXBCkxYkOxMOesJR0VHufQIjJWqj90N5RpkJV2Y1uKEc46mi1wQTyekfn4KwAEUl_yEkKyQARyenebxsb-Dso6tMZNO1DJizQEgq_fyeAoiQUfmpAGKF2jMP54oYuLjPBXsi75VizJWhdFqPb-MiBsy2PDUkNFJzlJ9VKbyRTM8Yqud3IpWD49lNrNdntH6qdK8cFLnHQ3iLWGI24xixLJK_uKRGxp_4l1kVQS3HchM",
    String input = shippingAddress!.id.toString();

    int index = input.indexOf("CustomerAddress");

    String result =
    input.substring(0, index + "CustomerAddress".length);
    print("result of checkout bloc address is ${result}");
    var formData = {
      "cartId": cartId,
      "buyerIdentityInput": {
        // "email": user!.email,
        // "phone": user!.phone,
        // "countryCode": shippingAddress!.countryCode,
       "customerAccessToken": accessToken.toString(),
        // "customer":{
        //   "email": user!.email,
        //   "id":user!.id
        // },
        "deliveryAddressPreferences": [
          {
              "customerAddressId": result,
            // "deliveryAddress": {
            //   "address1": shippingAddress!.address1,
            //   "address2": shippingAddress!.address2,
            //   "city": shippingAddress!.city,
            //   "company": shippingAddress!.company,
            //   "country": shippingAddress!.country,
            //   "firstName": shippingAddress!.firstName,
            //   "lastName": shippingAddress!.lastName,
            //   "phone": shippingAddress!.phone,
            //   "province": shippingAddress!.province,
            //   "zip": shippingAddress!.zip
            // }
          }
        ]
      }
    };

    ApiResponse apiResponse =
        await ApiRepository.putAPI(ApiConst.updateShippingAddress, formData);
    if (apiResponse.status) {
      // debugPrint(
      //     " -------------response${apiResponse.data["result"]["body"]["data"]["cartBuyerIdentityUpdate"]["cart"]["buyerIdentity"]}");
      debugPrint(
          "----------------------------------ChangeAddressShipping bloc success ");
      // cart.buyerIdentity = BuyerIdentity.fromJson(apiResponse.data["result"]
      //     ["body"]["data"]["cartBuyerIdentityUpdate"]["cart"]["buyerIdentity"]);
      debugPrint("-----------------Checkout url---------${cart.checkoutUrl}");
      emit(CheckoutScreenAddressFound(
          shippingAddress, billingAddress, cart, "", true));
    } else {
      debugPrint(
          "--------------------ChangeAddressShipping--------------api failure bloc -------${apiResponse.message} ");
    }
  }

  ApplyOfferCode(String code) async {
    String? cartId = await Session().getCartId();
    try {
      emit(CheckoutScreenLoadingDialog());
      var formData = {
        "discountCodes": [code]
      };

      ApiResponse apiResponse = await ApiRepository.putAPI(
          ApiConst.checkoutDiscountCodeApply.replaceAll("{cart_id}", cartId!),
          formData);
      if (apiResponse.status) {
        print("here2222");

        var discountAllocations = <DiscountAllocations>[];
        apiResponse.data["result"]["body"]["data"]["cartDiscountCodesUpdate"]
                ["cart"]["discountAllocations"]
            .forEach((v) {
          discountAllocations!.add(new DiscountAllocations.fromJson(v));
        });

        cart.discountAllocations = discountAllocations;
        var discountCodes = <DiscountCodes>[];
        apiResponse.data["result"]["body"]["data"]["cartDiscountCodesUpdate"]
                ["cart"]['discountCodes']
            .forEach((v) {
          discountCodes!.add(new DiscountCodes.fromJson(v));
        });

        cart.discountCodes = discountCodes;
        cart.cost = Cost.fromJson(apiResponse.data["result"]["body"]["data"]
            ["cartDiscountCodesUpdate"]["cart"]['cost']);
        print("here222233333");
      }
      // cart = await ShopifyCheckout.instance
      //     .checkoutDiscountCodeApply(cart.id.toString(), code);
    } catch (e) {
      print(e.toString());
      emit(CheckoutError("Offer Code invalid"));
    }
    emit(CheckoutScreenAddressFound(
        shippingAddress, billingAddress, cart, "", true));
  }

  RemoveOfferCode() async {
    String? cartId = await Session().getCartId();
    try {
      emit(CheckoutScreenLoadingDialog());
      var formData = {"discountCodes": []};
      ApiResponse apiResponse = await ApiRepository.putAPI(
          ApiConst.checkoutDiscountCodeApply.replaceAll("{cart_id}", cartId!),
          formData);
      if (apiResponse.status) {
        var discountAllocations = <DiscountAllocations>[];
        apiResponse.data["result"]["body"]["data"]["cartDiscountCodesUpdate"]
                ["cart"]["discountAllocations"]
            .forEach((v) {
          discountAllocations!.add(new DiscountAllocations.fromJson(v));
        });

        cart.discountAllocations = discountAllocations;
        var discountCodes = <DiscountCodes>[];
        apiResponse.data["result"]["body"]["data"]["cartDiscountCodesUpdate"]
                ["cart"]['discountCodes']
            .forEach((v) {
          discountCodes!.add(new DiscountCodes.fromJson(v));
        });

        cart.discountCodes = discountCodes;

        cart.cost = Cost.fromJson(apiResponse.data["result"]["body"]["data"]
            ["cartDiscountCodesUpdate"]["cart"]['cost']);
      }
      // cart = await ShopifyCheckout.instance
      //     .getCheckoutQuery(cart.id.toString());
    } catch (e) {
      print(e.toString());
    }
    emit(CheckoutScreenAddressFound(
        shippingAddress, billingAddress, cart, "", true));
  }

  getDiscountAmount() {
    double amount = 0.0;
    // if (cart.lineItems != null) {
    //   var x = cart.lineItems!.forEach((element) {
    //     element.discountAllocations!.forEach((e) {
    //       amount = amount + e.allocatedAmount!.amount!.toDouble();
    //     });
    //   });
    // }
    if (cart.discountAllocations != null) {
      var x = cart.discountAllocations!.forEach((element) {
        amount =
            amount + double.parse(element.discountedAmount!.amount!.toString());
      });
    }

    // if (amount == 0) {
    //   return globels.shop.moneyFormat!.replaceAll("{{amount}}", "0.0");
    // }

    return amount;
    // return globels.shop.moneyFormat!.replaceAll(
    //     "{{amount}}", "-" + amount.toString());
  }
}
