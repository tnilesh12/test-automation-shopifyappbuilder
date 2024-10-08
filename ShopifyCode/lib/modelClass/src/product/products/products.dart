import '../product.dart';

class Products {
  List<Product>? productList;
  bool? hasNextPage;
  Products({this.productList, this.hasNextPage});

  get copyWith => null;

  static Products fromGraphJson(Map<String, dynamic> json) {
    return Products(
        productList: _getProductList(json),
        hasNextPage: (json['pageInfo'] ?? const {})['hasNextPage'] ?? false);
  }

  static List<Product> _getProductList(Map<String, dynamic> json) {
    return (json['edges'] as List?)
            ?.map((e) => Product.fromGraphJson(e ?? const {}))
            .toList() ??
        const <Product>[];
  }

  Products.fromJson(Map<String, dynamic> json) {
    productList = _getProductList(json);
    hasNextPage = json['hasNextPage'];
  }
  Map<String, dynamic> toJson() =>
      {'productList': '$_getProductList', 'hasNextPage': '$hasNextPage'};
}
