import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/boost_ai/boost_ai_model.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import '/theme2/utils/theme_size.dart';
import '/theme2/views/favorite/favorite_view.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/globels.dart' as globals;

class BoostAIProductGridView extends StatefulWidget {
  BoostAIProducts product;
  BuildContext context;

  Function(String) OnClick;
  Function(String)? OnRemove;

  BoostAIProductGridView(this.context, this.product, this.OnClick,
      {this.OnRemove});

  @override
  State<BoostAIProductGridView> createState() => _BoostAIProductGridViewState();
}

class _BoostAIProductGridViewState extends State<BoostAIProductGridView> {
  @override
  Widget build(BuildContext context) {
    //  print('--------------product grid view ${widget.product.images!.first.originalSrc}');

    return MultiBlocProvider(
        providers: [
          BlocProvider<AddToCartBloc>(
            create: (BuildContext context) => AddToCartBloc(),
          ),
          BlocProvider<StarWidgetBloc>(
            create: (BuildContext context) =>
                StarWidgetBloc(widget.product.id.toString()),
          ),
        ],
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
              // border: Border.all(
              //     width: 0.5, color: AppTheme.borderColor! //.lightBorder
              //     )
            ),
            // margin: EdgeInsets.all(2),
            // padding: EdgeInsets.all(0),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ThemeSize.themeBorderRadius),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height:
                              ThemeSize.productGridAspectRatio(type: "Image"),
                          //  DashboardFontSize.imageHeightForProductCell( context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ThemeSize.themeBorderRadius),
                            child: WidgetImage(
                              widget.product.imagesInfo!.first.src.toString(),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                            ),
                          )),
                      //widget.product.images!.length!=0 ? widget.product.images!.first.originalSrc! : "")),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // padding: EdgeInsets.fromLTRB(6, 5, 6, 0),
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.product.title.toString(),
                                maxLines: 2,
                                style: CustomTextTheme.getTextStyle(
                                    MyTextStyle.ProductGridViewCardTitle,
                                    context),
                                // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                //     color: Colors.black, )
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(
                              //     // left: ThemeSize.paddingLeft,
                              //     // right: ThemeSize.paddingRight,
                              //     top: 1),
                              child: PluginStarWidgetMain(
                                  widget.product.id.toString()
                                      .replaceAll("gid://shopify/Product/", "")
                                      .toString(),
                                  (url) {}),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        LanguageManager.translations()[
                                            'From']!, //AppLocalizations.of(context)!.from,

                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.ProductGridViewCardFrom,
                                            context),
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodySmall!
                                        //     .copyWith(
                                        //         color: Colors.black.withAlpha(120),
                                        //         fontSize: 12,
                                        //         )
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      padding: EdgeInsets.all(0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // widget.product.formattedPrice,
                                        AppConfig.showMaxPriceOnProductGrid
                                            ? widget.product.priceMax.toString()
                                            : widget.product.priceMin
                                                .toString(),
                                        style: CustomTextTheme.getTextStyle(
                                            MyTextStyle
                                                .ProductGridViewCardPrice,
                                            context),
                                        // style: Theme.of(context)
                                        //     .textTheme
                                        //     .bodyMedium!
                                        //     .copyWith(
                                        //         color: Colors.red,
                                        //         fontWeight: FontWeight.bold,
                                        //         )
                                      ),
                                    ),
                                  ],
                                )
                                /*        BlocListener<AddToCartBloc, AddToCartState>(
                                  listener: (context, state) {
                                    if (state is AddToCartSuccessState) {
                                      context
                                          .read<CartBloc>()
                                          .CartCountUpdate();
                                      if (globals.Settings.containsKey(
                                          SettingsEnum
                                              .Auto_Navigate_To_Cart_Page
                                              .name)) {
                                        context.push("/${Routes.cartScreen}");
                                      } else {
                                        Dialogs.SuccessAlertInOut(
                                            context: context,
                                            message: LanguageManager
                                                    .translations()[
                                                'Itemaddedincart']!); // AppLocalizations.of(context)!.itemaddedincart);
                                      }
                                    }
                                  },
                                  child: BlocBuilder<AddToCartBloc,
                                      AddToCartState>(
                                    builder: (context1, state) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppTheme
                                              .primaryButtonBackground!
                                              .withAlpha(100),
                                          border: Border.all(
                                            color: AppTheme.borderColor!
                                                .withAlpha(50),
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: InkWell(
                                          onTap: () {
                                            ProductVariantsView(
                                                    widget.product,
                                                    widget.product
                                                        .productVariants!.first,
                                                    (item,
                                                        AddToCartButton) async {
                                              print(
                                                  "---${widget.product.sellingPlanGroups}-----$item-------$AddToCartButton--------------");
                                              // context.read<AddToCartBloc>().add(
                                              //     OnAddToCartButtonClick(
                                              //         item.id!));
                                              widget.product.sellingPlanGroups != null &&
                                                      globals.plugins.containsKey(
                                                          PluginsEnum
                                                              .ITGEEKS_EASY_SUBSCRIPTION
                                                              .name)
                                                  ? showModalBottomSheet(
                                                      context: context,
                                                      isScrollControlled: true,
                                                      builder: (context) =>
                                                          EasySubscriptionView(
                                                              widget.product, item,
                                                              (selectedOption,
                                                                  sellingPlan) {
                                                            // debugPrint(
                                                            //     "--------------------------------------callback--------selectedOption---${selectedOption}-----selectedValueId---${sellingPlan!.id}----");
                                                            selectedOption ==
                                                                        1 ||
                                                                    sellingPlan!
                                                                            .id ==
                                                                        null
                                                                ? context1
                                                                    .read<
                                                                        AddToCartBloc>()
                                                                    .add(OnAddToCartButtonClick(
                                                                        item
                                                                            .id!))
                                                                : context1
                                                                    .read<
                                                                        AddToCartBloc>()
                                                                    .add(OnAddToCartButtonClick(
                                                                        item
                                                                            .id!,
                                                                        sellingPlanId:
                                                                            sellingPlan.id));
                                                          }))
                                                  : context1
                                                      .read<AddToCartBloc>()
                                                      .add(OnAddToCartButtonClick(
                                                          item.id!));
                                              // Dialogs.SuccessAlertInOut(
                                              //     context: context,
                                              //     message: "Item added in cart");
                                            }, true)
                                                .ShowBottomSheet(context);
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(6, 4, 6, 4),
                                            child: Text(
                                              LanguageManager.translations()[
                                                  'AddtoCart']!, // AppLocalizations.of(context)!.addtocart,
                                              style: CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .ProductGridViewCardCart,
                                                      context)
                                                  .copyWith(
                                                      color: AppTheme
                                                          .primaryButtonText),
                                              // style: Theme.of(context)
                                              //     .textTheme
                                              //     .bodySmall!
                                              //     .copyWith(
                                              //         color: Colors.white,
                                              //         fontWeight: FontWeight.bold,
                                              //         fontSize: 10,
                                              //         )
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          */
                              ],
                            )
                          ],
                        ),
                      )
                    ])),
          ),
          Positioned(
              top: 6,
              right: 6,
              child:
                  FavoriteView(widget.product.id.toString(), 20, (productId) {
                widget.OnClick(widget.product.id.toString());
              }, OnRemove: (String p) {
                widget.OnRemove!(p);
              })),
        ]));
  }
}
