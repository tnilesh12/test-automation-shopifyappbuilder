import 'package:shopify_code/modelClass/notificationlist_model.dart';

class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {
  List<Result> notificationdata = [];
  String positionCount;
  bool LoadMore;
  NotificationLoadedState(
      this.notificationdata, this.positionCount, this.LoadMore);
}

class NotificationNoDataState extends NotificationState {}
