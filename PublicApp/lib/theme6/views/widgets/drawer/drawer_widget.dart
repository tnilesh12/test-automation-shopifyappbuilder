import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/modelClass/menu_data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../utils/theme_size.dart';

class DrawerWidget extends StatefulWidget {
  // final Function(DrawerBarItems drawerBarItems) onTabChange;
  // final Function(DrawerBarItems drawerBarItems) onTabChange;
  final Function(MenuItems drawerBarItems, int selectedIndex,
      int subSelectedIndex, int nestedSelectedIndex) onTabChange;
  final Function(MenuItems drawerBarItems) changeRoute;
  // dynamic list;
  MenuDataModel menuDataModel;
  int subSelectedIndex;
  int selectedIndex;
  int nestedSelectedIndex;
  GlobalKey<ScaffoldState> _scaffoldKey;

  DrawerWidget(this._scaffoldKey, this.selectedIndex, this.subSelectedIndex,
      this.nestedSelectedIndex, this.menuDataModel,
      {Key? key, required this.onTabChange, required this.changeRoute})
      : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // bool isExpanded = false;
  // bool isSubExpanded = false;
  // int widget.subSelectedIndex = -1;
  // int selectedIndex = -1;
  // int widget.nestedSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // DrawerBlockData drawerBlockData = widget.appThemeBlockData.drawerBlockData!;
    print(
        '\nopennnnn\nselectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');

