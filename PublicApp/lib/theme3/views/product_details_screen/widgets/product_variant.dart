import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../../utils/theme_size.dart';
import '/theme3/views/product_details_screen/widgets/product_variant_bottomsheet.dart';

class ProductVariantsView extends StatelessWidget {
  final Product product;
  final ProductVariant selectedVariant;
  final bool AddToCartButton;

  final Function(ProductVariant, bool) onSelectApply;
  // bool notavailable = false;

  ProductVariantsView(this.product, this.selectedVariant, this.onSelectApply,
      this.AddToCartButton,
      {super.key}) {}

  List<Widget> GetVariant(BuildContext context, Product p) {
    List<Widget> widgets = [];
    if (p.option!.length != 0) {
      for (int i = 0; i < p.option!.length; i++) {
        widgets.add(InkWell(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.borderColor!,
                  ),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(
                      Radius.circular(ThemeSize.themeBorderRadius))),
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(p.option![i].name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            // fontFamily: 'Cinzel',
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            // color: AppTheme.black.withAlpha(120)
                          ))),
                  const Spacer(),
                  Text(
                      selectedVariant.selectedOptions!.length != 0
                          ? selectedVariant.title!
                              .split(" / ")[i]
                              .toString()
                              .trim()
                          : "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // fontFamily: 'Cinzel',
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        // color: AppTheme.black.withAlpha(120)
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.navigate_next,
                    size: 15, //color: AppTheme.black
                  ),
                ],
              )),
          onTap: () {
            ShowBottomSheet(context);
          },
        ));
      }
    } else {
      Text("");
    }
    return widgets;
  }

  ShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ProductVariantBottomSheetView(
            product, selectedVariant, onSelectApply, AddToCartButton);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: GetVariant(context, product),
    );
  }
}
