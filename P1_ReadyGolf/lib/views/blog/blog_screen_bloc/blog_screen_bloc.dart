import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/blog/blog.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'blog_screen_event.dart';
import 'blog_screen_state.dart';

class BlogScreenBloc
    extends Bloc<BlogScreenEvent, BlogScreenState> {
  String blogId = "";

  BlogScreenBloc(this.blogId) : super(BlogScreenInitialState()) {
    on<BlogScreenEvent>((event, emit) {});
    loadBlogById();
  }

  loadBlogById() async {
    emit(BlogScreenLoadingState());

    ApiResponse apiResponse = await ApiRepository.getAPI(
        ApiConst.blogById.replaceAll("{blog_id}", blogId));

    if (apiResponse.status) {
      debugPrint(
          "----------------------------------loadBlogById bloc success ");
      // debugPrint(
      //     "-------------response${apiResponse.data["result"]["body"]["data"]["blog"]}");
      Blog blog =
          Blog.fromJson(apiResponse.data["result"]["body"]["data"]["blog"]);

      if (blog.articles!.articleList!.isEmpty) {
        emit(BlogScreenNoDataFound());
      } else {
        emit(BlogScreenLoadedState(blog));
      }
    } else {
      debugPrint(
          "--------------------loadBlogById--------------api failure bloc ");
      emit(BlogScreenAPIFailureState(apiResponse.message));
    }
  }

  // LoadBlogHandleData() async {
  //   emit(BlogScreenLoadingState());
  //   var formData = {"handle": handle, "sortKey": "RELEVANCE", "reverse": false};

  //   ApiResponse apiResponse =
  //       await ApiRepository.postAPI(ApiConst.blogByHandle, formData);

  //   if (apiResponse.status) {
  //     debugPrint(
  //         "----------------------------------LoadBlogHandleData bloc success ");
  //     // debugPrint(
  //     //     "-------------response${apiResponse.data["result"]["body"]["data"]["blogByHandle"]}");
  //     Blog blog = Blog.fromJson(
  //         apiResponse.data["result"]["body"]["data"]["blogByHandle"]);

  //     if (blog.articles!.articleList!.isEmpty) {
  //       emit(BlogScreenNoDataFound());
  //     } else {
  //       emit(BlogScreenLoadedState(blog));
  //     }
  //   } else {
  //     debugPrint(
  //         "--------------------LoadBlogHandleData--------------api failure bloc ");
  //     emit(BlogScreenAPIFailureState(apiResponse.message));
  //   }
  // }
}
