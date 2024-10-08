import 'package:shopify_code/modelClass/dashboard_data_model.dart';

class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenSuccessState extends HomeScreenState {
  DashboardDataModel? dashboardDataModel;
  HomeScreenSuccessState(this.dashboardDataModel);
}

class HomeScreenLoadingState extends HomeScreenState {}

// class HomeScreenMessageState extends HomeScreenState {
//   String? msg;
//   HomeScreenMessageState(this.msg);
// }

// class HomeScreenDataNotFoundState extends HomeScreenState {}
