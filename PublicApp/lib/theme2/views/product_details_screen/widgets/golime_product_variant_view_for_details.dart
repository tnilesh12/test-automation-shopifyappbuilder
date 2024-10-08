import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/option/option.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme2/utils/theme_size.dart';

class GoLimeProductVariantDetailsView extends StatefulWidget {
  final Product product;
  final ProductVariant selectedVariant;
  final bool AddToCartButton;

  final Function(ProductVariant, bool) onSelectApply;

  const GoLimeProductVariantDetailsView(this.product, this.selectedVariant,
      this.onSelectApply, this.AddToCartButton,
      {super.key});

  @override
  State<GoLimeProductVariantDetailsView> createState() =>
      _ProductVariantBottomSheetViewState();
}

bool notavailable = false;
String PriceOfProduct = "";

class _ProductVariantBottomSheetViewState
    extends State<GoLimeProductVariantDetailsView> {
  List<String> SelectedItemName = [];

  @override
  void initState() {
    super.initState();
    notavailable = widget.selectedVariant.availableForSale!;
    SelectedItemName = widget.selectedVariant.title.toString().split(" / ");
    PriceOfProduct = widget.selectedVariant.price!.formattedPrice;
  }

  @override
  Widget build(BuildContext context) {
    return VerticalItem(widget.product.option!);
  }

  Widget VerticalItem(List<Option> items) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // This next line does the trick.
      //scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 0 : 10.0),
                    child: Text(
                      item.name.toString(),
                      // style: TextStyle(
                      // fontSize:
                      //     Theme.of(context).textTheme.bodyMedium!.fontSize,
                      // color: AppTheme.black.withAlpha(120)
                      // ),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ))),
            Flexible(
                child: Container(
              height: 155, //40,
              child: HorizontalItem(item.values!, index),
            ))
          ],
        );
      },
    );
  }

  Widget HorizontalItem(List<String> option, int itemindex) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      itemCount: option.length,
      itemBuilder: (context, index) {
        bool selected = false;
        if (SelectedItemName[itemindex] != null) {
          selected = SelectedItemName[itemindex].trim().toLowerCase() ==
              option[index].toString().trim().toLowerCase();
        }

        return InkWell(
            onTap: () {
              SelectedItemName[itemindex] = option[index].toString();
              String title = SelectedItemName.join(" / ");
              // print(AppLocalizations.of(context)!.selected + title);

              for (int i = 0; i < widget.product.productVariants!.length; i++) {
                if (widget.product.productVariants![i].title.toString() ==
                    title) {
                  notavailable =
                      widget.product.productVariants![i].availableForSale!;
                  PriceOfProduct =
                      widget.product.productVariants![i].price!.formattedPrice;
                  widget.onSelectApply.call(widget.product.productVariants![i],
                      widget.AddToCartButton);
                  break;
                }
              }

              setState(() {});
            },
            child: Container(
              width: 160,
              margin: EdgeInsets.fromLTRB(index == 0 ? 0 : 4, 4, 4, 4),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeSize.themeBorderRadius),
                // color: selected
                //     ? AppTheme.primaryButtonBackground!
                //     : AppTheme.primaryButtonBackground!.withAlpha(60),
                border: Border.all(
                  color: selected
                      ? AppTheme.borderColor!
                      : AppTheme.borderColor!.withAlpha(60),
                  // AppTheme.borderColor!.withAlpha(50)
                ),
              ),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 30,
                      width: 100,
                      child: Image.asset(
                          (option[index].toString() == 'Go Flex' ||
                                  option[index].toString() == 'Monthly' ||
                                  option[index].toString() == 'Product Only')
                              ? "assets/images/go-flex.png"
                              : "assets/images/go-pay.png"),
                    ),

                    //  Text(option[index].toString(),
                    //     style: TextStyle(
                    //       // color: AppTheme.primaryButtonText,
                    //       fontSize:
                    //           Theme.of(context).textTheme.bodyMedium!.fontSize,
                    //       // color: AppTheme.black.withAlpha(120)
                    //     ))
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        (option[index].toString() == 'Go Flex' ||
                                option[index].toString() == 'Monthly' ||
                                option[index].toString() == 'Product Only')
                            ? "Your monthly price : "
                            : "Your fixed price including installation from : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: AppTheme.primaryButtonText,
                            fontSize: 10)),
                  ),
                  Text(
                      widget
                          .product.productVariants![index].price!.formattedPrice
                          .toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: AppTheme.primaryButtonText,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                          // color: AppTheme.priceTagColor!.withAlpha(120),
                          fontWeight: FontWeight.bold))
                ],
              ),
            ));
      },
    );
  }
}
