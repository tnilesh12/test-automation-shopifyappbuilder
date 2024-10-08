import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/routes.dart';
// import '/theme2/views/product_list/product_list_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/route/go_routes.dart';
import '/theme2/views/product_list/product_list_screen.dart';

class CollectionViewAll extends StatelessWidget {
  CollectionGridData collectionGridData;

  CollectionViewAll(this.collectionGridData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Container(
                  width: 35, //MediaQuery.of(context).size.width * 0.09,
                  height: 35, //MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                  child: SvgPicture.asset("assets/images/arrow-back.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!, BlendMode.srcIn)),
                ),
                onPressed: () {
                  context.pop();
                }),
            title: Text(LanguageManager.translations()['Collections']!)),
        // backgroundColor: Theme.of(context).primaryColor,
        body: CollectionViewAllBody(context));
  }

  Widget CollectionViewAllBody(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //2
              mainAxisSpacing: 5, //20
              crossAxisSpacing: 5, //20
              mainAxisExtent: 140, //150
            ),
            padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 5,
                DashboardFontSize.paddingRight, 5),
            itemCount: collectionGridData.collectionList!.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.synchronized(
                duration: const Duration(milliseconds: 500),
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: CategoryItemForCollection(
                        collectionGridData.collectionList![index].imageSrc !=
                                null
                            ? collectionGridData
                                .collectionList![index].imageSrc!
                            : "",
                        collectionGridData.collectionList![index].productTitle!,
                        () {
                      if (collectionGridData
                          .collectionList![index].id!.isNotEmpty) {
                        ProductListScreen productListScreen = ProductListScreen(
                            collectionGridData.collectionList![index].id!,
                            collectionGridData
                                .collectionList![index].productTitle!);
                        RouteGenerate.ManageUserClick(
                            context, Routes.productListScreen,
                            data: productListScreen);
                      }
                    }),
                  ),
                ),
              );
            }));
  }
}

class CategoryItemForCollection extends StatelessWidget {
  String imageUrl, title;
  void Function()? onTap;

  CategoryItemForCollection(this.imageUrl, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(DashboardFontSize.customBorderRadius)),
            // border: Border.all(
            //     width: 1, color: AppTheme.borderColor!.withAlpha(120))
          ),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                      width: 80,
                      height: 80,
                      child: WidgetImage(
                        imageUrl,
                        // width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.width,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: Theme.of(context).textTheme!.titleSmall!,
                  softWrap: true,
                ),
              ]),
        ));
  }
}
