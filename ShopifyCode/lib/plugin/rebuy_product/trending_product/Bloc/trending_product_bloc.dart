import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/rebuy_product/trending_product/Bloc/trending_product_event.dart';
import 'package:shopify_code/plugin/rebuy_product/trending_product/Bloc/trending_product_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class TrendingProductBloc
    extends Bloc<TrendingProductEvent, TrendingProductState> {
  var data;
  TrendingProductBloc() : super(TrendingProductInitialState()) {
    getTrendingViewData();
  }

  getTrendingViewData() async {
    // Dio client = Dio();
    // Response response = await client.get(
    //     "https://rebuyengine.com/api/v1/products/top_sellers?key=dafd5187be5b5ada05f761e64d42fe082068912b&format=prettyy");

    // if (response.statusCode == 200) {
    //   data = response.data;
    //   emit(TrendingProductSuccessState(response.data));

    //   print("reponse of quick view ==>${response.data}");
    // } else {
    //   print("else condition ===> ${response.statusCode}");
    // }

    String apiKey = globals.plugins[PluginsEnum.REBUY.name].secrets.appKey;

    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(ApiConst
        .rebuyProduct
        .replaceAll("{type}", "top_sellers")
        .replaceAll("{api_key}", apiKey));

    if (apiResponse.status) {
      emit(TrendingProductSuccessState(apiResponse.data));
    } else {
      print("error occured");
    }
  }
}
