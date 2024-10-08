

import '../article.dart';

// part 'articles.freezed.dart';
// part 'articles.g.dart';


class Articles {
  List<Article>? articleList;

  Articles({this.articleList});

  Articles.fromJson(Map<String, dynamic> json) {
    articleList = _getArticleList(json);
  }

  Map<String, dynamic> toJson() => {'articleList': _getArticleList};

  // =>
  //     _$ArticlesFromJson(json);

  static Articles fromGraphJson(Map<String, dynamic> json) {
    return Articles(articleList: _getArticleList(json));
  }

  static _getArticleList(Map<String, dynamic> json) {
    List<Article> articleList = [];
    json['edges']?.forEach((article) =>
        articleList.add(Article.fromGraphJson(article ?? const {})));
    return articleList;
  }
}
