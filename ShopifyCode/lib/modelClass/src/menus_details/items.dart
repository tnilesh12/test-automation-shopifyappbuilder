class Items {
  String? id;
  String? title;
  String? resourceId;
  String? url;
  String? type;
  // Resource? resource;
  dynamic resource;
  List<Items>? items;
  List<String>? tags;

  Items(
      {this.id,
      this.title,
      this.resourceId,
      this.url,
      this.type,
      this.resource,
      this.items,
      this.tags});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    resourceId = json['resourceId'];
    url = json['url'];
    type = json['type'];
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
    data['url'] = this.url;
    data['type'] = this.type;
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
