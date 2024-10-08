import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/form/form_builder.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/plugin/rebuy_product/quick_view/quick_view.dart';
import 'package:shopify_code/plugin/rebuy_product/recommended_product/recommended_product_view.dart';
import 'package:shopify_code/plugin/rebuy_product/top_seller/top_seller_product_view.dart';
import 'package:shopify_code/plugin/rebuy_product/trending_product/trending_product.dart';
import 'package:shopify_code/plugin/smile_io/dashboad_sections/smile_io_dashboard_widget.dart';
import 'package:shopify_code/plugin/smile_io/smile_io_dashboard_screen/smile_io_dashboard_screen.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/views/jsontoview/banners_view/itgeek_widget_button_view.dart';
import 'package:shopify_code/views/jsontoview/banners_view/itgeek_widget_vimeo_view.dart';
import 'package:shopify_code/views/jsontoview/banners_view/itgeek_widget_youtube_view.dart';
import 'package:shopify_code/views/jsontoview/blog_view/itgeek_widget_blog_view.dart';
import 'package:shopify_code/views/jsontoview/count_down_timer/itgeek_widget_count_down_timer.dart';
import 'package:shopify_code/views/jsontoview/discount_view/itgeek_widget_discount.dart';
import 'package:shopify_code/views/jsontoview/divider_view/itgeek_widget_divider.dart';
import 'package:shopify_code/plugin/email_subscription/klavio_email_subscription/itgeek_widget_klavio_email_subscription.dart';
import 'package:shopify_code/plugin/email_subscription/mailchimp_email_subscription/itgeek_widget_mailchimp_email_subscription.dart';
import 'package:shopify_code/views/jsontoview/faq_view/itgeek_widget_faq.dart';
import 'package:shopify_code/views/jsontoview/icon_with_text/itgeek_widget_icon_with_text.dart';
import 'package:shopify_code/views/jsontoview/image_grid_view/image_grid_view.dart';
import 'package:shopify_code/views/jsontoview/insta_feed_view/itgeek_widget_insta_feed.dart';
import 'package:shopify_code/views/jsontoview/product_collection_tab_view/product_collection_tab_view.dart';
import 'package:shopify_code/views/jsontoview/recent_order_view/itgeek_widget_recent_order_view.dart';
import 'package:shopify_code/views/jsontoview/scrolling_text_view/itgeek_widget_scrolling_text.dart';
import 'package:shopify_code/views/jsontoview/social_view/itgeek_widget_social_media_link.dart';
import 'package:shopify_code/views/jsontoview/testimonial_slider/widget_testimonial_slider.dart';
import 'package:shopify_code/views/jsontoview/text_list_view/itgeek_text_list_view.dart';
import 'package:shopify_code/views/jsontoview/web_view/itgeek_widget_webview.dart';
import 'package:shopify_code/views/jsontoview/text_grid_view/itgeek_text_grid_view_widget.dart';
import '/route/go_routes.dart';
import 'package:shopify_code/util/block_name.dart';
import 'package:shopify_code/views/jsontoview/banners_view/itgeek_widget_banner_image.dart';
import 'package:shopify_code/views/jsontoview/product_view/Itgeek_widget_product_view.dart';
import 'package:shopify_code/views/jsontoview/slider_view/widget_slider.dart';
import 'package:shopify_code/views/jsontoview/simple_slider_widget/simple_widget_slider.dart';
import '../../theme1/views/product_details_screen/product_details_screen.dart';
import 'package:shopify_code/modelClass/dashboard_data_model.dart';
import 'package:shopify_code/views/jsontoview/text_with_background_image_view/Itgeek_widget_text_withBackground_image.dart';
import 'package:shopify_code/views/jsontoview/category_view/itgeek_widget_collection_view.dart';
import 'package:shopify_code/views/jsontoview/comparison_view/itgeeks_widget_comparison_view.dart';
import 'package:shopify_code/views/jsontoview/text_only_view/Itgeek_widget_text_only_view.dart';
import 'package:shopify_code/views/jsontoview/search_view/itgeek_widget_search_view.dart';
import 'package:shopify_code/views/jsontoview/image_only_view/itgeek_widget_image_only_view.dart';
import '../../theme1/views/product_list/product_list_screen.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/plugins_enum.dart';

