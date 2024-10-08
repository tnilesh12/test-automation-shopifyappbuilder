import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import '/views/product_details_screen/kiwi_sizing_bloc/kiwi_sizing_event.dart';
import '/views/product_details_screen/kiwi_sizing_bloc/kiwi_sizing_state.dart';
import 'package:shopify_code/globels.dart' as globals;

class KiwiSizingBloc extends Bloc<KiwiSizingEvent, KiwiSizingState> {
  final String ids;
  bool isSizeChartVisible = false;

  KiwiSizingBloc(this.ids) : super(KiwiSizingInitialState()) {
    if (globals.plugins.containsKey(PluginsEnum.KIWI_SIZING.name)) {
      LoadSizeChartData(ids.replaceAll("gid://shopify/Product/", ""));
    }
  }

  LoadSizeChartData(String id) async {
    debugPrint("---------------LoadSizeChartData called------------------- ");
    ApiResponse apiResponse = await ApiRepository.getAPIForKiwiSizing(
        ApiConst.getSizeChart.replaceAll("{p_id}", id));
    if (apiResponse.status) {
      isSizeChartVisible = true;
      debugPrint("------------LoadSizeChartData success------------------- ");
    } else {
      debugPrint(
          "-----------------------LoadSizeChartData api failure bloc-------------- ");
    }
  }
}
