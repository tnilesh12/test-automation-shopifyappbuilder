import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/globels.dart' as globals;
part 'star_widget_event.dart';
part 'star_widget_state.dart';

class StarWidgetBloc extends Bloc<StarWidgetEvent, StarWidgetState> {
  String productId;
  StarWidgetBloc(this.productId) : super(StarWidgetInitialState()) {
    on<StarWidgetEvent>((event, emit) {});
    loadStarWidgetData(productId);
  }

  loadStarWidgetData(String productId) async {
    emit(StarWidgetLoadingState());
    productId = productId.replaceAll("gid://shopify/Product/", "");
    debugPrint("--------------loadStarWidgetData------------productId$productId  ");
    if (globals.productStarRating.containsKey(productId)) {
      debugPrint("----------------------------------loadStarWidgetData bloc globals.productStarRating.containsKey(productId) true ${globals.productStarRating[productId]!}");
      emit(StarWidgetLoadedState(int.parse(globals.productStarRating[productId]!)));
    } else {
      ApiResponse apiResponse = await ApiRepository.getAPI(
          ApiConst.getProductReviewCount.replaceAll("{p_id}", productId));

      if (apiResponse.status) {
        debugPrint("----------------------------------loadStarWidgetData bloc success ");
        try {          
          double avgRating = double.parse(apiResponse.data["result"]["dataAverageRating"].toString());
          int averageRating = avgRating.toInt();
          globals.productStarRating[productId] = averageRating.toString();
          emit(StarWidgetLoadedState(averageRating));
        } catch (e) {
          globals.productStarRating[productId] = "0";
          emit(StarWidgetNoDataState(0));
        }
      } else {
        debugPrint("----------------------------------loadStarWidgetData bloc failure ");
        // emit(StarWidgetAPIFailureState(apiResponse.message));
          globals.productStarRating[productId] = "0";
        emit(StarWidgetNoDataState(0));
      }
    }
  }
}
