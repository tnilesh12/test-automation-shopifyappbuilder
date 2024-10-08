class FilterProduct {
  CollectionFl? collection;

  FilterProduct({this.collection});

  FilterProduct.fromJson(Map<String, dynamic> json) {
    collection = json['collection'] != null
        ? new CollectionFl.fromJson(json['collection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.toJson();
    }
    return data;
  }
}



class CollectionFl {
  ProductsFl? products;

  CollectionFl({this.products});

  CollectionFl.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new ProductsFl.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class ProductsFl {
  List<Filters>? filters;
  PageInfo? pageInfo;

  ProductsFl({this.filters, this.pageInfo});

  ProductsFl.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(new Filters.fromJson(v));
      });
    }
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    }
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo!.toJson();
    }
    return data;
  }
}

class Filters {
  String? id;
  String? label;
  String? type;
  List<Values>? values;

  Filters({this.id, this.label, this.type, this.values});

  Filters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    type = json['type'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['type'] = this.type;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? id;
  String? label;
  int? count;
  String? input;

  Values({this.id, this.label, this.count, this.input});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    count = json['count'];
    input = json['input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['count'] = this.count;
    data['input'] = this.input;
    return data;
  }
}

class PageInfo {
  String? endCursor;
  bool? hasNextPage;

  PageInfo({this.endCursor, this.hasNextPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    endCursor = json['endCursor'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endCursor'] = this.endCursor;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}
