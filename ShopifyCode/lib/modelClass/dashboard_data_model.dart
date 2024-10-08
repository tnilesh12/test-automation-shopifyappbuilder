import '../../modelClass/data_model.dart';

// class DashboardDataModel {
//   List<BuilderJsonTheme1>? builderJsonTheme1;
//   DashboardDataModel({
//       this.builderJsonTheme1});
//   DashboardDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['BuilderJsonTheme1'] != null) {
//       builderJsonTheme1 = <BuilderJsonTheme1>[];
//       json['BuilderJsonTheme1'].forEach((v) {
//         builderJsonTheme1!.add(new BuilderJsonTheme1.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.builderJsonTheme1 != null) {
//       data['BuilderJsonTheme1'] = this.builderJsonTheme1!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class DashboardDataModel {
  List<DashboardDataItems>? dashboardDataItems;
  String? name;

  DashboardDataModel({this.dashboardDataItems, this.name});

  DashboardDataModel.fromJson(Map<String, dynamic> json) {
    if (json['page_json'] != null) {
      dashboardDataItems = <DashboardDataItems>[];
      json['page_json'].forEach((v) {
        dashboardDataItems!.add(new DashboardDataItems.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dashboardDataItems != null) {
      data['page_json'] =
          this.dashboardDataItems!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class DashboardDataItems {
  String? blockId;
  String? blockName;
  HeaderData? headerData;
  bool? bottomNavigationEnable;
  bool? menuNavigationEnable;
  List<BottomNavigationData>? bottomNavigationData;
  ImageBannerSliderData? imageBannerSliderData;
  SimpleImageSliderData? simpleImageSliderData;
  ScrollingTextData? scrollingTextData;
  CollectionGridData? collectionGridData;
  ProductGridData? productGridData;
  CountDownDate? countDownDate;
  TestimonialsData? testimonialsData;
  ImageWithTextData? imageWithTextData;
  DividerData? dividerData;
  IconTextData? iconTextData;
  VideoData? videoData;
  SearchData? searchData;
  ComparisonData? comparisonData;
  DiscountData? discountData;
  InstaData? instaData;
  FormBlockData? formBlockData;
  BlogSliderData? blogSliderData;
  ImageOnlyData? imageOnlyData;
  TextOnlyData? textOnlyData;
  SocialMediaLinksData? socialMediaLinksData;
  TextWithBackgroundImageData? textWithBackgroundImage;
  TextListData? textListData;
  ButtonOnlyData? buttonOnlyData;
  FAQData? faqData;
  FeaturedCollectionData? featuredCollectionData;
  MailChimpAddSectionData? mailChimpAddSectionData;
  KlaviyoSubscriptionFormsData? klaviyoSubscriptionFormsData;
  RebuyTrendingProductData? rebuyTrendingProductData;
  RebuyRecommendedProductData? rebuyRecommendedProductData;
  RebuyQuickViewData? rebuyQuickViewData;
  RebuyTopSellersData? rebuyTopSellersData;
  ImageGridData? imageGridData;
  RecentOrderThemeThirdData? recentOrderThemeThirdData;
  SmileIoData? smileIoData;
  CustomSectionData? customSectionData;
  TextGridData? textGridData;

  DashboardDataItems(
      {this.blockId,
      this.blockName,
      this.headerData,
      this.bottomNavigationEnable,
      this.menuNavigationEnable,
      this.bottomNavigationData,
      this.imageBannerSliderData,
      this.simpleImageSliderData,
      this.scrollingTextData,
      this.collectionGridData,
      this.productGridData,
      this.countDownDate,
      this.testimonialsData,
      this.imageWithTextData,
      this.dividerData,
      this.iconTextData,
      this.videoData,
      this.searchData,
      this.comparisonData,
      this.discountData,
      this.instaData,
      this.formBlockData,
      this.blogSliderData,
      this.faqData,
      this.imageOnlyData,
      this.textOnlyData,
      this.buttonOnlyData,
      this.socialMediaLinksData,
      this.textWithBackgroundImage,
      this.textListData,
      this.featuredCollectionData,
      this.mailChimpAddSectionData,
      this.klaviyoSubscriptionFormsData,
      this.rebuyTrendingProductData,
      this.rebuyRecommendedProductData,
      this.rebuyQuickViewData,
      this.rebuyTopSellersData,
      this.imageGridData,
      this.recentOrderThemeThirdData,
      this.smileIoData,
      this.customSectionData,
      this.textGridData});

  DashboardDataItems.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_Id'];
    blockName = json['Block_Name'];
    headerData = json['HeaderData'] != null
        ? new HeaderData.fromJson(json['HeaderData'])
        : null;
    bottomNavigationEnable = json['BottomNavigationEnable'];
    menuNavigationEnable = json['MenuNavigationEnable'];
    if (json['BottomNavigationData'] != null) {
      bottomNavigationData = <BottomNavigationData>[];
      json['BottomNavigationData'].forEach((v) {
        bottomNavigationData!.add(new BottomNavigationData.fromJson(v));
      });
    }
    imageBannerSliderData = json['ImageBannerSliderData'] != null
        ? new ImageBannerSliderData.fromJson(json['ImageBannerSliderData'])
        : null;
    simpleImageSliderData = json['ImageSliderData'] != null
        ? new SimpleImageSliderData.fromJson(json['ImageSliderData'])
        : null;
    scrollingTextData = json['ScrollingTextData'] != null
        ? new ScrollingTextData.fromJson(json['ScrollingTextData'])
        : null;
    collectionGridData = json['CollectionGridData'] != null
        ? new CollectionGridData.fromJson(json['CollectionGridData'])
        : null;
    productGridData = json['ProductGridData'] != null
        ? new ProductGridData.fromJson(json['ProductGridData'])
        : null;
    countDownDate = json['CountDownData'] != null
        ? new CountDownDate.fromJson(json['CountDownData'])
        : null;
    testimonialsData = json['TestimonialsData'] != null
        ? new TestimonialsData.fromJson(json['TestimonialsData'])
        : null;
    imageWithTextData = json['ImageWithTextData'] != null
        ? new ImageWithTextData.fromJson(json['ImageWithTextData'])
        : null;
    dividerData = json['Divider'] != null
        ? new DividerData.fromJson(json['Divider'])
        : null;
    iconTextData = json['IconTextData'] != null
        ? new IconTextData.fromJson(json['IconTextData'])
        : null;
    videoData = json['VideoData'] != null
        ? new VideoData.fromJson(json['VideoData'])
        : null;
    searchData = json['SearchData'] != null
        ? new SearchData.fromJson(json['SearchData'])
        : null;
    comparisonData = json['ComparisonData'] != null
        ? new ComparisonData.fromJson(json['ComparisonData'])
        : null;
    discountData = json['DiscountData'] != null
        ? new DiscountData.fromJson(json['DiscountData'])
        : null;
    instaData = json['InstaData'] != null
        ? new InstaData.fromJson(json['InstaData'])
        : null;
    formBlockData = json['FormData'] != null
        ? new FormBlockData.fromJson(json['FormData'])
        : null;
    imageOnlyData = json['ImageOnlyData'] != null
        ? new ImageOnlyData.fromJson(json['ImageOnlyData'])
        : null;
    textOnlyData = json['TextOnlyData'] != null
        ? new TextOnlyData.fromJson(json['TextOnlyData'])
        : null;
    socialMediaLinksData = json['SocialMediaLinksData'] != null
        ? new SocialMediaLinksData.fromJson(json['SocialMediaLinksData'])
        : null;
    textWithBackgroundImage = json['TextWithBackgroundImageData'] != null
        ? new TextWithBackgroundImageData.fromJson(
            json['TextWithBackgroundImageData'])
        : null;
    textListData = json['TextListData'] != null
        ? new TextListData.fromJson(json['TextListData'])
        : null;
    blogSliderData = json['BlogSliderData'] != null
        ? new BlogSliderData.fromJson(json['BlogSliderData'])
        : null;
    buttonOnlyData = json['ButtonOnlyData'] != null
        ? new ButtonOnlyData.fromJson(json['ButtonOnlyData'])
        : null;
    faqData =
        json['FAQData'] != null ? new FAQData.fromJson(json['FAQData']) : null;
    featuredCollectionData = json['Featured_Collection_Data'] != null
        ? new FeaturedCollectionData.fromJson(json['Featured_Collection_Data'])
        : null;
    mailChimpAddSectionData = json['MailChimpAddSectionData'] != null
        ? new MailChimpAddSectionData.fromJson(json['MailChimpAddSectionData'])
        : null;

    klaviyoSubscriptionFormsData = json['KlaviyoSubscriptionFormsData'] != null
        ? new KlaviyoSubscriptionFormsData.fromJson(
            json['KlaviyoSubscriptionFormsData'])
        : null;
    rebuyTrendingProductData = json['TrendingProductData'] != null
        ? new RebuyTrendingProductData.fromJson(json['TrendingProductData'])
        : null;
    rebuyRecommendedProductData = json['RecommendedProductData'] != null
        ? new RebuyRecommendedProductData.fromJson(
            json['RecommendedProductData'])
        : null;
    rebuyQuickViewData = json['QuickViewData'] != null
        ? new RebuyQuickViewData.fromJson(json['QuickViewData'])
        : null;
    rebuyTopSellersData = json['TopSellersData'] != null
        ? new RebuyTopSellersData.fromJson(json['TopSellersData'])
        : null;
    imageGridData = json['Image_Gird_Data'] != null
        ? new ImageGridData.fromJson(json['Image_Gird_Data'])
        : null;
    recentOrderThemeThirdData = json['RecentOrderThemeThirdData'] != null
        ? new RecentOrderThemeThirdData.fromJson(
            json['RecentOrderThemeThirdData'])
        : null;

    smileIoData = json['SmileIoData'] != null
        ? new SmileIoData.fromJson(json['SmileIoData'])
        : null;
    customSectionData = json['CustomSectionData'] != null
        ? new CustomSectionData.fromJson(json['CustomSectionData'])
        : null;
    textGridData = json['TextGridData'] != null
        ? new TextGridData.fromJson(json['TextGridData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Block_Id'] = this.blockId;
    data['Block_Name'] = this.blockName;
    if (this.headerData != null) {
      data['HeaderData'] = this.headerData!.toJson();
    }
    data['BottomNavigationEnable'] = this.bottomNavigationEnable;
    data['MenuNavigationEnable'] = this.menuNavigationEnable;
    if (this.bottomNavigationData != null) {
      data['BottomNavigationData'] =
          this.bottomNavigationData!.map((v) => v.toJson()).toList();
    }
    if (this.imageBannerSliderData != null) {
      data['ImageBannerSliderData'] = this.imageBannerSliderData!.toJson();
    }
    if (this.simpleImageSliderData != null) {
      data['ImageSliderData'] = this.simpleImageSliderData!.toJson();
    }
    if (this.scrollingTextData != null) {
      data['ScrollingTextData'] = this.scrollingTextData!.toJson();
    }
    if (this.collectionGridData != null) {
      data['CollectionGridData'] = this.collectionGridData!.toJson();
    }
    if (this.productGridData != null) {
      data['ProductGridData'] = this.productGridData!.toJson();
    }
    if (this.countDownDate != null) {
      data['CountDownData'] = this.countDownDate!.toJson();
    }
    if (this.testimonialsData != null) {
      data['TestimonialsData'] = this.testimonialsData!.toJson();
    }
    if (this.imageWithTextData != null) {
      data['ImageWithTextData'] = this.imageWithTextData!.toJson();
    }
    if (this.dividerData != null) {
      data['Divider'] = this.dividerData!.toJson();
    }
    if (this.iconTextData != null) {
      data['IconTextData'] = this.iconTextData!.toJson();
    }
    if (this.videoData != null) {
      data['VideoData'] = this.videoData!.toJson();
    }
    if (this.searchData != null) {
      data['SearchData'] = this.searchData!.toJson();
    }
    if (this.comparisonData != null) {
      data['ComparisonData'] = this.comparisonData!.toJson();
    }
    if (this.discountData != null) {
      data['DiscountData'] = this.discountData!.toJson();
    }
    if (this.instaData != null) {
      data['InstaData'] = this.instaData!.toJson();
    }
    if (this.formBlockData != null) {
      data['FormData'] = this.formBlockData!.toJson();
    }
    if (this.imageOnlyData != null) {
      data['ImageOnlyData'] = this.imageOnlyData!.toJson();
    }
    if (this.textOnlyData != null) {
      data['TextOnlyData'] = this.textOnlyData!.toJson();
    }
    if (this.socialMediaLinksData != null) {
      data['SocialMediaLinksData'] = this.socialMediaLinksData!.toJson();
    }
    if (this.textWithBackgroundImage != null) {
      data['TextWithBackgroundImageData'] =
          this.textWithBackgroundImage!.toJson();
    }
    if (this.textListData != null) {
      data['TextListData'] = this.textListData!.toJson();
    }
    if (this.blogSliderData != null) {
      data['BlogSliderData'] = this.blogSliderData!.toJson();
    }
    if (this.buttonOnlyData != null) {
      data['ButtonOnlyData'] = this.buttonOnlyData!.toJson();
    }
    if (this.faqData != null) {
      data['FAQData'] = this.faqData!.toJson();
    }
    if (this.featuredCollectionData != null) {
      data['Featured_Collection_Data'] = this.featuredCollectionData!.toJson();
    }
    if (this.mailChimpAddSectionData != null) {
      data['MailChimpAddSectionData'] = this.mailChimpAddSectionData!.toJson();
    }
    if (this.klaviyoSubscriptionFormsData != null) {
      data['KlaviyoSubscriptionFormsData'] =
          this.klaviyoSubscriptionFormsData!.toJson();
    }
    if (this.rebuyTrendingProductData != null) {
      data['TrendingProductData'] = this.rebuyTrendingProductData!.toJson();
    }
    if (this.rebuyRecommendedProductData != null) {
      data['RecommendedProductData'] =
          this.rebuyRecommendedProductData!.toJson();
    }
    if (this.rebuyQuickViewData != null) {
      data['QuickViewData'] = this.rebuyQuickViewData!.toJson();
    }
    if (this.rebuyTopSellersData != null) {
      data['TopSellersData'] = this.rebuyTopSellersData!.toJson();
    }
    if (this.imageGridData != null) {
      data['Image_Gird_Data'] = this.imageGridData!.toJson();
    }
    if (this.recentOrderThemeThirdData != null) {
      data['RecentOrderThemeThirdData'] =
          this.recentOrderThemeThirdData!.toJson();
    }
    if (this.smileIoData != null) {
      data['SmileIoData'] = this.smileIoData!.toJson();
    }
    if (this.customSectionData != null) {
      data['CustomSectionData'] = this.customSectionData!.toJson();
    }
    if (this.textGridData != null) {
      data['TextGridData'] = this.textGridData!.toJson();
    }
    return data;
  }
}
