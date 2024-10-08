import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/route/go_routes.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import 'package:publicapp/common/bloc/category_screen_bloc/category_screen_bloc.dart';

class CategoryRowViewLeftFromMenu extends StatefulWidget {
  final MenuDataModel menuDataModel;
  CategoryRowViewLeftFromMenu({super.key, required this.menuDataModel});

  @override
  State<CategoryRowViewLeftFromMenu> createState() =>
      _CategoryRowViewLeftFromMenuState();
}

class _CategoryRowViewLeftFromMenuState
    extends State<CategoryRowViewLeftFromMenu> {
  int selectedIndex = 0;

  selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = context.read<CategoryScreenBloc>().changeStyle ?? 0;
    return BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
        builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: AppTheme.secondaryButtonBackground,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.menuDataModel.menuItems!.length,
            itemBuilder: (context, index) {
              bool hasBottomRightRadius = false;
              bool hasTopRightRadius = false;

              if (index == selectedIndex - 1) {
                // Item above the selected item
                hasBottomRightRadius = true;
              } else if (index == selectedIndex + 1) {
                // Item below the selected item
                hasTopRightRadius = true;
              }
              return Container(
                  decoration: BoxDecoration(
                    color: selectedIndex != index
                        ? AppTheme.white //!.withAlpha(120)
                        : AppTheme.secondaryButtonBackground,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: hasTopRightRadius
                          ? Radius.circular(12.0)
                          : Radius.zero,
                      bottomRight: hasBottomRightRadius
                          ? Radius.circular(12.0)
                          : Radius.zero,
                    ),
                    child: InkResponse(
                      child: Container(
                        decoration: BoxDecoration(
                          // border: index != selectedIndex
                          //     ? Border.symmetric(
                          //         horizontal: BorderSide(
                          //             width: index == selectedIndex ? 0 : 1,
                          //             color:
                          //                 AppTheme.borderColor!.withAlpha(120)),
                          //         vertical: BorderSide(
                          //             width: index == selectedIndex ? 0 : 1,
                          //             color:
                          //                 AppTheme.borderColor!.withAlpha(120)))
                          //     : null,
                          borderRadius: BorderRadius.only(
                            topRight: hasTopRightRadius
                                ? Radius.circular(12.0)
                                : Radius.zero,
                            bottomRight: hasBottomRightRadius
                                ? Radius.circular(12.0)
                                : Radius.zero,
                          ),
                          color:
                              context.read<CategoryScreenBloc>().changeStyle ==
                                      index
                                  ? AppTheme.white //!.withAlpha(120)
                                  : AppTheme.secondaryButtonBackground,
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                                child: Container(
                              height: 40,
                              width: 40,
                              child: WidgetImage(
                                  (widget.menuDataModel.menuItems![index].type!
                                                  .toUpperCase() ==
                                              "COLLECTION" &&
                                          widget.menuDataModel.menuItems![index]
                                                  .resource !=
                                              null &&
                                          widget.menuDataModel.menuItems![index]
                                                  .resource!["image"] !=
                                              null &&
                                          widget.menuDataModel.menuItems![index]
                                                  .resource!["image"]["url"] !=
                                              null)
                                      ? widget.menuDataModel.menuItems![index]
                                          .resource!["image"]["url"] as String
                                      : "",
                                  fit: BoxFit.cover),
                            )),
                            Text(
                                widget.menuDataModel.menuItems![index].title
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall!),
                          ],
                        ),
                      ),
                      onTap: () {
                        selectedTab(index);
                        if (widget
                            .menuDataModel.menuItems![index].items!.isEmpty) {
                          String type =
                              widget.menuDataModel.menuItems![index].type!;
                          RouteGenerate.ManageUserClick(context, type,
                              data: widget.menuDataModel.menuItems![index]);
                        } else {
                          context
                              .read<CategoryScreenBloc>()
                              .add(OnCategoryItemClick(index));
                        }
                      },
                    ),
                  ));
            }),
      );
    });
  }
}
