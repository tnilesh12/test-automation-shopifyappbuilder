class Pagess {
  String? body;
  String? bodySummary;
  String? createdAt;
  String? handle;
  String? id;
  String? title;
  String? updatedAt;
  String? onlineStoreUrl;

  Pagess({
    this.body,
    this.bodySummary,
    this.createdAt,
    this.handle,
    this.id,
    this.title,
    this.updatedAt,
    this.onlineStoreUrl,
  });

  static Pagess fromGraphJson(Map<String, dynamic> json) {
    return Pagess(
      id: (json['node'] ?? {})['id'],
      handle: (json['node'] ?? {})['handle'],
      title: (json['node'] ?? {})['title'],
      onlineStoreUrl: (json['node'] ?? {})['onlineStoreUrl'],
      body: (json['node'] ?? {})['body'],
      bodySummary: (json['node'] ?? {})['bodySummary'],
      createdAt: (json['node'] ?? const {})['createdAt'],
      updatedAt: (json['node'] ?? const {})['updatedAt'],
    );
  }

  Pagess.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    id = json['id'];
    handle = json['handle'];
    onlineStoreUrl = json['onlineStoreUrl'];
    bodySummary = json['bodySummary'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
  }
  Map<String, dynamic> toJson() => {
        'body': '$body',
        'id': '$id',
        'handle': '$handle',
        'onlineStoreUrl': '$onlineStoreUrl',
        'bodySummary': '$bodySummary',
        'createdAt': '$createdAt',
        'updatedAt': '$updatedAt',
        'title': '$title',
      };
}