    return Container(
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      // padding: const EdgeInsets.all(25),
      child: Drawer(
        backgroundColor: AppTheme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          ),
        ),
        // backgroundColor: AppTheme.drawerMenuBackgroundColor,// Color.fromARGB(255, 249, 248, 251),// Color.fromARGB(255, 15, 2, 68),
        // backgroundColor: Util.getColorFromHex(widget.appThemeBlockData.appBackgroundColor!),
        // child: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Column(
            // physics: NeverScrollableScrollPhysics(),
            // padding: EdgeInsets.all(30),
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 170,
                padding: EdgeInsets.all(5),
                color: AppTheme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ClipOval(
                    //     child: Image.network(
                    //   globals.partnerInfoModel.appSettings!.appIconSrc!,
                    //   height: 70,
                    //   width: 70,
                    //   fit: BoxFit.cover,
                    // )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: WidgetImage(
                              globals.partnerInfoModel.appSettings != null
                                  ? globals
                                      .partnerInfoModel.appSettings!.appIconSrc!
                                  : "")),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                            globals.partnerInfoModel.appSettings != null
                                ? globals.partnerInfoModel.appSettings!.appName!
                                : globals.partnerInfoModel.name != null
                                    ? globals.partnerInfoModel.name!
                                    : "",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: AppTheme.appBarTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              // Divider(
              //   height: 3,
              // ),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  color: AppTheme.drawerMenuBackgroundColor,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.menuDataModel.menuItems!.map((item) {
                        var index =
                            widget.menuDataModel.menuItems!.indexOf(item);
                        return Column(
                          children: [
                            Container(
                              color: AppTheme.drawerMenuBackgroundColor,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  // color: widget.selectedIndex == index
                                  color: widget.selectedIndex == index &&
                                          widget.subSelectedIndex == -1 &&
                                          widget.nestedSelectedIndex == -1
                                      ? AppTheme
                                          .drawerSelectedBackgroundColor //  Color.fromARGB(255, 95, 189, 230) //Util.getColorFromHex(drawerBlockData.selectedBackgroundColor!)
                                      : AppTheme
                                          .drawerUnSelectedBackgroundColor, //,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          ThemeSize.themeBorderRadius)),
                                ),
                                child: ListTile(
                                  // leading: SvgPicture.string(
                                  //     item.icon ??
                                  //         '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle cx="12" cy="12" r="2" fill="#000000"></circle> </g></svg>',
                                  //     colorFilter: ColorFilter.mode(
                                  //         widget.selectedIndex == index &&
                                  //                 widget.subSelectedIndex ==
                                  //                     -1 &&
                                  //                 widget.nestedSelectedIndex ==
                                  //                     -1
                                  //             ? AppTheme
                                  //                 .drawerSelectedTextColor! //Colors.white
                                  //             : AppTheme
                                  //                 .drawerUnSelectedTextColor!, //Colors.grey.shade700,
                                  //         BlendMode.srcIn)),
                                  leading: item.icon != ""
                                      ? SvgPicture.string(
                                          item.icon ??
                                              '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle cx="12" cy="12" r="2" fill="#000000"></circle> </g></svg>',
                                          colorFilter: ColorFilter.mode(
                                              widget.selectedIndex == index &&
                                                      widget.subSelectedIndex ==
                                                          -1 &&
                                                      widget.nestedSelectedIndex ==
                                                          -1
                                                  ? AppTheme
                                                      .drawerSelectedTextColor! //Colors.white
                                                  : AppTheme
                                                      .drawerUnSelectedTextColor!, //Colors.grey.shade700,
                                              BlendMode.srcIn))
                                      : null,
                                  title: Text(
                                    item.title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: widget.selectedIndex ==
                                                      index &&
                                                  widget.subSelectedIndex ==
                                                      -1 &&
                                                  widget.nestedSelectedIndex ==
                                                      -1
                                              ? AppTheme
                                                  .drawerSelectedTextColor //Colors.white
                                              : AppTheme
                                                  .drawerUnSelectedTextColor, //Colors.grey.shade700,
                                        ),
                                  ),
                                  trailing:
                                      // item.subDrawerBarItems != null &&
                                      //         item.subDrawerBarItems!.isNotEmpty
                                      // item.containsKey('subMenu')&&
                                      item.items != null &&
                                              item.items!.isNotEmpty &&
                                              Utils.checkPlan(
                                                  globals.partnerInfoModel
                                                      .planName!
                                                      .toUpperCase(),
                                                  "ESSENTIALS") //"PRO")
                                          ? Container(
                                              padding: EdgeInsets.all(2.0),
                                              child: Transform.rotate(
                                                angle:
                                                    //  isExpanded &&
                                                    widget.selectedIndex ==
                                                            index
                                                        ? 1.5708
                                                        : 0.0, // 90 degrees in radians
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 20,
                                                  color: widget.selectedIndex ==
                                                              index &&
                                                          widget.subSelectedIndex ==
                                                              -1 &&
                                                          widget.nestedSelectedIndex ==
                                                              -1
                                                      ? AppTheme
                                                          .drawerSelectedTextColor
                                                      : AppTheme
                                                          .drawerUnSelectedTextColor,
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                  onTap: () {
                                    print(
                                        'you have clicked expanded 1st level');
                                    //  onItemSelected(index)
                                    // setState(() {
                                    // if (item.subDrawerBarItems != null &&
                                    //     item.subDrawerBarItems!.isNotEmpty) {
                                    // if (item.containsKey('subMenu') && selectedIndex==index) {
                                    //   print("jjjjjjjjjjjjjjjjjjjjjjjj");
                                    //   isExpanded = !isExpanded;
                                    // }
                                    if (widget.selectedIndex == index) {
                                      widget.selectedIndex = -1;
                                    } else {
                                      widget.selectedIndex = index;
                                    }
                                    widget.subSelectedIndex = -1;
                                    widget.nestedSelectedIndex = -1;
                                    print(
                                        'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                    widget.onTabChange(
                                        item,
                                        widget.selectedIndex,
                                        widget.subSelectedIndex,
                                        widget.nestedSelectedIndex);
                                    // });

                                    // if (!item.containsKey('subMenu')) {
                                    if (item.items!.length == 0 ||
                                        globals.partnerInfoModel.planName!
                                                .toUpperCase() ==
                                            "ESSENTIALS") {
                                      // Navigator.pop(context);
                                      if (widget._scaffoldKey.currentState!
                                          .isDrawerOpen) {
                                        widget._scaffoldKey.currentState!
                                            .openEndDrawer();
                                        widget.changeRoute(item);
                                      }
                                    }
                                    // widget.onTabChange(item);
                                  },
                                ),
                              ),
                            ),
                            // isExpanded &&
                            // item.subDrawerBarItems != null &&
                            // item.subDrawerBarItems!.isNotEmpty
                            // item.containsKey('subMenu')
                            // item.containsKey("subMenu") &&
                            item.items != null &&
                                    item.items!.isNotEmpty &&
                                    widget.selectedIndex == index &&
                                    Utils.checkPlan(
                                        globals.partnerInfoModel.planName!
                                            .toUpperCase(),
                                        "ESSENTIALS") //"PRO")
                                ? Column(
                                    children: item.items!.map((subItem) {
                                    // ListView.builder(
                                    //     physics: NeverScrollableScrollPhysics(),
                                    //     shrinkWrap: true,
                                    //     itemCount: item["subMenu"].length,
                                    //     // children: drawerBlockData.drawerBarItems!.map((item) {
                                    //     itemBuilder: (context, subIndex) {
                                    var subIndex = item.items!.indexOf(subItem);
                                    // var subItem = item["subMenu"][subIndex];

                                    //  widget.subItem!.forEach((subItem) {
                                    // print("----------item.length--------------------------------- ${item["subMenu"].length}");
                                    // print("----------subItems $subItem");
                                    // print("----------subItem.contain ${subItem.containsKey('nestedSubMenu')}\n\n");
                                    // var index = widget.item!.indexOf(item);

                                    // var subIndex =item["subMenu"]!.indexOf(subItem);
                                    return Column(
                                      children: [
                                        Container(
                                          color: AppTheme
                                              .drawerMenuBackgroundColor,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30, 5, 5, 5),
                                            decoration: BoxDecoration(
                                              color: widget.subSelectedIndex ==
                                                          subIndex &&
                                                      widget.nestedSelectedIndex ==
                                                          -1 &&
                                                      widget.selectedIndex != -1
                                                  ? AppTheme
                                                      .drawerSelectedBackgroundColor
                                                  : AppTheme
                                                      .drawerUnSelectedBackgroundColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(ThemeSize
                                                      .themeBorderRadius)),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                subItem.title!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      color: widget.subSelectedIndex ==
                                                                  subIndex &&
                                                              widget.nestedSelectedIndex ==
                                                                  -1 &&
                                                              widget.selectedIndex !=
                                                                  -1
                                                          ? AppTheme
                                                              .drawerSelectedTextColor
                                                          : AppTheme
                                                              .drawerUnSelectedTextColor,
                                                    ),
                                              ),
                                              trailing:
                                                  // subItem.containsKey('nestedSubMenu')
                                                  subItem.items != null &&
                                                          subItem.items!
                                                              .isNotEmpty &&
                                                          Utils.checkPlan(
                                                              globals
                                                                  .partnerInfoModel
                                                                  .planName!
                                                                  .toUpperCase(),
                                                              "ELITE")
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child:
                                                              Transform.rotate(
                                                            angle:
                                                                //  isSubExpanded &&
                                                                widget.subSelectedIndex ==
                                                                        subIndex
                                                                    ? 1.5708
                                                                    : 0.0, // 90 degrees in radians
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              size: 20,
                                                              color: widget.subSelectedIndex ==
                                                                          subIndex &&
                                                                      widget.nestedSelectedIndex ==
                                                                          -1 &&
                                                                      widget.selectedIndex !=
                                                                          -1
                                                                  ? AppTheme
                                                                      .drawerSelectedTextColor
                                                                  : AppTheme
                                                                      .drawerUnSelectedTextColor,
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(),
                                              onTap: () {
                                                print(
                                                    'you have clicked subexpanded 2nd level');
                                                //  onItemSelected(subIndex)
                                                // setState(() {
                                                // if (subItem.subDrawerBarItems != null &&
                                                //     subItem.subDrawerBarItems!.isNotEmpty) {
                                                // if (subItem.containsKey('nestedSubMenu')) {
                                                //   isSubExpanded = !isSubExpanded;
                                                // }

                                                if (widget.subSelectedIndex ==
                                                    subIndex) {
                                                  widget.subSelectedIndex = -1;
                                                } else {
                                                  widget.subSelectedIndex =
                                                      subIndex;
                                                }
                                                // selectedIndex = -1;
                                                widget.nestedSelectedIndex = -1;
                                                print(
                                                    'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                                // widget.onTabChange(subItem);
                                                widget.onTabChange(
                                                    subItem,
                                                    widget.selectedIndex,
                                                    widget.subSelectedIndex,
                                                    widget.nestedSelectedIndex);
                                                // if (!subItem.containsKey('nestedSubMenu')) {
                                                if (subItem.items!.length ==
                                                        0 ||
                                                    globals.partnerInfoModel
                                                            .planName!
                                                            .toUpperCase() ==
                                                        "ESSENTIALS") {
                                                  //"PRO") {
                                                  print(
                                                      "-----------clickedddddddddd------------");
                                                  // Navigator.pop(context);
                                                  if (widget
                                                      ._scaffoldKey
                                                      .currentState!
                                                      .isDrawerOpen) {
                                                    widget._scaffoldKey
                                                        .currentState!
                                                        .openEndDrawer();
                                                    widget.changeRoute(subItem);
                                                  }
                                                }
                                                // });
                                                // widget.onTabChange(subItem);
                                              },
                                            ),
                                          ),
                                        ),
                                        // isSubExpanded &&
                                        // subItem.subDrawerBarItems != null &&
                                        // subItem.subDrawerBarItems!.isNotEmpty
                                        // subItem.containsKey('subMenu')
                                        // subItem.containsKey("nestedSubMenu") &&

                                        subItem.items != null &&
                                                subItem.items!.isNotEmpty &&
                                                widget.subSelectedIndex ==
                                                    subIndex &&
                                                Utils.checkPlan(
                                                    globals.partnerInfoModel
                                                        .planName!
                                                        .toUpperCase(),
                                                    "ELITE")
                                            ? Column(
                                                children: subItem.items!
                                                    .map((nestedSubItem) {
                                                // ListView.builder(
                                                //     physics: NeverScrollableScrollPhysics(),
                                                //     shrinkWrap: true,
                                                //     itemCount: subItem["nestedSubMenu"].length,
                                                // children: drawerBlockData.drawerBarItems!.map((item) {
                                                // itemBuilder:
                                                //     (context, nestedIndex) {
                                                // var nestedSubItem =
                                                //     subItem["nestedSubMenu"]
                                                //         [nestedIndex];

                                                //  widget.nestedSubItem!.forEach((nestedSubItem) {
                                                // print("----------item.length--------------------------------- ${item["subMenu"].length}");
                                                // print("----------nestedSubItem $nestedSubItem");
                                                // print("----------nestedSubItem.contain ${nestedSubItem.containsKey('nestedSubMenu')}\n\n");
                                                // var index = widget.item!.indexOf(item);
                                                var nestedIndex = subItem.items!
                                                    .indexOf(
                                                        nestedSubItem); // ["subMenu"]!.indexOf(nestedSubItem);
                                                return Container(
                                                  color: AppTheme
                                                      .drawerMenuBackgroundColor,
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        50, 10, 10, 10),
                                                    decoration: BoxDecoration(
                                                      color: widget.nestedSelectedIndex ==
                                                                  nestedIndex &&
                                                              widget.selectedIndex !=
                                                                  -1 &&
                                                              widget.subSelectedIndex !=
                                                                  -1
                                                          ? AppTheme
                                                              .drawerSelectedBackgroundColor //Util.getColorFromHex(drawerBlockData.selectedBackgroundColor!)
                                                          : AppTheme
                                                              .drawerUnSelectedBackgroundColor,
                                                      borderRadius: BorderRadius
                                                          .circular(ThemeSize
                                                              .themeBorderRadius),
                                                    ),
                                                    child: ListTile(
                                                      title: Text(
                                                        nestedSubItem.title!,
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                  color: widget.nestedSelectedIndex == nestedIndex &&
                                                                          widget.selectedIndex !=
                                                                              -1 &&
                                                                          widget.subSelectedIndex !=
                                                                              -1
                                                                      ? AppTheme
                                                                          .drawerSelectedTextColor
                                                                      : AppTheme
                                                                          .drawerUnSelectedTextColor,
                                                                ),
                                                      ),
                                                      onTap: () {
                                                        print(
                                                            'you have clicked nested expanded');
                                                        //  onItemSelected(index)
                                                        // setState(() {
                                                        widget.nestedSelectedIndex =
                                                            nestedIndex;
                                                        // selectedIndex = -1;
                                                        // widget.subSelectedIndex = -1;
                                                        widget.onTabChange(
                                                            nestedSubItem,
                                                            widget
                                                                .selectedIndex,
                                                            widget
                                                                .subSelectedIndex,
                                                            widget
                                                                .nestedSelectedIndex);
                                                        // });
                                                        print(
                                                            'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                                        // widget.onTabChange(item);
                                                        // Navigator.pop(context);
                                                        if (widget
                                                            ._scaffoldKey
                                                            .currentState!
                                                            .isDrawerOpen) {
                                                          widget._scaffoldKey
                                                              .currentState!
                                                              .openEndDrawer();
                                                          widget.changeRoute(
                                                              nestedSubItem);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }).toList())
                                            : SizedBox(),
                                      ],
                                    );
                                  }).toList())
                                : SizedBox(),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              /*
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.list.length,
                  // children: drawerBlockData.drawerBarItems!.map((item) {
                  itemBuilder: (context, index) {
                    var item = widget.list[index];
        
                    //  widget.list!.forEach((item) {
                    // print("----------item $item");
                    // print("----------item.contain ${item.containsKey('subMenu')}");
                    // var index = widget.list!.indexOf(item);
                    return Column(
                      children: [
                        Container(
                          color: AppTheme.drawerMenuBackgroundColor,
                          child: Container(
                            
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // color: widget.selectedIndex == index
                                  color: widget.selectedIndex == index &&
                                          widget.subSelectedIndex == -1 &&
                                          widget.nestedSelectedIndex == -1
                                  ? AppTheme.drawerSelectedBackgroundColor //  Color.fromARGB(255, 95, 189, 230) //Util.getColorFromHex(drawerBlockData.selectedBackgroundColor!)
                                  : AppTheme.drawerUnSelectedBackgroundColor,//, 
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              leading: SvgPicture.string(item["Icon"],
                                  colorFilter: ColorFilter.mode(
                                      widget.selectedIndex == index &&
                                              widget.subSelectedIndex == -1 &&
                                              widget.nestedSelectedIndex == -1
                                          ? AppTheme.drawerSelectedTextColor!//Colors.white
                                          : AppTheme.drawerUnSelectedTextColor!,//Colors.grey.shade700,
                                      BlendMode.srcIn)),
                          
                              // Icon(
                              //   item["Path"] == "/Home"
                              //       ? Icons.home
                              //       : item["Path"] == "/Category"
                              //           ? Icons.category
                              //           : item["Path"] == "/All_products"
                              //               ? Icons.shop
                              //               : item["Path"] == "/Accessories"
                              //                   ? Icons.person
                              //                   : item["Path"] == "/Pants"
                              //                       ? Icons.collections_sharp
                              //                       : item["Path"] == "/Dresses"
                              //                           ? Icons.more_horiz
                              //                           : item["Path"] ==
                              //                                   "/Blouses"
                              //                               ? Icons.more_horiz
                              //                               : Icons
                              //                                   .home_max_outlined,
                              //   color: widget.selectedIndex == index &&
                              //           widget.subSelectedIndex == -1 &&
                              //           widget.nestedSelectedIndex == -1
                              //       ? Colors.white
                              //       : Colors.grey.shade700,
                              //   
                              //   
                              // ),
                              title: Text(
                                item["name"],
                                style: TextStyle(
                                  color: widget.selectedIndex == index &&
                                          widget.subSelectedIndex == -1 &&
                                          widget.nestedSelectedIndex == -1
                                      ? AppTheme.drawerSelectedTextColor//Colors.white
                                      : AppTheme.drawerUnSelectedTextColor,//Colors.grey.shade700,
                                  
                                  
                                ),
                              ),
                              trailing:
                                  // item.subDrawerBarItems != null &&
                                  //         item.subDrawerBarItems!.isNotEmpty
                                  item.containsKey('subMenu')
                                      ? Container(
                                          padding: EdgeInsets.all(2.0),
                                          child: Transform.rotate(
                                            angle:
                                                //  isExpanded &&
                                                widget.selectedIndex == index
                                                    ? 1.5708
                                                    : 0.0, // 90 degrees in radians
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 20,
                                              color: widget.selectedIndex ==
                                                          index &&
                                                      widget.subSelectedIndex ==
                                                          -1 &&
                                                      widget.nestedSelectedIndex ==
                                                          -1
                                                  ? AppTheme.drawerSelectedTextColor
                                                  : AppTheme.drawerUnSelectedTextColor,
                                              
                                              
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                              onTap: () {
                                print('you have clicked expanded');
                                //  onItemSelected(index)
                                // setState(() {
                                // if (item.subDrawerBarItems != null &&
                                //     item.subDrawerBarItems!.isNotEmpty) {
                                // if (item.containsKey('subMenu') && selectedIndex==index) {
                                //   print("jjjjjjjjjjjjjjjjjjjjjjjj");
                                //   isExpanded = !isExpanded;
                                // }
                                if (widget.selectedIndex == index) {
                                  widget.selectedIndex = -1;
                                } else {
                                  widget.selectedIndex = index;
                                }
                                widget.subSelectedIndex = -1;
                                widget.nestedSelectedIndex = -1;
                                print(
                                    'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                widget.onTabChange(
                                    item,
                                    widget.selectedIndex,
                                    widget.subSelectedIndex,
                                    widget.nestedSelectedIndex);
                                // });
                          
                                if (!item.containsKey('subMenu')) {
                                  // Navigator.pop(context);
                                  if (widget
                                      ._scaffoldKey.currentState!.isDrawerOpen) {
                                    widget._scaffoldKey.currentState!
                                        .openEndDrawer();
                                  }
                                }
                                // widget.onTabChange(item);
                              },
                            ),
                          ),
                        ),
                        // isExpanded &&
                        // item.subDrawerBarItems != null &&
                        // item.subDrawerBarItems!.isNotEmpty
                        // item.containsKey('subMenu')
                        item.containsKey("subMenu") &&
                                widget.selectedIndex == index
                            ?
                            // Column(
                            // children: item["subMenu"]!.map((subItem) {
        
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: item["subMenu"].length,
                                // children: drawerBlockData.drawerBarItems!.map((item) {
                                itemBuilder: (context, subIndex) {
                                  var subItem = item["subMenu"][subIndex];
        
                                  //  widget.subItem!.forEach((subItem) {
                                  // print("----------item.length--------------------------------- ${item["subMenu"].length}");
                                  // print("----------subItems $subItem");
                                  // print("----------subItem.contain ${subItem.containsKey('nestedSubMenu')}\n\n");
                                  // var index = widget.item!.indexOf(item);
        
                                  // var subIndex =item["subMenu"]!.indexOf(subItem);
                                  return Column(
                                    children: [
                                      Container(
                          color: AppTheme.drawerMenuBackgroundColor,
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(30, 10, 10, 10),
                                          decoration: BoxDecoration(
                                                                        color: widget.subSelectedIndex ==
                                                              subIndex &&
                                                          widget.nestedSelectedIndex ==
                                                              -1 &&
                                                          widget.selectedIndex != -1
                                                                        ? AppTheme.drawerSelectedBackgroundColor 
                                                                        : AppTheme.drawerUnSelectedBackgroundColor, 
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ListTile(
                                            // leading: Icon(
                                            //   subItem["Path"] == "Home"
                                            //       ? Icons.home
                                            //       : subItem["Path"] == "Search"
                                            //           ? Icons.search
                                            //           : subItem["Path"] == "Cart"
                                            //               ? Icons.trolley
                                            //               : subItem["Path"] ==
                                            //                       "Profile"
                                            //                   ? Icons.person
                                            //                   : subItem["Path"] ==
                                            //                           "More"
                                            //                       ? Icons.more_horiz
                                            //                       : Icons
                                            //                           .home_max_outlined,
                                            //   color: selectedIndex == index
                                            //       ? Colors.white
                                            //       : Colors.grey.shade700,
                                            //   
                                            //   
                                            // ),
                                            title: Text(
                                              subItem["name"]!,
                                              style: TextStyle(
                                                color: widget.subSelectedIndex ==
                                                            subIndex &&
                                                        widget.nestedSelectedIndex ==
                                                            -1 &&
                                                        widget.selectedIndex != -1
                                                    ? AppTheme.drawerSelectedTextColor
                                                    : AppTheme.drawerUnSelectedTextColor,
                                                
                                                
                                              ),
                                            ),
                                            trailing: subItem
                                                    .containsKey('nestedSubMenu')
                                                ? Container(
                                                    padding: EdgeInsets.all(2.0),
                                                    child: Transform.rotate(
                                                      angle:
                                                          //  isSubExpanded &&
                                                          widget.subSelectedIndex ==
                                                                  subIndex
                                                              ? 1.5708
                                                              : 0.0, // 90 degrees in radians
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 20,
                                                        color: widget.subSelectedIndex ==
                                                                    subIndex &&
                                                                widget.nestedSelectedIndex ==
                                                                    -1 &&
                                                                widget.selectedIndex !=
                                                                    -1
                                                            ? AppTheme.drawerSelectedTextColor
                                                            : AppTheme.drawerUnSelectedTextColor,
                                                        
                                                        
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            onTap: () {
                                              print(
                                                  'you have clicked subexpanded');
                                              //  onItemSelected(subIndex)
                                              // setState(() {
                                              // if (subItem.subDrawerBarItems != null &&
                                              //     subItem.subDrawerBarItems!.isNotEmpty) {
                                              // if (subItem.containsKey('nestedSubMenu')) {
                                              //   isSubExpanded = !isSubExpanded;
                                              // }
                                        
                                              if (widget.subSelectedIndex ==
                                                  subIndex) {
                                                widget.subSelectedIndex = -1;
                                              } else {
                                                widget.subSelectedIndex =
                                                    subIndex;
                                              }
                                              // selectedIndex = -1;
                                              widget.nestedSelectedIndex = -1;
                                              print(
                                                  'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                              // widget.onTabChange(subItem);
                                              widget.onTabChange(
                                                  item,
                                                  widget.selectedIndex,
                                                  widget.subSelectedIndex,
                                                  widget.nestedSelectedIndex);
                                              if (!subItem
                                                  .containsKey('nestedSubMenu')) {
                                                // Navigator.pop(context);
                                                if (widget._scaffoldKey
                                                    .currentState!.isDrawerOpen) {
                                                  widget
                                                      ._scaffoldKey.currentState!
                                                      .openEndDrawer();
                                                }
                                              }
                                              // });
                                              // widget.onTabChange(subItem);
                                            },
                                          ),
                                        ),
                                      ),
                                      // isSubExpanded &&
                                      // subItem.subDrawerBarItems != null &&
                                      // subItem.subDrawerBarItems!.isNotEmpty
                                      // subItem.containsKey('subMenu')
                                      subItem.containsKey("nestedSubMenu") &&
                                              widget.subSelectedIndex ==
                                                  subIndex
                                          ?
                                          // Column(
                                          // children: item["subMenu"]!.map((subItem) {
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  subItem["nestedSubMenu"]
                                                      .length,
                                              // children: drawerBlockData.drawerBarItems!.map((item) {
                                              itemBuilder:
                                                  (context, nestedIndex) {
                                                var nestedSubItem =
                                                    subItem["nestedSubMenu"]
                                                        [nestedIndex];
        
                                                //  widget.nestedSubItem!.forEach((nestedSubItem) {
                                                // print("----------item.length--------------------------------- ${item["subMenu"].length}");
                                                // print("----------nestedSubItem $nestedSubItem");
                                                // print("----------nestedSubItem.contain ${nestedSubItem.containsKey('nestedSubMenu')}\n\n");
                                                // var index = widget.item!.indexOf(item);
                                                // var subIndex =item["subMenu"]!.indexOf(nestedSubItem);
                                                return Container(
                          color: AppTheme.drawerMenuBackgroundColor,
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        50, 10, 10, 10),
                                                    decoration: BoxDecoration(
                                                                                  color: widget.nestedSelectedIndex ==
                                                                        nestedIndex &&
                                                                    widget.selectedIndex !=
                                                                        -1 &&
                                                                    widget.subSelectedIndex !=
                                                                        -1
                                                                                  ?  AppTheme.drawerSelectedBackgroundColor //Util.getColorFromHex(drawerBlockData.selectedBackgroundColor!)
                                                                                  : AppTheme.drawerMenuBackgroundColor, 
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: ListTile(
                                                      // leading: Icon(
                                                      //   nestedSubItem["Path"] == "Home"
                                                      //       ? Icons.home
                                                      //       : nestedSubItem["Path"] == "Search"
                                                      //           ? Icons.search
                                                      //           : nestedSubItem["Path"] == "Cart"
                                                      //               ? Icons.trolley
                                                      //               : nestedSubItem["Path"] ==
                                                      //                       "Profile"
                                                      //                   ? Icons.person
                                                      //                   : nestedSubItem["Path"] ==
                                                      //                           "More"
                                                      //                       ? Icons.more_horiz
                                                      //                       : Icons
                                                      //                           .home_max_outlined,
                                                      //   color: selectedIndex == index
                                                      //       ? Colors.white
                                                      //       : Colors.grey.shade700,
                                                      //   
                                                      //   
                                                      // ),
                                                      title: Text(
                                                        nestedSubItem["name"]!,
                                                        style: TextStyle(
                                                          color: widget.nestedSelectedIndex ==
                                                                      nestedIndex &&
                                                                  widget.selectedIndex !=
                                                                      -1 &&
                                                                  widget.subSelectedIndex !=
                                                                      -1
                                                              ? AppTheme.drawerSelectedTextColor
                                                              : AppTheme.drawerUnSelectedTextColor,
                                                          
                                                          
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        print(
                                                            'you have clicked nested expanded');
                                                        //  onItemSelected(index)
                                                        // setState(() {
                                                        widget.nestedSelectedIndex =
                                                            nestedIndex;
                                                        // selectedIndex = -1;
                                                        // widget.subSelectedIndex = -1;
                                                        widget.onTabChange(
                                                            item,
                                                            widget.selectedIndex,
                                                            widget
                                                                .subSelectedIndex,
                                                            widget
                                                                .nestedSelectedIndex);
                                                        // });
                                                        print(
                                                            'selectedIndex${widget.selectedIndex} subSelectedIndex${widget.subSelectedIndex} nestedSelectedIndex${widget.nestedSelectedIndex}');
                                                        // widget.onTabChange(item);
                                                        // Navigator.pop(context);
                                                        if (widget
                                                            ._scaffoldKey
                                                            .currentState!
                                                            .isDrawerOpen) {
                                                          widget._scaffoldKey
                                                              .currentState!
                                                              .openEndDrawer();
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                );
                                              })
                                          : SizedBox(),
                                    ],
                                  );
                                })
                            : SizedBox(),
                      ],
                    );
                  }),
        
                  */
            ]),
      ),
    );
  }
}
