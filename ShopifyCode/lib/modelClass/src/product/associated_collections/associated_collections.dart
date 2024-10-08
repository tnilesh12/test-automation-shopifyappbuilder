


class AssociatedCollections {
  String? id;
  String? title;
  String? description;
  String? updatedAt;
  String? descriptionHtml;
  String? handle;

  

  AssociatedCollections({
    this.id,
    this.title,
    this.description,
    this.updatedAt,
    this.descriptionHtml,
    this.handle,
  });

  static AssociatedCollections fromGraphJson(Map<String, dynamic> json) {
    return AssociatedCollections(
        description: (json['node'] ?? const {})['description'],
        descriptionHtml: (json['node'] ?? const {})['descriptionHtml'],
        id: (json['node'] ?? const {})['id'],
        handle: (json['node'] ?? const {})['handle'],
        updatedAt: (json['node'] ?? const {})['updatedAt'],
        title: (json['node'] ?? const {})['title']);
  }

  AssociatedCollections.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    descriptionHtml = json['descriptionHtml'];
    id = json['id'];
    handle = json['handle'];
    updatedAt = json['updatedAt'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() => {
        'description': '$description',
        'descriptionHtml': '$descriptionHtml',
        'id': '$id',
        'handle': '$handle',
        'updatedAt': '$updatedAt',
        'title': '$title'
      };

}
