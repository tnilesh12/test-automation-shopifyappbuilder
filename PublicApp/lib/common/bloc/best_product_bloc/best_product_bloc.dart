// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:thesatanictemple/shopify_graphql/models/models.dart';

// import '../../../../shopify_graphql/shopify/src/shopify_store.dart';

// part 'best_product_event.dart';
// part 'best_product_state.dart';

// class BestProductBloc extends Bloc<BestProductEvent, BestProductState> {

//   List<Product>? data = [];
//   List<String> ids;

//   BestProductBloc(this.ids) : super(BestProductInitial()) {
//     on<BestProductEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//     LoadData();
//   }

//   LoadData() async {
//     try{
//     emit(BestProductLoading());
//     data = await ShopifyStore.instance.getProductsByIds(ids);
//     emit(BestProductLoaded());
//     }catch(e){}
//   }
// }
