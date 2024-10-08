import 'package:shopify_code/modelClass/src/blog/blog.dart';

abstract class BlogScreenState {
  BlogScreenState();
}

class BlogScreenInitialState extends BlogScreenState {}

class BlogScreenLoadingState extends BlogScreenState {}

class BlogScreenLoadedState extends BlogScreenState {
  Blog blog;
  BlogScreenLoadedState(this.blog);
}

class BlogScreenNoDataFound extends BlogScreenState {}

class BlogScreenAPIFailureState extends BlogScreenState {
  String message;
  BlogScreenAPIFailureState(this.message);
}
