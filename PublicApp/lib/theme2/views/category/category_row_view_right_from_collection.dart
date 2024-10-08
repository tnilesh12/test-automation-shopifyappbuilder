import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/util/routes.dart';

class CategoryRowViewRightFromCollection extends StatelessWidget {
  final List<Collection> menus;

  CategoryRowViewRightFromCollection({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: menus!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppTheme.white!.withAlpha(120),
                      border: Border.all(
                          width: 1, color: AppTheme.white!.withAlpha(120))),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: InkResponse(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 7, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            menus[index].title.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 70,
                      ),
                      padding: EdgeInsets.only(right: 20, left: 20.0),
                      itemCount: menus!.length,
                      itemBuilder: (context, state1) {
                        return InkWell(
                          onTap: () {
                            if (menus[state1].id!.isNotEmpty) {
                              context.push("/${Routes.productListScreen}");
                              // Navigator.pushNamed(
                              //     context, RouteGenerate.productListScreen,
                              //     arguments: {
                              //       menus[state1].id,
                              //       menus[state1].title
                              //     });
                            }
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              AppTheme.white!.withAlpha(120))),
                                  alignment: Alignment.center,
                                  child: Text(
                                    menus[state1].title.toString(),
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                    ),
                                    softWrap: true,
                                  ),
                                )
                              ]),
                        );
                      }))
            ],
          );
        });
  }
}
