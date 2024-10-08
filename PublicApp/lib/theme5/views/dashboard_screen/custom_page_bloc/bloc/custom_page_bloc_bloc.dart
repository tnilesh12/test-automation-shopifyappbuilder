import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
// import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
part 'custom_page_bloc_event.dart';
part 'custom_page_bloc_state.dart';

class CustomPageBlocBloc
    extends Bloc<CustomPageBlocEvent, CustomPageBlocState> {
  String? pageId;
  CustomPageBlocBloc(this.pageId) : super(CustomPageBlocInitialstate()) {
    on<CustomPageBlocEventrefresh>((event, emit) {
      emit(CustomPageBlocInitialstate());
      pageId = event.id;
      getCustomPageData();
    });
    getCustomPageData();
  }

  @override
  Future<void> close() {
    emit(CustomPageBlocInitialstate());
    return super.close();
  }

  getCustomPageData() async {
    try {
      ApiResponse response = await ApiRepository.getAPI(
          ApiConst.customPage.replaceAll("{id}", pageId!));

      if (response.status) {
        DashboardDataModel dashboardDataItems =
            DashboardDataModel.fromJson(response.data["result"]);
        // print("-------------------->>> ${response.data["result"]["pageJson"]}");
        // print("json---->${dashboardDataItems.toJson()}");
        emit(CustomePageSuccessState(dashboardDataItems));
      }
    } catch (e) {
      emit(CustomePageFailuerState());
    }
  }
}
