// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:jsontoview/modelClass/data_model.dart';
// import 'package:thesatanictemple/theme/app_colors.dart';
// import 'package:thesatanictemple/views/product_list/best_product/bloc/best_product_bloc.dart';
// import '../../../../repository/ApiRepository.dart';
// import '../../../../route/route_generate.dart';
// import '../../../shopify_graphql/models/src/product/product.dart';
// import '../../../theme/app_theme.dart';
// import '../../widgets/product_list_widget.dart';

// class BestProductView extends StatefulWidget {
//   ProductData items;
//   String title;
//   Function() OnViewAllClick;

//   BestProductView(this.title, this.OnViewAllClick, this.items, {super.key});

//   @override
//   State<BestProductView> createState() => _BestProductViewState();
// }

// class _BestProductViewState extends State<BestProductView> {
//   List<String> ids = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     widget.items.productItems!.forEach((element) {
//       ids.add(element.productLinkId.toString());
//       print(ids);
//       print("=============================");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BestProductBloc(ids),
//       child: BlocBuilder<BestProductBloc, BestProductState>(
//         builder: (context, state) {
//           return Container(
//             color: AppTheme.white,
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(15, 10, 10, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         child: Text(
//                           widget.title,
//                           style: TextStyle(
//                                   fontFamily: 'Cinzel',
//                                   fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                             
//                               ),
//                         ),
//                       ),
//                       // Container(
//                       //   child: InkWell(
//                       //     // onTap: OnViewAllClick,
//                       //     onTap: () async {
//                       //       // if(widget.id.isNotEmpty) {
//                       //       //   Navigator.pushNamed(context,
//                       //       //       RouteGenerate.productListScreen, arguments: {
//                       //       //         widget.id,
//                       //       //         widget.title
//                       //       //       });
//                       //       // }
//                       //     },
//                       //     child: Text(
//                       //       AppLocalizations.of(context)!.see_all,
//                       //       style: Theme.of(context).textTheme.titleSmall,
//                       //     ),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 ),
//                 state is BestProductLoaded
//                     ? 
//                     // ProductListWidgets().listItemProduct(
//                     //     context, context.read<BestProductBloc>().data!)
//                     ProductListWidgets(context, context.read<BestProductBloc>().data!)
//                     : Text(AppLocalizations.of(context)!.loading),
//               ],
//             ),    
//           );
//         },
//       ),
//     );
//   }
// }
