import 'package:shopify_code/modelClass/src/article/article.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import '../page/page.dart';

// class Search {
//   Data? data;
//   // List<Errors>? errors;

//   Search({this.data});

//   Search.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//     // if (json['errors'] != null) {
//     //   errors = <Errors>[];
//     //   json['errors'].forEach((v) {
//     //     errors!.add( Errors.fromJson(v));
//     //   });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     // if (this.errors != null) {
//     //   data['errors'] = this.errors!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

class Data {
  PredictiveSearchModel? predictiveSearch;

  Data({this.predictiveSearch});

  Data.fromJson(Map<String, dynamic> json) {
    predictiveSearch = json['predictiveSearch'] != null
        ? new PredictiveSearchModel.fromJson(json['predictiveSearch'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.predictiveSearch != null) {
      data['predictiveSearch'] = this.predictiveSearch!.toJson();
    }
    return data;
  }
}

class PredictiveSearchModel {
  List<Article>? articles;
  List<Pagess>? pages;
  List<Collection>? collections;
  List<Product>? products;

  PredictiveSearchModel(
      {this.articles, this.pages, this.collections, this.products});

  PredictiveSearchModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pagess>[];
      json['pages'].forEach((v) {
        pages!.add( Pagess.fromJson(v));
      });
    }
    if (json['collections'] != null) {
      collections = <Collection>[];
      json['collections'].forEach((v) {
        collections!.add( Collection.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add( Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
