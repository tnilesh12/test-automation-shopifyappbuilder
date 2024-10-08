import '../article/articles/articles.dart';

class Blog {
  String? id;
  String? handle;
  String? title;
  String? onlineStoreUrl;
  Articles? articles;

  Blog({
    this.id,
    this.handle,
    this.title,
    this.onlineStoreUrl,
    this.articles,
  });

  static Blog fromGraphJson(Map<String, dynamic> json) {
    return Blog(
        id: (json['node'] ?? {})['id'],
        handle: (json['node'] ?? {})['handle'],
        title: (json['node'] ?? {})['title'],
        onlineStoreUrl: (json['node'] ?? {})['onlineStoreUrl'],
        articles: Articles.fromGraphJson(
            ((json['node'] ?? const {})['articles']) ?? const {}));
  }

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    handle = json['handle'];
    title = json['title'];
    onlineStoreUrl = json['onlineStoreUrl'];
    articles = Articles.fromJson(json['articles']);
  }
  Map<String, dynamic> toJson() => {
        'id': '$id',
        'handle': '$handle',
        'title': '$title',
        'onlineStoreUrl': '$onlineStoreUrl',
        'articles': '$articles'
      };
}
