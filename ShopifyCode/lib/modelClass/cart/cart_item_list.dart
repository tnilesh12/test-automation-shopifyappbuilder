import 'package:shopify_code/modelClass/cart/cart_item.dart';

class CartItems {
  List<CartItem>? cartItemList;
  
  CartItems({this.cartItemList});

  static CartItems fromGraphJson(Map<String, dynamic> json) {
    return CartItems(cartItemList: _getCartItemList(json));
  }

  CartItems.fromJson(Map<String, dynamic> json) {
    cartItemList = _getCartItemList(json);
  }

  Map<String, dynamic> toJson() => {
        'cartItemList': cartItemList,
      };

  static _getCartItemList(Map<String, dynamic> json) {
    List<CartItem> cartItemList = [];
    json['edges']?.forEach((cartItem) =>
        cartItemList.add(CartItem.fromJson(cartItem ?? const [])));
    return cartItemList;
  }
}