class CustomePageFromJson {
  bool isWithinInterval(String startDate, String endDate) {
    if (startDate == "" || endDate == "") return true;
    print("---startDate $startDate-------endDate $endDate-------");
    DateTime sDate = DateTime.parse(startDate + " 00:00:00.000z");
    DateTime eDate = DateTime.parse(endDate + " 00:00:00.000z");
    DateTime currentDate = DateTime.now();
    return currentDate.isAfter(sDate) && currentDate.isBefore(eDate);
  }

  Widget GetWidget(
      BuildContext context, DashboardDataModel dashboardDataModel) {
    //, String jsontag) {
    // print(jsontag);
    // String value = FirebaseRemoteConfig.instance.getValue(jsontag).asString();
    // print(value);
    // Map<String, dynamic> mapValues = {}; // jsonDecode(value);
    // print(mapValues);

    // DashboardDataModel model = DashboardDataModel.fromJson(mapValues);

    // BuilderJsonTheme1Model model =
    //     BuilderJsonTheme1Model.fromJson(list);
    // print("my list is nnnnnnnnnnnnnnnnnnnn ${model.dashboardDataItems}");
// return Text("Lljdflkdsdfkjdslkfjlk");
    return Container(
      // color: Util.getColorFromHex(model.backgroundColor.toString()),
      // child:
      //   Text("Lljdflkds")

      child: Column(
          children: dashboardDataModel.dashboardDataItems!.map((element) {
        // DateTime startDate = DateTime.parse(element.);
        // DateTime endDate = DateTime.parse("2024-04-26T00:00:00.000Z");
        // DateTime currentDate = DateTime.now();
        //  // Check if the current date falls within the provided interval
        // bool isWithinInterval = currentDate.isAfter(startDate) && currentDate.isBefore(endDate);
        // // Show the view only if the current date falls within the interval
        // print("isWithinInterval------------$isWithinInterval");
        // if (!isWithinInterval) {
        //   return Container();
        // }

        if (element.blockName == Block_Name.Image_Banner_Slider_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.imageBannerSliderData!.planName!) &&
                  (element.imageBannerSliderData!.scheduleTime == null ||
                      isWithinInterval(
                          element
                              .imageBannerSliderData!.scheduleTime!.startDate!,
                          element
                              .imageBannerSliderData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetSlider(
                  element.imageBannerSliderData!,
                  (item) {
                    (element.imageBannerSliderData);
                    print("itemSliders ${item.toJson()}");
                    // RouteGenerate.ManageUserClick(context, item.);

                    // if (item.sliderBannerType == ActionType.Product.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.productDetailsScreen,
                    //       arguments: {item.sliderBannerUID});
                    // } else if (item.sliderBannerType == ActionType.Category.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.productListScreen,
                    //       arguments: {
                    //         item.sliderBannerUID,
                    //         "title"
                    //         // state.menus.items![index].resourceId,
                    //         // state.menus.items![index].title
                    //       });
                    // } else if (item.sliderBannerType == ActionType.Link.name) {
                    // } else if (item.sliderBannerType == ActionType.Blog.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.blogHandleScreen,
                    //       arguments: {"news"});
                    // } else {
                    //   print("Slider Type Normal");
                    // }
                  },
                  OnClickBtn1: (route) {
                    RouteGenerate.ManageUserClick(
                        context, route.primarybuttonlink!,
                        data: route, button1: true);
                  },
                  OnClickBtn2: (route) {
                    RouteGenerate.ManageUserClick(
                        context, route.secondarybuttonlink!,
                        data: route, button2: true);
                  },
                )
              : Container();
        }
        if (element.blockName == Block_Name.Image_Slider_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.simpleImageSliderData!.planName!) &&
                  (element.simpleImageSliderData!.scheduleTime == null ||
                      isWithinInterval(
                          element
                              .simpleImageSliderData!.scheduleTime!.startDate!,
                          element
                              .simpleImageSliderData!.scheduleTime!.endDate!)))
              ? ItgeekSimpleWidgetSlider(
                  element.simpleImageSliderData!,
                  (item) {
                    (element.simpleImageSliderData);
                    print("itemSliders ${item.toJson()}");
                    // RouteGenerate.ManageUserClick(context, item.);

                    // if (item.sliderBannerType == ActionType.Product.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.productDetailsScreen,
                    //       arguments: {item.sliderBannerUID});
                    // } else if (item.sliderBannerType == ActionType.Category.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.productListScreen,
                    //       arguments: {
                    //         item.sliderBannerUID,
                    //         "title"
                    //         // state.menus.items![index].resourceId,
                    //         // state.menus.items![index].title
                    //       });
                    // } else if (item.sliderBannerType == ActionType.Link.name) {
                    // } else if (item.sliderBannerType == ActionType.Blog.name) {
                    //   Navigator.pushNamed(context, RouteGenerate.blogHandleScreen,
                    //       arguments: {"news"});
                    // } else {
                    //   print("Slider Type Normal");
                    // }
                  },
                )
              : Container();
        }
        if (element.blockName == Block_Name.Image_Banner_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.imageWithTextData!.planName!) &&
                  (element.imageWithTextData!.scheduleTime == null ||
                      isWithinInterval(
                          element.imageWithTextData!.scheduleTime!.startDate!,
                          element.imageWithTextData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetBannerImage(element.imageWithTextData!, (item) {
                  (element.imageWithTextData);
                  RouteGenerate.ManageUserClick(context, item.action!,
                      data: item);
                })
              : Container();
        }
        if (element.blockName == Block_Name.Count_Down_Timer_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.countDownDate!.planName!) &&
                  (element.countDownDate!.scheduleTime == null ||
                      isWithinInterval(
                          element.countDownDate!.scheduleTime!.startDate!,
                          element.countDownDate!.scheduleTime!.endDate!)))
              ? ItgeekWidgetCountdownTimer(element.countDownDate!)
              : Container();
        }
        if (element.blockName == Block_Name.Discount_Section_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.discountData!.planName!) &&
                  (element.discountData!.scheduleTime == null ||
                      isWithinInterval(
                          element.discountData!.scheduleTime!.startDate!,
                          element.discountData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetDiscountView(element.discountData!)
              : Container();
        }
        if (element.blockName == Block_Name.Divider_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.dividerData!.planName!) &&
                  (element.dividerData!.scheduleTime == null ||
                      isWithinInterval(
                          element.dividerData!.scheduleTime!.startDate!,
                          element.dividerData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetDivider(element.dividerData!)
              : Container();
        }
        if (element.blockName == Block_Name.Icon_Text_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.iconTextData!.planName!) &&
                  (element.iconTextData!.scheduleTime == null ||
                      isWithinInterval(
                          element.iconTextData!.scheduleTime!.startDate!,
                          element.iconTextData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetIconWithText(element.iconTextData!)
              : Container();
        }
        if (element.blockName == Block_Name.Testimonials_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.testimonialsData!.planName!) &&
                  (element.testimonialsData!.scheduleTime == null ||
                      isWithinInterval(
                          element.testimonialsData!.scheduleTime!.startDate!,
                          element.testimonialsData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetTestimonialSlider(element.testimonialsData!)
              : Container();
        }
        if (element.blockName == Block_Name.Video_Block.name) {
          // return ItgeekWidgetBannerVideo(element.videoData!, (item) {
          if (Utils.checkPlan(globals.partnerInfoModel.planName!,
                  element.videoData!.planName!) &&
              (element.videoData!.scheduleTime == null ||
                  isWithinInterval(element.videoData!.scheduleTime!.startDate!,
                      element.videoData!.scheduleTime!.endDate!))) {
            if (element.videoData!.uRL != "" &&
                element.videoData!.uRL!.contains("vimeo"))
              return ItgeekWidgetVimeoView(element.videoData!);
            else {
              return ItgeekWidgetYoutubeView(element.videoData!);
            }
          }
          // , (item) {
          //   (element.videoData);
          //   print("itemVideoView $item");
          // });
        }
        if (element.blockName == Block_Name.Scrolling_Text_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.scrollingTextData!.planName!) &&
                  (element.scrollingTextData!.scheduleTime == null ||
                      isWithinInterval(
                          element.scrollingTextData!.scheduleTime!.startDate!,
                          element.scrollingTextData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetScrollingText(element.scrollingTextData!)
              : Container();
        }
        if (element.blockName == Block_Name.Comparison_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.comparisonData!.planName!) &&
                  (element.comparisonData!.scheduleTime == null ||
                      isWithinInterval(
                          element.comparisonData!.scheduleTime!.startDate!,
                          element.comparisonData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetComparisonView(element.comparisonData!)
              : Container();
        }
        if (element.blockName == Block_Name.Instagram_Feed_Block.name) {
          return ((globals.plugins.containsKey(PluginsEnum.INSTAGRAM.name)) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.instaData!.planName!) &&
                  (element.instaData!.scheduleTime == null ||
                      isWithinInterval(
                          element.instaData!.scheduleTime!.startDate!,
                          element.instaData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetInstaFeed(element.instaData!)
              : Container();
          // , (item) {
          //   (element.textViewData);
          //   print("myitemTextView $item");
          // });
        }

        if (element.blockName == Block_Name.Collection_Grid_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.collectionGridData!.planName!) &&
                  (element.collectionGridData!.scheduleTime == null ||
                      isWithinInterval(
                          element.collectionGridData!.scheduleTime!.startDate!,
                          element.collectionGridData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetCollectionView(element.collectionGridData!, (item) {
                  ProductListScreen productListScreen =
                      ProductListScreen(item.id!, item.productTitle!);
                  RouteGenerate.ManageUserClick(
                      context, Routes.productListScreen,
                      data: productListScreen);
                })
              : Container();
        }

        if (element.blockName == Block_Name.Recent_Order_Theme_Third.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.recentOrderThemeThirdData!.plan!) &&
                  (element.recentOrderThemeThirdData!.scheduleTime == null ||
                      isWithinInterval(
                          element.recentOrderThemeThirdData!.scheduleTime!
                              .startDate!,
                          element.recentOrderThemeThirdData!.scheduleTime!
                              .endDate!)))
              ? ItgeekWidgetRecentOrderView(element.recentOrderThemeThirdData!,
                  () {
                  context.push("/${Routes.orderListScreen}");
                })
              : Container();
        }

        if (element.blockName == Block_Name.Product_Grid_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.productGridData!.planName!) &&
                  (element.productGridData!.scheduleTime == null ||
                      isWithinInterval(
                          element.productGridData!.scheduleTime!.startDate!,
                          element.productGridData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetPopulorProduct(element.productGridData!, (item) {
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item.id!);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }

        if (element.blockName == Block_Name.Search_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.searchData!.planName!) &&
                  (element.searchData!.scheduleTime == null ||
                      isWithinInterval(
                          element.searchData!.scheduleTime!.startDate!,
                          element.searchData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetSearchView(context, element.searchData!, () {
                  context.push("/${Routes.searchScreenFull}");
                })
              : Container();
        }

        if (element.blockName == Block_Name.Form_Block.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.formBlockData!.planName!) &&
                  (element.formBlockData!.scheduleTime == null ||
                      isWithinInterval(
                          element.formBlockData!.scheduleTime!.startDate!,
                          element.formBlockData!.scheduleTime!.endDate!)))
              ? FormWidget(
                  element.formBlockData!.formId!,
                  element.formBlockData!.backgroundColor!,
                  element.formBlockData!.textColor!)
              : Container();
        }

        if (element.blockName == Block_Name.Image_Only.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.imageOnlyData!.planName!) &&
                  (element.imageOnlyData!.scheduleTime == null ||
                      isWithinInterval(
                          element.imageOnlyData!.scheduleTime!.startDate!,
                          element.imageOnlyData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetImageOnlyView(element.imageOnlyData!, (item) {
                  debugPrint("-------Image_Only----------${item.toJson()}");
                  RouteGenerate.ManageUserClick(
                    context,
                    item.action!,
                    data: item,
                  );
                })
              : Container();
        }

        if (element.blockName == Block_Name.Text_Only.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.textOnlyData!.planName!) &&
                  (element.textOnlyData!.scheduleTime == null ||
                      isWithinInterval(
                          element.textOnlyData!.scheduleTime!.startDate!,
                          element.textOnlyData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetTextOnlyView(element.textOnlyData!)
              : Container();
        }

        if (element.blockName == Block_Name.Social_Media_Links.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.socialMediaLinksData!.planName!) &&
                  (element.socialMediaLinksData!.scheduleTime == null ||
                      isWithinInterval(
                          element
                              .socialMediaLinksData!.scheduleTime!.startDate!,
                          element
                              .socialMediaLinksData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetSocialMediaLink(element.socialMediaLinksData!,
                  (item) {
                  RouteGenerate.urlLauncher(item.link!);
                })
              : Container();
        }

        if (element.blockName == Block_Name.Text_with_background_Image.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.textWithBackgroundImage!.planName!) &&
                  (element.textWithBackgroundImage!.scheduleTime == null ||
                      isWithinInterval(
                          element.textWithBackgroundImage!.scheduleTime!
                              .startDate!,
                          element.textWithBackgroundImage!.scheduleTime!
                              .endDate!)))
              ? ItgeekWidgetTextWithBackgroundImage(
                  element.textWithBackgroundImage!, (item) {
                  debugPrint(
                      "-------Text_with_background_Image----------${item.toJson()}");
                  RouteGenerate.ManageUserClick(
                    context,
                    item.action!,
                    data: item,
                  );
                })
              : Container();
        }

        if (element.blockName == Block_Name.Button_Only.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.buttonOnlyData!.planName!) &&
                  (element.buttonOnlyData!.scheduleTime == null ||
                      isWithinInterval(
                          element.buttonOnlyData!.scheduleTime!.startDate!,
                          element.buttonOnlyData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetButtonView((item) {
                  debugPrint("-------Button_Only----------${item.toJson()}");
                  RouteGenerate.ManageUserClick(
                    context,
                    item.action!,
                    data: item,
                  );
                }, element.buttonOnlyData!)
              : Container();
        }

        if (element.blockName == Block_Name.Blog_Slider.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.blogSliderData!.planName!) &&
                  (element.blogSliderData!.scheduleTime == null ||
                      isWithinInterval(
                          element.blogSliderData!.scheduleTime!.startDate!,
                          element.blogSliderData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetBlogView(
                  element.blogSliderData!,
                  (item) {
                    debugPrint("-------itemBlogView----------${item.toJson()}");
                    RouteGenerate.ManageUserClick(context, Routes.articleScreen,
                        data: item);
                  },
                )
              : Container();
        }
        if (element.blockName == Block_Name.FAQ.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.faqData!.planName!) &&
                  (element.faqData!.scheduleTime == null ||
                      isWithinInterval(
                          element.faqData!.scheduleTime!.startDate!,
                          element.faqData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetFaq(
                  element.faqData!,
                )
              : Container();
        }

        if (element.blockName == Block_Name.Text_List.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.textListData!.planName!) &&
                  (element.textListData!.scheduleTime == null ||
                      isWithinInterval(
                          element.textListData!.scheduleTime!.startDate!,
                          element.textListData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetTextTile(element.textListData!)
              : Container();
        }

        if (element.blockName == Block_Name.Featured_Collection.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.featuredCollectionData!.planName!) &&
                  (element.featuredCollectionData!.scheduleTime == null ||
                      isWithinInterval(
                              element.featuredCollectionData!.scheduleTime!
                                  .startDate!,
                              element.featuredCollectionData!.scheduleTime!
                                  .endDate!) &&
                          (element.featuredCollectionData!
                              .featuredCollectionList!.isNotEmpty)))
              ? ProductCollectionTabView(element.featuredCollectionData!,
                  (item) {
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item.id!);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }

        if (element.blockName == Block_Name.Mailchimp_Subscription_Forms.name) {
          return ((globals.plugins.containsKey(
                      PluginsEnum.MAILCHIMP_SUBSCRIPTION_FORMS.name)) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.mailChimpAddSectionData!.planName!) &&
                  (element.mailChimpAddSectionData!.scheduleTime == null ||
                      isWithinInterval(
                          element.mailChimpAddSectionData!.scheduleTime!
                              .startDate!,
                          element.mailChimpAddSectionData!.scheduleTime!
                              .endDate!)))
              ? ItgeekWidgetMailchimpEmailSubscription(
                  element.mailChimpAddSectionData!)
              : Container();
        }

        if (element.blockName == Block_Name.Klaviyo_Subscription_Forms.name) {
          return ((globals.plugins.containsKey(
                      PluginsEnum.KELAVIO_SUBSCRIPTION_FORMS.name)) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.klaviyoSubscriptionFormsData!.planName!) &&
                  (element.klaviyoSubscriptionFormsData!.scheduleTime == null ||
                      isWithinInterval(
                          element.klaviyoSubscriptionFormsData!.scheduleTime!
                              .startDate!,
                          element.klaviyoSubscriptionFormsData!.scheduleTime!
                              .endDate!)))
              ? ItgeekWidgetKlavioEmailSubscription(
                  element.klaviyoSubscriptionFormsData!)
              : Container();
        }
        if (element.blockName == Block_Name.Rebuy_Trending_Product.name) {
          return ((globals.plugins.containsKey(PluginsEnum.REBUY.name) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.rebuyTrendingProductData!.plan!) &&
                  (element.rebuyTrendingProductData!.scheduleTime == null ||
                      isWithinInterval(
                          element.rebuyTrendingProductData!.scheduleTime!
                              .startDate!,
                          element.rebuyTrendingProductData!.scheduleTime!
                              .endDate!))))
              ? RebuyTrendingProduct(element.rebuyTrendingProductData!, (item) {
                  print("-----------34234-----${item}----------------");
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item["admin_graphql_api_id"]);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }
        if (element.blockName == Block_Name.Rebuy_Recommended_Product.name) {
          return ((globals.plugins.containsKey(PluginsEnum.REBUY.name) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.rebuyRecommendedProductData!.plan!) &&
                  (element.rebuyRecommendedProductData!.scheduleTime == null ||
                      isWithinInterval(
                          element.rebuyRecommendedProductData!.scheduleTime!
                              .startDate!,
                          element.rebuyRecommendedProductData!.scheduleTime!
                              .endDate!))))
              ? RebuyRecommendedProductView(
                  element.rebuyRecommendedProductData!, (item) {
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item["admin_graphql_api_id"]);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }
        if (element.blockName == Block_Name.Rebuy_Quick_View.name) {
          return ((globals.plugins.containsKey(PluginsEnum.REBUY.name) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.rebuyQuickViewData!.plan!) &&
                  (element.rebuyQuickViewData!.scheduleTime == null ||
                      isWithinInterval(
                          element.rebuyQuickViewData!.scheduleTime!.startDate!,
                          element.rebuyQuickViewData!.scheduleTime!.endDate!))))
              ? RebuyQuickView(element.rebuyQuickViewData!, (item) {
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item.id!);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }
        if (element.blockName == Block_Name.Rebuy_Top_Seller.name) {
          return ((globals.plugins.containsKey(PluginsEnum.REBUY.name) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.rebuyTopSellersData!.plan!) &&
                  (element.rebuyTopSellersData!.scheduleTime == null ||
                      isWithinInterval(
                          element.rebuyTopSellersData!.scheduleTime!.startDate!,
                          element
                              .rebuyTopSellersData!.scheduleTime!.endDate!))))
              ? RebuyTopSellerProductView(element.rebuyTopSellersData!, (item) {
                  ProductDetailsScreen productDetailsScreen =
                      ProductDetailsScreen(item["admin_graphql_api_id"]);
                  RouteGenerate.ManageUserClick(
                      context, "${Routes.productDetailsScreen}",
                      data: productDetailsScreen);
                })
              : Container();
        }

        if (element.blockName == Block_Name.Image_Gird.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.imageGridData!.planName!) &&
                  (element.imageGridData!.scheduleTime == null ||
                      isWithinInterval(
                          element.imageGridData!.scheduleTime!.startDate!,
                          element.imageGridData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetImageGridView(element.imageGridData!, (item) {
                  RouteGenerate.ManageUserClick(
                    context,
                    item.action!,
                    data: item,
                  );
                })
              : Container();
        }

        if (element.blockName == Block_Name.Smile_io.name) {
          return ((globals.plugins.containsKey(PluginsEnum.SMILEIO.name) &&
                  Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.smileIoData!.planName!) &&
                  (element.smileIoData!.scheduleTime == null ||
                      isWithinInterval(
                          element.smileIoData!.scheduleTime!.startDate!,
                          element.smileIoData!.scheduleTime!.endDate!))))
              ? SmileIoDashboardWidget(element.smileIoData!, () async {
                  bool? refresh = await (context.pushNamed(
                      "${Routes.loginScreen}",
                      pathParameters: {"goBack": false.toString()},
                      extra: null)) as bool;
                  if (refresh != null) {
                    if (refresh as bool) {
                      ShopifyUser? user = await Session().getLoginData();
                      SmileIoDashboardScreen smileIoDashboardScreen =
                          SmileIoDashboardScreen(true, email: user!.email!);
                      context.push("/${Routes.smileIoDashboardScreen}",
                          extra: smileIoDashboardScreen);
                    }
                  }
                })
              : Container();
        }

        if (element.blockName == Block_Name.Custom_Section.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.customSectionData!.planName!) &&
                  (element.customSectionData!.scheduleTime == null ||
                      isWithinInterval(
                          element.customSectionData!.scheduleTime!.startDate!,
                          element.customSectionData!.scheduleTime!.endDate!)))
              ? ItgeekCustomSectionWebViewWidget(element.customSectionData!)
              : Container();
        }

         if (element.blockName == Block_Name.Text_Grid.name) {
          return (Utils.checkPlan(globals.partnerInfoModel.planName!,
                      element.textGridData!.planName!) &&
                  (element.textGridData!.scheduleTime == null ||
                      isWithinInterval(
                          element.textGridData!.scheduleTime!.startDate!,
                          element.textGridData!.scheduleTime!.endDate!)))
              ? ItgeekWidgetTextGridView(element.textGridData!,(item){
                 RouteGenerate.ManageUserClick(
                    context,
                    item.action!,
                    data: item,
                  );
              })
              : Container();
        }


        /*
        if (element.view == Block_Name.Testimonials_Block.name) {
           return ItgeekWidgetFaq(element.testimonialsData!);
        }
        if (element.view == Block_Name.Image_Banner_Block.name) {
          return BestCategorys(element.imageWithTextData!);
        }
        if (element.view == Block_Name.Divider_Block.name) {
          return BestProductView("Feature Product",  (){}, element.divider!);
        }
        if (element.view == Block_Name.BannerImageView.name) {
          return ItgeekWidgetBannerImage(element.imageViewData!, (item) {
            (element.imageViewData);
            print("itemImageView $item");
          });
        }
        if (element.view == Block_Name.BannerButtonTextView.name) {
          return ItgeekWidgetBannerImageButton(element.buttonViewData!, (item) {
            (element.buttonViewData);

            if (item.actionType == ActionType.Route.name) {
              if (item.actionId == "becomeMemberScreen") {
                Navigator.pushNamed(context, RouteGenerate.becomeMemberScreen);
              } else if (item.actionId == "contactFormScreen") {
                Navigator.pushNamed(
                  context,
                  RouteGenerate.contactFormScreen,
                );
              }
            } else if (item.actionType == ActionType.Html.name) {
              print("donation clicked");

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebViewPagesScreen(
                        titleMain: "Donation",
                        urlToLoad: '',
                        bodyTags: FirebaseRemoteConfig.instance
                            .getString(item.actionId.toString()),
                      )));
            } else if (item.actionType == ActionType.Product.name) {
              print(
                  ".......................checking.........................${item.actionId}");

              Navigator.pushNamed(context, RouteGenerate.productDetailsScreen,
                  arguments: {item.actionId});
            }

            print("itemButtonView $item");
          });
        }
        if (element.view == Block_Name.BlogView.name) {
          print("Holder.....kkkkk...............");
          return FutureBuilder<Blog>(
            future: ShopifyBlog.instance.getBlogByHandle("news", 10), // async work
            builder: (BuildContext context, AsyncSnapshot<Blog> snapshot) {
              print("Holder.."+snapshot.toString());

              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return Text('Loading....');
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    print(".........................................");
                    print("Holder....................");
                    print(snapshot.data!.toJson());

                    List<dynamic> temp = [];
                    snapshot.data!.articles!.articleList!.forEach((element) {
                      temp.add(element.toJson());
                    });
                    return ItgeekWidgetBlogView(element.blogViewData!, (item) {
                      (element.blogViewData!);
                      print("itemBlogView $item");
                    }, temp);
                  }
              }
            },
          );
        }
*/
        return SizedBox.shrink();
      }).toList()),
    );
  }
}
