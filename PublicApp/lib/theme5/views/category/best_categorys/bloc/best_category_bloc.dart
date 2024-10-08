// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:thesatanictemple/shopify_graphql/shopify/src/shopify_store.dart';

// import '../../../../shopify_graphql/models/src/collection/collection.dart';

// part 'best_category_event.dart';

// part 'best_category_state.dart';

// class BestCategoryBloc extends Bloc<BestCategoryEvent, BestCategoryState> {
//   List<Collection> data = [];
//   List<String> ids;

//   BestCategoryBloc(this.ids) : super(BestCategoryInitial()) {
//     on<BestCategoryEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//     LoadData();
//   }

//   LoadData() async {
//     try{
//     emit(BestCategoryLoading());
//     print(".............................");
//     print(data.length);
//     print(".................................");
//     data = await ShopifyStore.instance.getCollectionsByIds(ids);
//     print(".............................");
//     print(data.length);
//     print(".................................");
//     emit(BestCategoryLoaded());
//     }catch(e){}
//   }
// }
