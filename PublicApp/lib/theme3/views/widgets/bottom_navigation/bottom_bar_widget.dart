import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../../utils/theme_size.dart';

class BottomBarWidget extends StatefulWidget {
  DashboardDataItems dashboardDataItems;
  int selectedIndex;
  final Function(BottomNavigationData bottomNavigationData, int selectedIndex)
      onTabChange;

  BottomBarWidget(this.dashboardDataItems, this.selectedIndex,
      {Key? key, required this.onTabChange})
      : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).bottomNavigationBarTheme.backgroundColor;
    // final selectedColor =
    //     Theme.of(context).bottomNavigationBarTheme.selectedItemColor;
    final unSelectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    // print("----------------------bottom bar ${widget.list}");

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: unSelectedColor!.withOpacity(0.5),
            blurRadius: 0.4,
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child:
              /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            
                ...List.generate(
                    widget.list.length,
                    (index) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              //  onItemSelected(index)
                              setState(() {
                                selectedIndex = index;
                                // widget.onTabChange(item); //widget.bottomBarBlockData.bottomBarItems![index]);
                              });

                              widget.onTabChange(widget.list[
                                  index]); // widget.bottomBarBlockData.bottomBarItems![index]);
                            },
                            child: _ItemWidget(
                              // bottomBarBlockData: widget.bottomBarBlockData,
                              item: widget.list[index], // item,
                              isSelected: index == selectedIndex,
                              backgroundColor: bgColor!,
                              selectedColor: selectedColor,
                              unSelectedColor: unSelectedColor!,
                            ),
                          ),
                        ))
              ],
            )
*/
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: widget.list.length,
              //   scrollDirection: Axis.horizontal,
              //   itemBuilder: (context, index) {
              //     var item = widget.list[index];
              //   return GestureDetector(
              //       onTap: () {
              //         //  onItemSelected(index)
              //         setState(() {
              //           selectedIndex = index;
              //           widget.onTabChange(item); //widget.bottomBarBlockData.bottomBarItems![index]);
              //         });
              //         widget.onTabChange(item);// widget.bottomBarBlockData.bottomBarItems![index]);
              //       },
              //       child: _ItemWidget(
              //         // bottomBarBlockData: widget.bottomBarBlockData,
              //         item: item,
              //         isSelected: index == selectedIndex,
              //         backgroundColor: bgColor,
              //         selectedColor: selectedColor,
              //         unSelectedColor: unSelectedColor,
              //       ),
              //     );
              // },)

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                widget.dashboardDataItems.bottomNavigationData!.map((item) {
              // children: widget.list!.forEach((item) {
              var index =
                  widget.dashboardDataItems.bottomNavigationData!.indexOf(item);
              bool isCenterItem = index ==
                  widget.dashboardDataItems.bottomNavigationData!.length ~/ 2;
              if (isCenterItem) {
                // return Expanded(child: SizedBox.shrink());
                return Container(
                  width: MediaQuery.of(context).size.width / 7,
                );
              }
              return Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.5),
                  child: GestureDetector(
                    onTap: () {
                      //  onItemSelected(index)
                      // setState(() {
                      // widget.selectedIndex = index;
                      widget.onTabChange(
                          widget
                              .dashboardDataItems.bottomNavigationData![index],
                          index);
                      // });

                      // widget.onTabChange(
                      //     item); // widget.bottomBarBlockData.bottomBarItems![index]);
                    },
                    child: _ItemWidget(
                      bottomNavigationData: item!,
                      isSelected: index == widget.selectedIndex,
                      backgroundColor: bgColor!,
                      selectedColor: unSelectedColor!,
                      unSelectedColor: unSelectedColor!,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final bool isSelected;
  // final dynamic item;
  final BottomNavigationData bottomNavigationData;
  final Color backgroundColor;
  // final dynamic bottomBarBlockData;
  final Color selectedColor;
  final Color unSelectedColor;

  const _ItemWidget(
      {super.key,
      // required this.bottomBarBlockData,
      required this.bottomNavigationData,
      required this.isSelected,
      required this.backgroundColor,
      required this.selectedColor,
      required this.unSelectedColor});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        // width: isSelected ? 130 : 50,
        height: double.maxFinite,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          // color: isSelected
          //     ? AppTheme
          //         .bottomNavigationSelectedBackgroundColor // selectedColor.withOpacity(0.2)
          //     : AppTheme
          //         .bottomNavigationUnSelectedBackgroundColor, // backgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
        ),
        child: Container(
          // width: isSelected ? 50 : 50,
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                    size: 24,
                    color: isSelected
                        ? selectedColor.withOpacity(1.0)
                        : unSelectedColor),
                child: SvgPicture.string(bottomNavigationData.iconSrc!,
                    colorFilter: ColorFilter.mode(
                        isSelected
                            ? selectedColor
                            : unSelectedColor.withAlpha(150),
                        BlendMode.srcIn)),
              ),
              // if (isSelected)
              // Expanded(
              //   child:
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: DefaultTextStyle.merge(
                    // style: TextStyle(
                    //   color: selectedColor,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    child: Text(
                      bottomNavigationData.title!,
                      style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? selectedColor //.withOpacity(1.0)
                              : unSelectedColor,
                          fontSize: 9),
                    )),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
