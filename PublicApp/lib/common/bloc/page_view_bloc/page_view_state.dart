import 'package:shopify_code/modelClass/src/page/page.dart';

abstract class PageViewScreenState {}

class PageViewScreenInitialState extends PageViewScreenState {}

class PageViewScreenLoadingState extends PageViewScreenState {}

class PageViewScreenLoadedState extends PageViewScreenState {
  Pagess pagess;
  PageViewScreenLoadedState(this.pagess);
}

class PageViewScreenNoDataFound extends PageViewScreenState {}

class PageViewScreenAPIFailureState extends PageViewScreenState {
  String message;
  PageViewScreenAPIFailureState(this.message);
}
