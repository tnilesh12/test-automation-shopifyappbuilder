import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/article/article.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
part 'article_screen_event.dart';
part 'article_screen_state.dart';

class ArticleScreenBloc extends Bloc<ArticleScreenEvent, ArticleScreenState> {
  String articleId = "";

  ArticleScreenBloc(this.articleId) : super(ArticleScreenInitialState()) {
    on<ArticleScreenEvent>((event, emit) {});
    loadArticleById();
  }

  loadArticleById() async {
    emit(ArticleScreenLoadingState());

    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.articleById.replaceAll("{article_id}", articleId));

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadArticleById bloc success ");
      // debugPrint(
      //     "-------------response${apiResponse.data["result"]["body"]["data"]["article"]}");

      if (apiResponse.data["result"]["body"]["data"]["article"] == null) {
        emit(ArticleScreenNoDataFound());
      } else {
        Article article = Article.fromJson(
            apiResponse.data["result"]["body"]["data"]["article"]);
        emit(ArticleScreenLoadedState(article));
      }
    } else {
      debugPrint(
          "--------------------loadArticleById--------------api failure bloc ");
      emit(ArticleScreenAPIFailureState(apiResponse.message));
    }
  }
}
