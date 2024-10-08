import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/product_filter_data.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/utils/theme_size.dart';
import '/views/shimmer/product_filter_shimmer_view.dart';
import '/views/widgets/common/custom_button.dart';
import '../../../views/product_filter/product_checkbox_common.dart';
import '../../../views/product_filter/bloc/product_filter_bloc.dart';
import '../../../views/product_filter/bloc/product_filter_state.dart';
import '../../../views/product_filter/product_range_filter.dart';
import 'bloc/product_filter_event.dart';
import 'product_filter_left_list.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class ProductFilterScreen extends StatelessWidget {
  String FilterHandle;
  ProductFilterScreen(this.FilterHandle, {super.key});

  int indexMain = 0;

  Widget ChangeData(ProductFilterData index) {
    switch (index.type) {
      case "LIST":
        return CheckboxVendor(index);
      case "PRICE_RANGE":
        return ProductRange(index);

      default:
        Text("");
    }
    return (Container(
      child: Text('dataaaa'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
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
          title: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageManager.translations()["Filters"],
                // AppLocalizations.of(context)!.filters,
                // style: TextStyle(color: AppTheme.white, fontSize: 20),
              ),
            ],
          )),
        ),
        body: BlocProvider(
            create: (context) => ProductFilterScreenBloc(FilterHandle),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      BlocBuilder<ProductFilterScreenBloc,
                          ProductFilterScreenState>(builder: (context, state) {
                        if (state is ProductFilterScreenStateLoaded) {
                          return Container(
                            width: 100,
                            child: ProductListLeft(state.obj, (index) {
                              context
                                  .read<ProductFilterScreenBloc>()
                                  .add(ProductFilterIndexClickEvent(index));
                            }),
                          );
                        } else {
                          return Container(
                            width: 100,
                            child: ProductFilterShimmerView()
                                .ProductFilterLeftView(),
                          );
                          //  Text(
                          //     LanguageManager.translations()["Data"]); //AppLocalizations.of(context)!.data);
                        }
                      }),
                      Container(
                        width: 1,
                        color: AppTheme.borderColor!.withAlpha(120),
                        // height: MediaQuery.of(context).size.width,
                      ),
                      BlocBuilder<ProductFilterScreenBloc,
                          ProductFilterScreenState>(builder: (context, state) {
                        if (state is ProductFilterScreenStateLoaded) {
                          return Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 110,
                              child: ChangeData(state.obje),
                            ),
                          );
                        } else {
                          return ProductFilterShimmerView()
                              .ProductFilterRightView(context);
                          //  Text(
                          //     LanguageManager.translations()["Data"]); //AppLocalizations.of(context)!.data);
                        }
                      }),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppTheme.white!.withAlpha(120),
                ),
                Container(
                  // flex: 2,
                  child: BlocBuilder<ProductFilterScreenBloc,
                      ProductFilterScreenState>(builder: (context, state) {
                    if (state is ProductFilterScreenStateLoaded) {
                      return Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(
                                  //     ThemeSize.themeBorderRadius),
                                  color: AppTheme.secondaryButtonBackground!,
                                  border: Border.all(
                                    color: AppTheme.borderColor!.withAlpha(50),
                                  ),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      globals.productFilterOptionValue =
                                          ProductFilterData("", [], [], "");
                                      context
                                          .read<ProductFilterScreenBloc>()
                                          .LoadData();
                                    },
                                    child: Text(
                                      LanguageManager.translations()["Reset"],
                                      style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize,
                                      ).copyWith(
                                          color: AppTheme.secondaryButtonText),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(
                                  //     ThemeSize.themeBorderRadius),
                                  color: AppTheme.primaryButtonBackground,
                                  border: Border.all(
                                    color: AppTheme.borderColor!.withAlpha(50),
                                  ),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      context.pop(true);
                                    },
                                    child: Text(
                                      LanguageManager.translations()["Apply"],
                                      style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize,
                                      ).copyWith(
                                          color: AppTheme.primaryButtonText),
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return ProductFilterShimmerView()
                          .ProductFilterButtonView(context);
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.45,
                      // );
                    }
                  }),
                ),
              ],
            )));
  }
}
