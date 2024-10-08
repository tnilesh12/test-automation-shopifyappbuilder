import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/database/recent_product.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/session/session.dart';
import '/views/home_screen/bloc/home_screen_event.dart';
import '/views/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  DashboardDataModel? dashboardDataModel;
  List<RecentProduct> recentProduct = [];

  HomeScreenBloc() : super(HomeScreenInitialState()) {
    getData();
    // getRecentProductList();
  }

  // getRecentProductList() async {
  //   recentProduct = await DataBaseOperation(globals.database!).listOfProducts();
  //   print("recentProduct......................${recentProduct}");
  // }

  getData() async {
    emit(HomeScreenLoadingState());
    dashboardDataModel = await Session().getAppDashboardData();
    // Future.delayed(Duration(milliseconds: 2000));
    print(
        "------------dashboardScreen---------------${dashboardDataModel!.toJson()}");
    emit(HomeScreenSuccessState(dashboardDataModel));
  }
}
