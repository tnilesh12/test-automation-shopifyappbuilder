part of 'dashboard_screen_bloc.dart';

abstract class DashboardScreenState {}

class DashboardScreenInitialState extends DashboardScreenState {}

class DashboardScreenSuccessState extends DashboardScreenState {
  // DashboardDataModel? dashboardDataModel;
  MenuDataModel? menuDataModel;
  DashboardDataItems? dashboardDataItems;
  DashboardScreenSuccessState(this.menuDataModel, this.dashboardDataItems);
}

// class DashboardScreenMessageState extends DashboardScreenState {
//   String? msg;
//   DashboardScreenMessageState(this.msg);
// }

// class DashboardScreenDataNotFoundState extends DashboardScreenState {}

class DashboardScreenCustomerNotFoundState extends DashboardScreenState {}
