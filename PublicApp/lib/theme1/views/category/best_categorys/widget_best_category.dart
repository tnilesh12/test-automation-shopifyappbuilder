// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:jsontoview/modelClass/data_model.dart';
// import 'package:jsontoview/modelClass/page_layout_model.dart';
// import 'package:thesatanictemple/theme/app_colors.dart';
// import 'package:thesatanictemple/theme/app_theme.dart';
// import 'package:thesatanictemple/views/category/best_categorys/bloc/best_category_bloc.dart';

// import 'package:cached_network_image/cached_network_image.dart';
// import '../../../route/route_generate.dart';
// import '../../../shopify_graphql/models/src/collection/collection.dart';
// import '../../../theme/app_assets.dart';

// class BestCategorys extends StatefulWidget {
//   CategoryData category;

//   BestCategorys(this.category, {super.key});

//   @override
//   State<BestCategorys> createState() => _BestCategorysState();
// }

// class _BestCategorysState extends State<BestCategorys> {
//   List<String> ids = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     widget.category.categoryItems!.forEach((element) {
//       ids.add(element.categoryLinkId.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BestCategoryBloc(ids),
//       child: BlocBuilder<BestCategoryBloc, BestCategoryState>(
//         builder: (context, state) {
//           return Container(
//               color: Theme.of(context).colorScheme.background,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(15, 10, 0, 15),
//                   child: Text(
//                     AppLocalizations.of(context)!.popular_categories,
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Cinzel'),
//                   ),
//                 ),
//                 state is BestCategoryLoading
//                     ? Text("Loading")
//                     : populorCategoryView(
//                         context.read<BestCategoryBloc>().data),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget populorCategoryView(List<Collection> data) {
//     return Container(
//               color: Theme.of(context).colorScheme.background,
//         height: 130,
//         child: ListView.builder(
//             physics: ClampingScrollPhysics(),
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: data.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, RouteGenerate.productListScreen,
//                       arguments: {data[index].id, data[index].title});
//                 },
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   width: 100,
//                   child: Column(children: [
//                     SizedBox(
//                       height: 5,
//                     ),
//                     ClipOval(
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         child: CachedNetworkImage(
//                             imageUrl: data[index].image!.originalSrc.toString(),
//                             placeholder: (context, url) => Image.asset(
//                                 AppAssets.placeholder,
//                                 fit: BoxFit.cover),
//                             errorWidget: (context, url, error) => Image.asset(
//                                 AppAssets.placeholder,
//                                 fit: BoxFit.cover),
//                             fit: BoxFit.cover),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[400],
//                           borderRadius: BorderRadius.all(Radius.circular(70)),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
//                       child: Text(data[index].title.toString(),
//                           overflow: TextOverflow.clip,
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall!
//                               .copyWith(fontSize: 12, color: Colors.grey,fontFamily: 'Cinzel')),
//                     )
//                   ]),
//                 ),
//               );
//             }));
//   }
// }
