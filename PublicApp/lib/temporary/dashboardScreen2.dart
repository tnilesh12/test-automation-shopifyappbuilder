// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '/helper/views.dart';
// import '/views/widgets/widget_search_view.dart';
// import 'modelClass/page_layout_model.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//     SearchView(context, "searchTxt", () => null);
    
//     /*
//      FutureBuilder(
//         future: rootBundle.loadString("assets/json/learn/dashboard_main.json"),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             var list = json.decode(snapshot.data!);
//             // print("ddcdfjcnbw ckjdfhvnekjcjscn dkvkdhvn${list}");
//             PageLayoutModel myList = PageLayoutModel.fromJson(list);
//             // print("my list is nnnnnnnnnnnnnnnnnnnn ${myList}");

//             return Container(
//               color: Theme.of(context).colorScheme.background,
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: SingleChildScrollView(
//                 child: Column(
//                     children: myList.pageLayout!.map((element) {
//                   // return WidgetFrequentlyAskedQuestions();

//                   // if (element.view == Views.ButtomBarBlock.name) {
//                   //   return (element.textListWithDetailsData!);
//                   // }
//                   // if (element.view == Views.FAQView.name) {
//                   //   return ItgeekWidgetFaq(element.textListWithDetailsData!);
//                   // }
//                   // if (element.view == Views.WebView.name) {
//                   //   print("mywebbb");
//                   //   return ItgeekWidgetWebView(element.webViewData!);
//                   // }
//                   // if (element.view == Views.GridView.name) {
//                   //   return ItgeekWidgetGridView(element.gridViewData!);
//                   // }
//                   // if (element.view == Views.SocialMediaLink.name) {
//                   //   return ItgeekWidgetSocialMediaLink(
//                   //       element.socialMediaLinkData!);
//                   // }

//                   // if (element.view == Views.TextTileView.name) {
//                   //   return ItgeekWidgetTextTile(element.textTileData!);
//                   // }
//                   // if (element.view == Views.SliderView.name) {
//                   //   return ItgeekWidgetSlider(element.sliderData!, (item) {
//                   //     (element.sliderData);
//                   //     print("itemSliders $item");


//                   //     if (item.sliderBannerType == "Product") {
//                   //       print("Slider Type Product");

//                   //     } else if (item.sliderBannerType == "Category") {

//                   //       print("Slider Type Category");
//                   //     } else if (item.sliderBannerType == "Weblink") {
//                   //       print("Slider Type Weblink");

//                   //     } else if (item.sliderBannerType == "Blog") {
//                   //       print("Slider Type Blog");

//                   //     } else {
//                   //       print("Slider Type Normal");

//                   //     }


//                   //   });
//                   // }
//                   // if (element.view == Views.CategoryView.name) {
//                   //   return ItgeekWidgetCategory(element.categoryData!, (item) {
//                   //     (element.categoryData);
//                   //     print("itemCategory $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.ProductView.name) {
//                   //   return ItgeekWidgetPopulorProduct(element.productData!,
//                   //       (item) {
//                   //     (element.productData);
//                   //     print("itemProduct $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.BannerTextView.name) {
//                   //   return ItgeekWidgetBannerText(element.textViewData!,
//                   //       (item) {
//                   //     (element.textViewData);
//                   //     print("myitemTextView $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.BannerImageView.name) {
//                   //   return ItgeekWidgetBannerImage(element.imageViewData!,
//                   //       (item) {
//                   //     (element.imageViewData);
//                   //     print("itemImageView $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.BannerButtonTextView.name) {
//                   //   return ItgeekWidgetBannerImageButton(
//                   //       element.buttonViewData!, (item) {
//                   //     (element.buttonViewData);
//                   //     print("itemButtonView $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.BannerVideoView.name) {
//                   //   return ItgeekWidgetBannerVideo(element.videoViewData!,
//                   //       (item) {
//                   //     (element.videoViewData);
//                   //     print("itemVideoView $item");
//                   //   });
//                   // }
//                   // if (element.view == Views.BlogView.name) {
//                   //   return ItgeekWidgetBlogView(element.blogViewData!, (item) {
//                   //     (element.blogViewData!);
//                   //     print("itemBlogView $item");
//                   //   });
//                   // }

//                   return SizedBox.shrink();
//                 }).toList()),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error loading JSON'); // Handle error
//           } else {
//             return CircularProgressIndicator(); // Show a loading indicator
//           }
//         });
  
//   */
//   }
// }
