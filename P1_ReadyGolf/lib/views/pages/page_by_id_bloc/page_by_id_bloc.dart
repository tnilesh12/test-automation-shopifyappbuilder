// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopify_code/modelClass/src/page/page.dart';
// import 'package:shopify_code/repository/ApiConst.dart';
// import 'package:shopify_code/repository/ApiRepository.dart';
// import 'package:shopify_code/repository/ApiResponse.dart';
// import '/views/pages/page_by_id_bloc/page_by_id_event.dart';
// import '/views/pages/page_by_id_bloc/page_by_id_state.dart';

// class PageViewScreenByIdBloc
//     extends Bloc<PageViewScreenByIdEvent, PageViewScreenByIdState> {
//   String id;

//   PageViewScreenByIdBloc(this.id) : super(PageViewScreenInitialByIdState()) {
//     on<PageViewScreenByIdEvent>((event, emit) {});
//     loadPageHandleData();
//   }

// //   void LoadPageData() async {
// //     try{
// //     emit(PageViewScreenLoadingByIdState());
// //     print(id);
// //     id = id.split("\/").last;
// //     print(id);
// //     ApiResponse res = await ApiRepository(Dio()).getPageById(id);
// // //  var map = jsonDecode(res.data);
// //     var pp = (res.data);
// // //  print(pp.onlineStoreUrl);
// //     if (pp["template_suffix"]!.length > 0 && pp["template_suffix"] != null) {
// //       emit(PageViewScreenByIdHtmlState(pp));
// //       print("htmllllllllllllllllllllllllll");
// //     } else {
// //       emit(PageViewScreenByIdJsonState(pp));
// //       print("jsonnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
// //     }
// //     }catch(e){}
// //   }

  

//   loadPageHandleData() async {
//     emit(PageViewScreenLoadingByIdState());

//     ApiResponse apiResponse =
//         await ApiRepository.getAPI(ApiConst.pageById.replaceAll("{page_id}", id));

//     if (apiResponse.status) {
//       debugPrint(
//           "----------------------------------LoadBlogHandleData bloc success ");
//       debugPrint(
//           "-------------response${apiResponse.data["result"]["body"]["data"]["pageByHandle"]}");
//       Pagess pagess = Pagess.fromJson(
//           apiResponse.data["result"]["body"]["data"]["pageByHandle"]);

//       emit(PageViewScreenByIdLoadedState(pagess));
//     } else {
//       debugPrint(
//           "--------------------LoadBlogHandleData--------------api failure bloc ");
//       emit(PageViewScreenByIdAPIFailureState(apiResponse.message));
//     }
//   }
  
// }
