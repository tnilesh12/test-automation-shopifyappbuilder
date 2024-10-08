import '../product/shopify_image/shopify_image.dart';
import 'author_v_2/author_v_2.dart';
import 'comment/comment.dart';

class Article {
  AuthorV2? author;
  List<Comment>? commentList;
  String? content;
  String? contentHtml;
  String? excerpt;
  String? excerptHtml;
  String? handle;
  String? id;
  ShopifyImage? image;
  String? publishedAt;
  List<String>? tags;
  String? title;
  String? onlineStoreUrl;

  Article({
    this.author,
    this.commentList,
    this.content,
    this.contentHtml,
    this.excerpt,
    this.excerptHtml,
    this.handle,
    this.id,
    this.image,
    this.publishedAt,
    this.tags,
    this.title,
    this.onlineStoreUrl,
  });

  Article.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    commentList = _getCommentList(json);
    content = json['content'];
    contentHtml = json['contentHtml'];
    excerpt = json['excerpt'];
    excerptHtml = json['excerptHtml'];
    handle = json['handle'];
    id = json['id'];
    image = json['image'] != null ? ShopifyImage.fromJson(json['image']) : null;
    publishedAt=json['publishedAt'];
    tags = _getTagsList(json);
    title = json['title'];
    onlineStoreUrl = json['onlineStoreUrl'];
  }

  Map<String, dynamic> toJson() => {
        'author': '$author',
        'commentList': _getCommentList,
        'content': '$content',
        'contentHtml': '$contentHtml',
        'excerpt': '$excerpt',
        'excerptHtml': '$excerptHtml',
        'handle': '$handle',
        'id': '$id',
        'image': image!.toJson(),
        'publishedAt':'$publishedAt',
        'tags': _getTagsList,
        'title': '$title',
        'onlineStoreUrl': '$onlineStoreUrl'
      };

  static Article fromGraphJson(Map<String, dynamic> json) {
    return Article(
      author: AuthorV2.fromJson(
          ((json['node'] ?? const {})['authorV2']) ?? const {}),
      commentList:
          _getCommentList((json['node'] ?? const {})['comments'] ?? const {}),
      content: (json['node'] ?? const {})['content'],
      contentHtml: (json['node'] ?? const {})['contentHtml'],
      excerpt: (json['node'] ?? const {})['excerpt'],
      excerptHtml: (json['node'] ?? const {})['excerptHtml'],
      handle: (json['node'] ?? const {})['handle'],
      id: (json['node'] ?? const {})['id'],
      image: json['node']['image'] == null
          ? null
          : ShopifyImage.fromJson(json['node']['image']),
      publishedAt: (json['node'] ?? const {})['publishedAt'],
      tags: _getTagsList(json),
      title: (json['node'] ?? const {})['title'],
      onlineStoreUrl: (json['node'] ?? const {})['onlineStoreUrl'],
    );
  }

  static _getCommentList(Map<String, dynamic> json) {
    List<Comment> commentList = [];
    json['edges']?.forEach((comment) =>
        commentList.add(Comment.fromGraphJson(comment ?? const {})));
    return commentList;
  }

  static _getTagsList(Map<String, dynamic> json) {
    List<String> tagsList = [];
    (json['node'] ?? const {})['tags']?.forEach((tag) => tagsList.add(tag));
    return tagsList;
  }
}
