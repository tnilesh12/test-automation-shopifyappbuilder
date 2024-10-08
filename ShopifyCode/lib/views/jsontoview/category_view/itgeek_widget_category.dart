// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../helper/util.dart';
// import '../../modelClass/data_model.dart';

// class ItgeekWidgetCategory extends StatelessWidget {
//   Function(CategoryItems) OnClick;
//   CategoryData category;
 
//   ItgeekWidgetCategory(this.category, this.OnClick);
  
//   @override
//   Widget build(BuildContext context) {
//     Color containerBackgroundColor =
//         Util.getColorFromHex(category.styleProperties!.backgroundColor!);

//     return Container(
//       color: containerBackgroundColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: containerBackgroundColor,
//             margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Category",
//                   style: TextStyle(
//                               fontSize: 20, color: Colors.brown.shade900),
//                 ),
//                 category.categoryAllVisible!
//                     ? Text(
//                         "View All",
//                         style: TextStyle(
//                               
//                             fontSize: 14, color: Colors.brown.shade900),
//                       )
//                     : Text(""),
//               ],
//             ),
//           ),
//           PopulorCategoryView(category, OnClick),
//         ],
//       ),
//     );
//   }
// }

// class PopulorCategoryView extends StatelessWidget {
//   Function(CategoryItems) OnClick;
//   CategoryData categoryData;
 
//   PopulorCategoryView(this.categoryData, this.OnClick);

//   @override
//   Widget build(BuildContext context) {
//     List<CategoryItems> listItems = [];
//     categoryData.categoryItems!.map((item) => {listItems.add(item)}).toList();

//     Color imageBackgroundColor =
//         Util.getColorFromHex(categoryData.styleProperties!.backgroundColor!);
//     Color textColor = Util.getColorFromHex(categoryData.styleProperties!.titleTextColor!);
//     Color viewBackgroundColor =
//         Util.getColorFromHex(categoryData.categoryViewBackgroundColor!);

//     return Container(
//         padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
//         height: 170,
//         child: ListView.builder(
//             physics: ClampingScrollPhysics(),
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: categoryData.categoryItems!.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {OnClick(listItems[index]);},
//                 child: Container(
//                   width: 110,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   decoration: BoxDecoration(
//                       color: viewBackgroundColor,
//                       borderRadius:
//                           BorderRadius.circular(categoryData.styleProperties!.radius!.toDouble()),
//                       border: Border.all(width: 1, color: Colors.blue)),
//                   margin: EdgeInsets.all(5),
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Column(children: [
//                       Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: imageBackgroundColor,
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                   listItems[index].categoryImageLink!),
//                               fit: BoxFit.cover),
//                           borderRadius: BorderRadius.circular(
//                               categoryData.styleProperties!.radius!.toDouble()),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
//                         child: Text("${listItems[index].categoryTitleText!}",
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               
//                                 color: textColor,
//                                 fontSize: categoryData.styleProperties!.titleTextFontSize!.toDouble())),
//                       )
//                     ]),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
