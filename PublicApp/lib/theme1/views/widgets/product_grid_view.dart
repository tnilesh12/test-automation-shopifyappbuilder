import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_event.dart';
import 'package:publicapp/common/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/plugins_enum.dart';
import 'package:shopify_code/util/routes.dart';
import '../../utils/theme_size.dart';
import '../../../common/bloc/cart_count_bloc/cart_bloc.dart';
import '/theme1/views/favorite/favorite_view.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme1/views/product_details_screen/widgets/easy_subscription_view.dart';
import '/theme1/views/product_details_screen/widgets/product_variant.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:go_router/go_router.dart';

class ProductGridView extends StatefulWidget {
  Product product;
  BuildContext context;

  Function(String) OnClick;
  Function(String)? OnRemove;

  ProductGridView(this.context, this.product, this.OnClick, {this.OnRemove});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  // int selectedOption = 1;
  // String? dropdownvalue;
  // SellingPlanListNodes? sellingPlan;

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
                StarWidgetBloc(widget.product.id!),
          ),
        ],
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ThemeSize.themeBorderRadius),
              // border: Border.all(
              //     width: 0.5, color: AppTheme.borderColor!
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
                                widget.product.image!,
                                fit: AppConfig.imageFit,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                              ))),
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
                                  widget.product.id!
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
                                        LanguageManager.translations()['From']!,
                                        //AppLocalizations.of(context)!.from,
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
                                ),
                                BlocListener<AddToCartBloc, AddToCartState>(
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
                                        // margin: EdgeInsets.only(right: 10),
                                        // padding: EdgeInsets.symmetric(horizontal: 10),
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              ThemeSize.themeBorderRadius),
                                          // color: AppTheme
                                          //     .primaryButtonBackground!
                                          //     .withAlpha(100),
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
                                              //  /*
                                              // print(
                                              //     "widget.product.sellingPlanGroups   ${widget.product.sellingPlanGroups!.length}");
                                              // print(
                                              //     "widget.product.sellingPlanGroups   ${globals.plugins.containsKey(PluginsEnum.ITGEEKS_EASY_SUBSCRIPTION.name)}");

                                              widget.product.sellingPlanGroups !=
                                                          null &&
                                                      widget
                                                          .product
                                                          .sellingPlanGroups!
                                                          .isNotEmpty &&
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
                                                                  sellingPlan, attribute) {
                                                            context.pop(true);
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
                                                      .add(OnAddToCartButtonClick(item.id!));
                                              // Dialogs.SuccessAlertInOut(
                                              //     context: context,
                                              //     message: "Item added in cart");
                                            }, true)
                                                .ShowBottomSheet(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 4, 15, 4),
                                            child: Text(
                                              LanguageManager.translations()[
                                                  'AddtoCart']!,
                                              style: CustomTextTheme.getTextStyle(
                                                      MyTextStyle
                                                          .ProductGridViewCardCart,
                                                      context)
                                                  .copyWith(
                                                      // color: AppTheme
                                                      //     .primaryButtonText
                                                      ),
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
              child: FavoriteView(widget.product.id!, 20, (productId) {
                widget.OnClick(widget.product.id!);
              }, OnRemove: (String p) {
                widget.OnRemove!(p);
              })),
        ]));
  }
}
