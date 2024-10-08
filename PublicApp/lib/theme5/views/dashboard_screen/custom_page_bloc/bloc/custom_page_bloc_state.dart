part of 'custom_page_bloc_bloc.dart';

@immutable
abstract class CustomPageBlocState {}

class CustomePageSuccessState extends CustomPageBlocState {
  DashboardDataModel? dashboardDataItems;
  CustomePageSuccessState(this.dashboardDataItems);
}

class CustomePageFailuerState extends CustomPageBlocState {}

class CustomePageLoadingState extends CustomPageBlocState {}

class CustomePageLoadingClose extends CustomPageBlocState {}

class CustomPageBlocInitialstate extends CustomPageBlocState {}
