import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/route/go_routes.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme4/utils/theme_size.dart';
import '/theme4/views/category/category_item_for_collection.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoryRowViewRightFromMenu extends StatelessWidget {
  final MenuDataModel menuDataModel;
  final int mainIndex;
  bool isThirdLevelExists = false;

  CategoryRowViewRightFromMenu(
      {super.key, required this.menuDataModel, required this.mainIndex}) {
    menuDataModel.menuItems![mainIndex].items!.forEach((item) {
      if (item.items!.isNotEmpty) {
        isThirdLevelExists = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isThirdLevelExists == false) {
      return Container(
          child: GridView.builder(
              shrinkWrap: true,
              physics: RangeMaintainingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 140, //70,
                mainAxisSpacing: 5, //20
                crossAxisSpacing: 5, //20
              ),
              padding: EdgeInsets.fromLTRB(
                  ThemeSize.paddingLeft, 5, ThemeSize.paddingRight, 5),
              itemCount: menuDataModel.menuItems![mainIndex].items!.length,
              itemBuilder: (context, state1) {
                return AnimationConfiguration.synchronized(
                  duration: const Duration(milliseconds: 500),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: CategoryItemForCollection(
                          (menuDataModel.menuItems![mainIndex].items![state1].type!
                                          .toUpperCase() ==
                                      "COLLECTION" &&
                                  menuDataModel.menuItems![mainIndex]
                                          .items![state1].resource !=
                                      null &&
                                  menuDataModel.menuItems![mainIndex]
                                          .items![state1].resource!["image"] !=
                                      null &&
                                  menuDataModel
                                          .menuItems![mainIndex]
                                          .items![state1]
                                          .resource!["image"]["url"] !=
                                      null)
                              ? menuDataModel
                                  .menuItems![mainIndex]
                                  .items![state1]
                                  .resource!["image"]["url"] as String
                              : "",
                          menuDataModel.menuItems![mainIndex].items![state1].title!, () {
                        // if (menuDataModel.menuItems![mainIndex].items![state1]
                        //     .resourceId!.isNotEmpty) {
                        String __typename = menuDataModel.menuItems![mainIndex]
                                        .items![state1].resource !=
                                    null &&
                                menuDataModel.menuItems![mainIndex]
                                    .items![state1].resource!
                                    .containsKey("__typename")
                            ? menuDataModel.menuItems![mainIndex].items![state1]
                                .resource!["__typename"]
                            : menuDataModel
                                .menuItems![mainIndex].items![state1].type!;
                        RouteGenerate.ManageUserClick(context, __typename,
                            data: menuDataModel
                                .menuItems![mainIndex].items![state1]);
                        // }
                      }),
                    ),
                  ),
                );
              }));
    } else {
      return ListView.builder(
          itemCount: menuDataModel.menuItems![mainIndex].items!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                menuDataModel.menuItems![mainIndex].items![index].items!
                            .length ==
                        0
                    ? Container(
                        child: AnimationConfiguration.synchronized(
                        duration: const Duration(milliseconds: 500),
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: CategoryItemForCollection(
                                (menuDataModel.menuItems![mainIndex].items![index].type!
                                                .toUpperCase() ==
                                            "COLLECTION" &&
                                        menuDataModel.menuItems![mainIndex]
                                                .items![index].resource !=
                                            null &&
                                        menuDataModel
                                                .menuItems![mainIndex]
                                                .items![index]
                                                .resource!["image"] !=
                                            null &&
                                        menuDataModel
                                                .menuItems![mainIndex]
                                                .items![index]
                                                .resource!["image"]["url"] !=
                                            null)
                                    ? menuDataModel
                                        .menuItems![mainIndex]
                                        .items![index]
                                        .resource!["image"]["url"] as String
                                    : "",
                                menuDataModel.menuItems![mainIndex].items![index].title!, () {
                              // if (menuDataModel.menuItems![mainIndex]
                              //     .items![index].resourceId!.isNotEmpty) {
                              String __typename = menuDataModel
                                              .menuItems![mainIndex]
                                              .items![index]
                                              .resource !=
                                          null &&
                                      menuDataModel.menuItems![mainIndex]
                                          .items![index].resource!
                                          .containsKey("__typename")
                                  ? menuDataModel.menuItems![mainIndex]
                                      .items![index].resource!["__typename"]
                                  : menuDataModel.menuItems![mainIndex]
                                      .items![index].type!; //"";
                              RouteGenerate.ManageUserClick(
                                  context, __typename, // tabItem.type!,
                                  data: menuDataModel
                                      .menuItems![mainIndex].items![index]);
                              // }
                            }),
                          ),
                        ),
                      ))
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppTheme.secondaryButtonBackground
                            // borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
                            // border: Border.all(
                            //     width: 1, color: AppTheme.borderColor!)
                            ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                        child: InkResponse(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  menuDataModel
                                      .menuItems![mainIndex].items![index].title
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: AppTheme.black,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        )),
                Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: RangeMaintainingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 140, //70,
                          mainAxisSpacing: 5, //20
                          crossAxisSpacing: 5, //20
                        ),
                        padding: EdgeInsets.fromLTRB(ThemeSize.paddingLeft, 5,
                            ThemeSize.paddingRight, 5),
                        itemCount: menuDataModel
                            .menuItems![mainIndex].items![index].items!.length,
                        itemBuilder: (context, state1) {
                          return AnimationConfiguration.synchronized(
                            duration: const Duration(milliseconds: 500),
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: CategoryItemForCollection(
                                    (menuDataModel.menuItems![mainIndex].items![index].items![state1].type!.toUpperCase() == "COLLECTION" &&
                                            menuDataModel
                                                    .menuItems![mainIndex]
                                                    .items![index]
                                                    .items![state1]
                                                    .resource !=
                                                null &&
                                            menuDataModel
                                                    .menuItems![mainIndex]
                                                    .items![index]
                                                    .items![state1]
                                                    .resource!["image"] !=
                                                null &&
                                            menuDataModel
                                                        .menuItems![mainIndex]
                                                        .items![index]
                                                        .items![state1]
                                                        .resource!["image"]
                                                    ["url"] !=
                                                null)
                                        ? menuDataModel
                                            .menuItems![mainIndex]
                                            .items![index]
                                            .items![state1]
                                            .resource!["image"]["url"] as String
                                        : "",
                                    menuDataModel
                                        .menuItems![mainIndex]
                                        .items![index]
                                        .items![state1]
                                        .title!, () {
                                  // if (menuDataModel
                                  //     .menuItems![mainIndex]
                                  //     .items![index]
                                  //     .items![state1]
                                  //     .resourceId!
                                  //     .isNotEmpty) {
                                  String __typename = menuDataModel
                                                  .menuItems![mainIndex]
                                                  .items![index]
                                                  .items![state1]
                                                  .resource !=
                                              null &&
                                          menuDataModel
                                              .menuItems![mainIndex]
                                              .items![index]
                                              .items![state1]
                                              .resource!
                                              .containsKey("__typename")
                                      ? menuDataModel
                                          .menuItems![mainIndex]
                                          .items![index]
                                          .items![state1]
                                          .resource!["__typename"]
                                      : menuDataModel.menuItems![mainIndex]
                                          .items![index].items![state1].type!;
                                  RouteGenerate.ManageUserClick(
                                      context, __typename,
                                      data: menuDataModel.menuItems![mainIndex]
                                          .items![index].items![state1]);
                                  // }
                                }),
                              ),
                            ),
                          );
                        }))
              ],
            );
          });
    }
  }
}
