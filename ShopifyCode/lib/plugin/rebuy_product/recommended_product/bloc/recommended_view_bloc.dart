import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/rebuy_product/recommended_product/bloc/recommended_view_event.dart';
import 'package:shopify_code/plugin/rebuy_product/recommended_product/bloc/recommended_view_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class RecommendedViewBloc
    extends Bloc<RecommendedViewEvent, RecommendedViewState> {
  RecommendedViewBloc() : super(RecommendedViewInitialState()) {
    getRecommendedViewData();
  }

  getRecommendedViewData() async {
    // Dio client = Dio();
    // Response response = await client.get(
    //     "https://rebuyengine.com/api/v1/products/recommended?key=dafd5187be5b5ada05f761e64d42fe082068912b&format=prettyy");
    // // "https://rebuyengine.com/api/v1/products/recommended?shopify_customer_id=###&key=dafd5187be5b5ada05f761e64d42fe082068912b&format=pretty");

    // if (response.statusCode == 200) {
    //   emit(RecommendedViewSuccessState(response.data));
    //   print("reponse of quick view ==>${response.data}");
    // } else {
    //   print("else condition ===> ${response.statusCode}");
    // }
    String apiKey = globals.plugins[PluginsEnum.REBUY.name].secrets.appKey;

    ApiResponse apiResponse = await ApiRepositoryWithoutBaseUrl.getAPI(ApiConst
        .rebuyProduct
        .replaceAll("{type}", "recommended")
        .replaceAll("{api_key}", apiKey));

    if (apiResponse.status) {
      emit(RecommendedViewSuccessState(apiResponse.data));
    } else {
      print("error occured");
    }
  }
}
