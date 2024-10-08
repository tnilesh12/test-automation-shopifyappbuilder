import 'package:publicapp/common/bloc/recent_bloc/recent_product_event.dart';
import 'package:publicapp/common/bloc/recent_bloc/recent_product_state.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/database/recent_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/globels.dart' as globals;

class RecentProductBloc extends Bloc<RecentProductEvent, RecentProductState> {
  // DashboardDataModel? dashboardDataModel;
  List<RecentProduct> recentProduct = [];
  RecentProductBloc() : super(RecentProductInitialState()) {
    getRecentProductList();
  }
  getRecentProductList() async {
    recentProduct = await DataBaseOperation(globals.database!).listOfProducts();
    print("recentProduct......................${recentProduct}");
    recentProduct.length > 0 ? emit(RecentProductSuccessState()) : "";
  }
}
