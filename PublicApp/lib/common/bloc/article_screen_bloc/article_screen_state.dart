part of 'article_screen_bloc.dart';

@immutable
sealed class ArticleScreenState {}

class ArticleScreenInitialState extends ArticleScreenState {}

class ArticleScreenLoadingState extends ArticleScreenState {}

class ArticleScreenLoadedState extends ArticleScreenState {
  Article article;
  ArticleScreenLoadedState(this.article);
}

class ArticleScreenNoDataFound extends ArticleScreenState {}

class ArticleScreenAPIFailureState extends ArticleScreenState {
  String message;
  ArticleScreenAPIFailureState(this.message);
}