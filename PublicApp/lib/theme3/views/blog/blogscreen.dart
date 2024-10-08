// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:thesatanictemple/theme/app_theme.dart';
// import '../../../shopify_graphql/models/models.dart';
// import '../../../shopify_graphql/models/src/article/article.dart';
// import '../../../shopify_graphql/models/src/article/articles/articles.dart';
// import '../../../theme/app_assets.dart';
// import '../../../views/blog/bloc/blogscreen_bloc.dart';
// import '../../../views/blog/bloc/blogscreen_state.dart';
// import '../../../views/widgets/search_view.dart';
// import '../../route/route_generate.dart';
// import '../../theme/app_colors.dart';
// import '../../theme/app_theme.dart';
// import '../widgets/header_widget.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../widgets/no_internet_view.dart';

// class BlogScreen extends StatefulWidget {
//   const BlogScreen({super.key});
//   @override
//   _BlogScreenState createState() => _BlogScreenState();
// }


// class _BlogScreenState extends State {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     context.read<BlogScreenBloc>().LoadBlogData();
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 AppLocalizations.of(context)!.blog,
//                 style: TextStyle( fontFamily: 'Cinzel'),
//               ),
//             ),
//             resizeToAvoidBottomInset: true,
//             body: Column(children: [
//               SearchViewWidget()
//                   .SearchView(context, AppLocalizations.of(context)!.tap, (p0) => null, () => null),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: BlocBuilder<BlogScreenBloc, BlogScreenState>(
//                   builder: (context, state) {
//                     if (state is BlogScreenNoInternetState) {
//                       return NoInternetView();
//                     } else if (state is BlogScreenLoadedState) {
//                       return ListView.builder(
//                           itemCount: state.blog!.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               child: Container(
//                                 margin: EdgeInsets.only(
//                                     bottom: 10, left: 10, right: 10),
//                                 width: MediaQuery.of(context).size.width,
//                                 padding: EdgeInsets.only(
//                                   left: 10,
//                                 ),
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color:  Theme.of(context).colorScheme.background)),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Flexible(
//                                       child: Container(
//                                         margin:
//                                             EdgeInsets.only(top: 10, bottom: 10),
//                                         width: 100,
//                                         height: 100,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                   state.blog![index].image!.originalSrc.toString()
//                                                     ),
//                                                 fit: BoxFit.cover)),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Container(
//                                       width: 1,
//                                       height: 120,
//               color: Theme.of(context).colorScheme.background.withAlpha(50),
//                                     ),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                               padding:
//                                                   EdgeInsets.only(top: 10)),
//                                           Text(
//                                            state.blog![index].title.toString(),
//                                             style: TextStyle(
//                                                 color: AppTheme.black,
//                                                 fontSize: 18,
//                                                    fontFamily: 'Cinzel',),
//                                           ),
//                                           SizedBox(height: 5),
//                                           Text(
//                                           state.blog![index].author!.firstName.toString()+""+ state.blog![index].author!.lastName.toString()
//                                            , overflow: TextOverflow.ellipsis,
//                                             maxLines: 2,
//                                             style: TextStyle(
//                                                 color: AppTheme.black.withAlpha(120),
//                                                    fontFamily: 'Cinzel',),
//                                           ),
//                                           SizedBox(height: 5),
//                                           Text(
//                                           state.blog![index].publishedAt.toString(),
//                                             style: TextStyle(
//                                                 color: AppTheme.black.withAlpha(120),
//                                                    fontFamily: 'Cinzel',),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               onTap: () {
                 
//                                 Navigator.pushNamed(
//                                     context, RouteGenerate.blogpostscreen,
//                                     arguments: {
//                                     state.blog![index]                                    });
//                               },
//                             );
//                           });
//                     } else {
//                       return Container();
//                     }
//                   },
//                 ),
//               ),
//             ])));
//   }
// }
