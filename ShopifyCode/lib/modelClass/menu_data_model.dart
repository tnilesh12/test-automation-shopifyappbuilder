import 'package:shopify_code/util/routes.dart';

class MenuDataModel {
  List<MenuItems>? menuItems;

  MenuDataModel({this.menuItems});

  MenuDataModel.fromJson(Map<String, dynamic> json) {
    if (json['page_json'] != null) {
      menuItems = <MenuItems>[];
      json['page_json'].forEach((v) {
        menuItems!.add(new MenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menuItems != null) {
      data['page_json'] = this.menuItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuItems {
  String? id;
  String? title;
  String? resourceId;
  String? url;
  String? type;
  Map<String, dynamic>? resource;
  List<MenuItems>? items;
  List<String>? tags;
  String? icon;

  MenuItems(
      {this.id,
      this.title,
      this.resourceId,
      this.url,
      this.type,
      this.resource,
      this.items,
      this.tags,
      this.icon});

  MenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    resourceId = json['resourceId'] != null ? json['resourceId'] : json['id'] != null ? json['id'] : "";
    url = json['url'];
    type = json['type'] ?? Routes.categoryScreen;
    resource = json['resource'];
    if (json['items'] != null) {
      items = <MenuItems>[];
      json['items'].forEach((v) {
        items!.add(new MenuItems.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add((v));
      });
    }
    icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['resourceId'] = this.resourceId;
    data['url'] = this.url;
    data['type'] = this.type;
    data['resource'] = this.resource;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v).toList();
    }
    data['Icon'] = this.icon;
    return data;
  }
}
