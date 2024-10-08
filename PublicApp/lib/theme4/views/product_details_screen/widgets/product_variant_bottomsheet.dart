import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/option/option.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/modelClass/src/product/product_variant/product_variant.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../../utils/theme_size.dart';

class ProductVariantBottomSheetView extends StatefulWidget {
  final Product product;
  final ProductVariant selectedVariant;
  final bool AddToCartButton;

  final Function(ProductVariant, bool) onSelectApply;

  const ProductVariantBottomSheetView(this.product, this.selectedVariant,
      this.onSelectApply, this.AddToCartButton,
      {super.key});

  @override
  State<ProductVariantBottomSheetView> createState() =>
      _ProductVariantBottomSheetViewState();
}

bool notavailable = false;
String priceOfProduct = "";

class _ProductVariantBottomSheetViewState
    extends State<ProductVariantBottomSheetView> {
  List<String> SelectedItemName = [];

  @override
  void initState() {
    super.initState();
    notavailable = widget.selectedVariant.availableForSale!;
    SelectedItemName = widget.selectedVariant.title.toString().split(" / ");
    priceOfProduct = widget.selectedVariant.price!.formattedPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                widget.product.title.toString(),
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.product.vendor.toString(),
                style: TextStyle(
                  // fontFamily: 'Cinzel',
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                  // color: AppTheme.black
                ),
              )),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                priceOfProduct,
                style: TextStyle(
                    // fontFamily: 'Cinzel',
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                    color: AppTheme.priceTagColor),
              )),
          notavailable == false
              ? Container(
                  decoration: BoxDecoration(
                      color: AppTheme.errorColor!.withAlpha(50),
                      border: Border.all(
                        color: AppTheme.errorColor!.withAlpha(50),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(ThemeSize.themeBorderRadius))),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    LanguageManager.translations()["NotAvailable"],
                    // AppLocalizations.of(context)!.not_available,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      // color: AppTheme.errorColor
                    ),
                  ))
              : Container(
                  decoration: BoxDecoration(
                      color: AppTheme.successColor!.withAlpha(50),
                      border: Border.all(
                        color: AppTheme.successColor!.withAlpha(50),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(ThemeSize.themeBorderRadius))),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    LanguageManager.translations()["Available"],
                    // AppLocalizations.of(context)!.available,
                    style: TextStyle(
                      // fontFamily: 'Cinzel',
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                      // color: AppTheme.successColor
                    ),
                  ),
                ),
          Flexible(child: VerticalItem(widget.product.option!)),
          SizedBox(
            height: 20,
          ),
          Container(
            color: AppTheme.primaryColor,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                     margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                                                color: AppTheme
                                                    .primaryButtonBackground!,
                                               borderRadius:
                                                    BorderRadius.circular(
                                                        ThemeSize.themeBorderRadius)
                                                // border: Border.all(
                                                //   color: AppTheme.borderColor!.withAlpha(50),
                                                // ),
                                                ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          LanguageManager.translations()["Close"],
                          // AppLocalizations.of(context)!.close,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontSize,
                            // color: AppTheme.black
                          ).copyWith(color: AppTheme.primaryButtonText),
                        )),
                  ),
                ),
                notavailable
                    ? Container(
                        alignment: Alignment.center,
                                          margin: EdgeInsets.all(10.0),
                      child: InkWell(
                        
                            onTap: (){
                               String title = SelectedItemName.join(" / ");
                      
                                  for (int i = 0;
                                      i < widget.product.productVariants!.length;
                                      i++) {
                                    if (widget.product.productVariants![i].title
                                            .toString() ==
                                        title) {
                                      Navigator.of(context).pop();
                                      widget.onSelectApply.call(
                                          widget.product.productVariants![i],
                                          widget.AddToCartButton);
                                      break;
                                    }
                                  }
                            },
                      
                             child: CircleAvatar(
                                                  maxRadius: 20,
                                                  backgroundColor: AppTheme
                                                      .productGridBuyNowBackgroundColor, // Colors.green,
                                                  //Utils.getColorFromHex(buyNowBackgroundColor),
                                                  child: Icon(
                                                    size: 15,
                                                    Icons.add,
                                                    color: AppTheme
                                                        .productGridBuyNowForegroundColor,
                                                  ) //Utils.getColorFromHex( buyNowForegroundColor)),
                                                  ),
                          ),
                    )
                    
                        
                      //    TextButton(
                           
                           
                      //       child: Text(
                      //         widget.AddToCartButton
                      //        //AppLocalizations.of(context)!.apply,
                      //         style: TextStyle(
                      //           // fontFamily: 'Cinzel',
                      //           fontSize: Theme.of(context)
                      //               .textTheme
                      //               .titleMedium!
                      //               .fontSize,
                      //         ).copyWith(color: AppTheme.primaryButtonText),
                      //       )),
                      // )
                   
                    /* Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.primaryButtonBackground,
                            // border: Border.all(
                            //   color: AppTheme.borderColor!.withAlpha(50),
                            // ),
                          ),
                          child: TextButton(
                              onPressed: () {
                                String title = SelectedItemName.join(" / ");

                                for (int i = 0;
                                    i < widget.product.productVariants!.length;
                                    i++) {
                                  if (widget.product.productVariants![i].title
                                          .toString() ==
                                      title) {
                                    Navigator.of(context).pop();
                                    widget.onSelectApply.call(
                                        widget.product.productVariants![i],
                                        widget.AddToCartButton);
                                    break;
                                  }
                                }
                              },
                              child: Text(
                                widget.AddToCartButton
                                    ? LanguageManager.translations()[
                                        "add"] // AppLocalizations.of(context)!.addtocart
                                    : LanguageManager.translations()[
                                        "Apply"], //AppLocalizations.of(context)!.apply,
                                style: TextStyle(
                                  // fontFamily: 'Cinzel',
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .fontSize,
                                ).copyWith(color: AppTheme.primaryButtonText),
                              )),
                        ),
                      )*/
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget VerticalItem(List<Option> items) {
    return ListView.builder(
      // This next line does the trick.
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: ThemeSize.paddingLeft,
                        right: ThemeSize.paddingRight,
                        top: 5.0),
                    child: Text(
                      item.name.toString(),
                      style: Theme.of(context).textTheme.bodySmall!,
                    ))),
            Flexible(
                child: Container(
              padding: EdgeInsets.only(left: 6.0),
              height: 40,
              child: HorizontalItem(item.values!, index),
            ))
          ],
        );
      },
    );
  }

  Widget HorizontalItem(List<String> option, int itemindex) {
    return ListView.builder(
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
              print("selected..." + title);

              for (int i = 0; i < widget.product.productVariants!.length; i++) {
                if (widget.product.productVariants![i].title.toString() ==
                    title) {
                  notavailable =
                      widget.product.productVariants![i].availableForSale!;
                  priceOfProduct =
                      widget.product.productVariants![i].price!.formattedPrice;
                  break;
                }
              }
              setState(() {});
            },
            child: Container(
              // width: 60,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeSize.themeBorderRadius),
                // color: selected
                //     ? AppTheme.primaryButtonBackground!
                //     : AppTheme.primaryButtonBackground!.withAlpha(60),
                border: Border.all(
                  color: selected
                      ? AppTheme.borderColor!
                      : AppTheme.borderColor!
                          .withAlpha(60), //AppTheme.borderColor!.withAlpha(50),
                ),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Text(option[index].toString(),
                      style: TextStyle(
                        // fontFamily: 'Cinzel',
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        // color: AppTheme.primaryButtonText,
                      ))),
            ));
      },
    );
  }
}
