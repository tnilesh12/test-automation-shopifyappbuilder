import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import '/theme2/utils/theme_size.dart';
import '/theme2/views/widgets/product_list_widgets.dart';

class RelatedProductViewWidget extends StatelessWidget {
  String title;
  Function() OnViewAllClick;
  List<Product> list;
  String id;

  RelatedProductViewWidget(this.title, this.OnViewAllClick, this.list, this.id,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   child: InkWell(
              //     // onTap: OnViewAllClick,
              //     onTap: () async {
              //       if (id.isNotEmpty) {
              //         ProductListScreen productListScreen =
              //             ProductListScreen(id!, title!);
              //         context.push("/${Routes.productListScreen}",
              //             extra: productListScreen);
              //       }
              //     },
              //     child: Text(
              //       "See All",
              //       style: Theme.of(context).textTheme.titleSmall,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(
              top: ThemeSize.paddingLeft,
              // right: ThemeSize.paddingRight
            ),
            child: ProductListWidgets(context, list)),
      ],
    );
  }
}
