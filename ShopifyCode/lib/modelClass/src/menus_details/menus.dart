import 'items.dart';

class Menus {
  String? id;
  String? title;
  int? itemsCount;
  String? handle;
  List<String>? tags;
  String? resourceId;
  // Resource? resource;
  dynamic resource;
  List<Items>? items;

  Menus(
      {this.id,
      this.title,
      this.itemsCount,
      this.handle,
      this.tags,
      this.resourceId,
      this.resource,
      this.items});

  Menus.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    title = json['title'];
    resourceId = json['resourceId'];
    tags = _getTagList(json);
    resource = json['resource'];
    //  != null
    //     ? new Resource.fromJson(json['resource'])
    //     : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['resourceId'] = this.resourceId;
    data['type'] = this.tags;
    if (this.resource != null) {
      data['resource'] = this.resource!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static _getTagList(Map<String, dynamic> json) {
    List<String> tagsList = [];
    (json['node'] ?? const {})['tags']?.forEach((tag) => tagsList.add(tag));
    return tagsList;
  }
}
