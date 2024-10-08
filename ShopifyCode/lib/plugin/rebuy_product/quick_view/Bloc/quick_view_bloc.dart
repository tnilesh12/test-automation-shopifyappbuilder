import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/rebuy_product/quick_view/Bloc/quick_view_event.dart';
import 'package:shopify_code/plugin/rebuy_product/quick_view/Bloc/quick_view_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class QuickViewBloc extends Bloc<QuickViewEvent, QuickViewState> {
  QuickViewBloc() : super(QuickViewInitialState()) {
    getQuickViewData();
  }

  getQuickViewData() async {
    // Dio client = Dio();
    // //   print("URL<><><><> : ${ApiConst.hulkProductOption.replaceAll("{id}", id)}");

    // //  String token = await Session().getAccessToken();
    // // client.options.headers["authorization"] =
    // //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lIjoiTW9uIERlYyAwNCAyMDIzIDA2OjA2OjA4IEdNVCswMDAwIChDb29yZGluYXRlZCBVbml2ZXJzYWwgVGltZSkiLCJpZCI6IjBiY2ZkMjk3LWNiNjQtNGIxMC04NDgwLWI4MzY4MDc4OGU0YyIsInJvbGUiOiJhZG1pbiIsIm5hbWUiOiIgYWRtaW4xMSBhZG1pbjEyMzEiLCJpYXQiOjE3MDE2Njk5Njh9.YW2p7FqVneK7uw0PKVX2Br_TBRs4iK36u3oWBU8o53A";
    // var response = await client.get(
    //     "https://rebuyengine.com/api/v1/products/viewed?shopify_customer_id=###&key=dafd5187be5b5ada05f761e64d42fe082068912b&format=pretty");
    // // var res = await ApiRepository.getAPI(
    // //     "");

    // if (response.statusCode == 200) {
    //   emit(QuickViewSuccessState(response.data));
    //   print("reponse of quick view ==>${response.data}");
    // } else {
    //   print("else condition ===> ${response.statusCode}");
    // }

    String apiKey = globals.plugins[PluginsEnum.REBUY.name].secrets.appKey;

    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(ApiConst
        .rebuyProduct
        .replaceAll("{type}", "viewed")
        .replaceAll("{api_key}", apiKey));

    if (apiResponse.status) {
      emit(QuickViewSuccessState(apiResponse.data));
    } else {
      print("error occured");
    }
  }
}
