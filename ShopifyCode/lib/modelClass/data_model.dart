import 'package:flutter/src/material/icon_button.dart';
import 'package:shopify_code/modelClass/src/article/author_v_2/author_v_2.dart';
import 'package:shopify_code/modelClass/src/article/comment/comment.dart';
import 'package:shopify_code/modelClass/src/product/price_v_2/price_v_2.dart';
import 'package:shopify_code/modelClass/src/product/shopify_image/shopify_image.dart';

class HeaderData {
  String? storeLogoSrc;
  int? logoWidth;
  String? menuIconSrc;
  bool? menuIconStatus;
  String? heading;
  String? userIconSrc;
  bool? userIconStatus;
  String? userIconID;
  String? userIconTitle;
  String? userIconAction;
  bool? cartIconStatus;
  String? cartIconSrc;
  String? cartIconID;
  String? cartIconTitle;
  String? cartIconAction;

  HeaderData(
      {this.storeLogoSrc,
      this.logoWidth,
      this.menuIconSrc,
      this.menuIconStatus,
      this.userIconSrc,
      this.userIconStatus,
      this.cartIconSrc,
      this.cartIconStatus,
      this.heading,
      this.userIconID,
      this.userIconTitle,
      this.userIconAction,
      this.cartIconID,
      this.cartIconTitle,
      this.cartIconAction});

  HeaderData.fromJson(Map<String, dynamic> json) {
    storeLogoSrc = json['StoreLogoSrc'];
    logoWidth = json['LogoWidth'];
    menuIconSrc = json['MenuIconSrc'];
    menuIconStatus = json['MenuIconStatus'];
    userIconSrc = json['UserIconSrc'];
    userIconStatus = json['UserIconStatus'];
    cartIconSrc = json['CartIconSrc'];
    cartIconStatus = json['CartIconStatus'];
    heading = json['Heading'];
    userIconID = json['UserIconID'];
    userIconTitle = json['UserIconTitle'];
    userIconAction = json['UserIconAction'];
    cartIconID = json['CartIconID'];
    cartIconTitle = json['CartIconTitle'];
    cartIconAction = json['CartIconAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StoreLogoSrc'] = this.storeLogoSrc;
    data['LogoWidth'] = this.logoWidth;
    data['MenuIconSrc'] = this.menuIconSrc;
    data['MenuIconStatus'] = this.menuIconStatus;
    data['UserIconSrc'] = this.userIconSrc;
    data['UserIconStatus'] = this.userIconStatus;
    data['CartIconSrc'] = this.cartIconSrc;
    data['CartIconStatus'] = this.cartIconStatus;
    data['Heading'] = this.heading;
    data['UserIconID'] = this.userIconID;
    data['UserIconTitle'] = this.userIconTitle;
    data['UserIconAction'] = this.userIconAction;
    data['CartIconID'] = this.cartIconID;
    data['CartIconTitle'] = this.cartIconTitle;
    data['CartIconAction'] = this.cartIconAction;
    return data;
  }
}

class BottomNavigationData {
  String? title;
  String? iconSrc;
  String? action;
  String? id;
  String? productTitle;

  BottomNavigationData(
      {this.title, this.iconSrc, this.action, this.id, this.productTitle});

  BottomNavigationData.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    iconSrc = json['IconSrc'];
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['IconSrc'] = this.iconSrc;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    return data;
  }
}

class ImageBannerSliderData {
  String? planName;
  String? slideHeight;
  String? autoSwitchSlides;
  int? changeSlidesEvery;
  String? backgroundColor;
  String? textColor;
  ScheduleTime? scheduleTime;
  List<ImageBanner>? imageBanner;

  ImageBannerSliderData(
      {this.slideHeight,
      this.autoSwitchSlides,
      this.changeSlidesEvery,
      this.backgroundColor,
      this.textColor,
      this.imageBanner,
      this.scheduleTime,
      this.planName});

  ImageBannerSliderData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    slideHeight = json['SlideHeight'];
    autoSwitchSlides = json['AutoSwitchSlides'].toString();
    changeSlidesEvery = json['ChangeSlidesEvery'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    if (json['ImageBanner'] != null) {
      imageBanner = <ImageBanner>[];
      json['ImageBanner'].forEach((v) {
        imageBanner!.add(new ImageBanner.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['SlideHeight'] = this.slideHeight;
    data['AutoSwitchSlides'] = this.autoSwitchSlides;
    data['ChangeSlidesEvery'] = this.changeSlidesEvery;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    if (this.imageBanner != null) {
      data['ImageBanner'] = this.imageBanner!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class ImageBanner {
  String? planName;
  String? imageSrc;
  String? subheading;
  String? heading;
  String? primarybuttonlabel;
  String? primarybuttonlink;
  String? secondarybuttonlabel;
  String? secondarybuttonlink;
  String? productTitlePrimary;
  String? productTitleSecondary;
  String? primarybtnId;
  String? secondarybtnId;
  bool? primarybtnStatus;
  bool? secondarybtnStatus;
  String? type;
  String? videoLink;
  bool? autoPlay;
  bool? loop;

  ImageBanner(
      {this.imageSrc,
      this.subheading,
      this.heading,
      this.primarybuttonlabel,
      this.primarybuttonlink,
      this.secondarybuttonlabel,
      this.secondarybuttonlink,
      this.productTitlePrimary,
      this.productTitleSecondary,
      this.primarybtnId,
      this.secondarybtnId,
      this.primarybtnStatus,
      this.secondarybtnStatus,
      this.planName,
      this.type,
      this.videoLink,
      this.autoPlay,
      this.loop});

  ImageBanner.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    imageSrc = json['ImageSrc'];
    subheading = json['Subheading'];
    heading = json['Heading'];
    primarybuttonlabel = json['Primarybuttonlabel'];
    primarybuttonlink = json['Primarybuttonlink'];
    secondarybuttonlabel = json['Secondarybuttonlabel'];
    secondarybuttonlink = json['Secondarybuttonlink'];
    productTitlePrimary = json['productTitlePrimary'];
    productTitleSecondary = json['productTitleSecondary'];
    primarybtnId = json['PrimarybtnId'];
    secondarybtnId = json['SecondarybtnId'];
    primarybtnStatus = json['PrimarybuttonStatus'];
    secondarybtnStatus = json['SecondarybuttonStatus'];
    type = json['type'];
    videoLink = json['videoLink'];
    autoPlay = json['autoPlay'];
    loop = json['loop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['ImageSrc'] = this.imageSrc;
    data['Subheading'] = this.subheading;
    data['Heading'] = this.heading;
    data['Primarybuttonlabel'] = this.primarybuttonlabel;
    data['Primarybuttonlink'] = this.primarybuttonlink;
    data['Secondarybuttonlabel'] = this.secondarybuttonlabel;
    data['Secondarybuttonlink'] = this.secondarybuttonlink;
    data['productTitlePrimary'] = this.productTitlePrimary;
    data['productTitleSecondary'] = this.productTitleSecondary;
    data['PrimarybtnId'] = this.primarybtnId;
    data['SecondarybtnId'] = this.secondarybtnId;
    data['PrimarybuttonStatus'] = this.primarybtnStatus;
    data['SecondarybuttonStatus'] = this.secondarybtnStatus;
    data['type'] = this.type;
    data['videoLink'] = this.videoLink;
    data['autoPlay'] = this.autoPlay;
    data['loop'] = this.loop;
    return data;
  }
}

class SimpleImageSliderData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? style;
  int? height;
  String? backgroundColor;
  List<SimpleImageSlider>? simpleImageSlider;

  SimpleImageSliderData(
      {this.planName,
      this.scheduleTime,
      this.style,
      this.height,
      this.backgroundColor,
      this.simpleImageSlider});

  SimpleImageSliderData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    style = json['style'];
    height = json['height'];
    backgroundColor = json['background_color'];
    if (json['ImageSlider'] != null) {
      simpleImageSlider = <SimpleImageSlider>[];
      json['ImageSlider'].forEach((v) {
        simpleImageSlider!.add(new SimpleImageSlider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['style'] = this.style;
    data['height'] = this.height;
    data['background_color'] = this.backgroundColor;
    if (this.simpleImageSlider != null) {
      data['ImageSlider'] =
          this.simpleImageSlider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SimpleImageSlider {
  String? imageSrc;
  String? videoLink;
  String? type;
  bool? autoPlay;
  bool? loop;

  SimpleImageSlider(
      {this.imageSrc, this.videoLink, this.type, this.autoPlay, this.loop});

  SimpleImageSlider.fromJson(Map<String, dynamic> json) {
    imageSrc = json['ImageSrc'];
    type = json['type'];
    videoLink = json['videoLink'];
    autoPlay = json['autoPlay'];
    loop = json['loop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSrc'] = this.imageSrc;
    data['videoLink'] = this.videoLink;
    data['type'] = this.type;
    data['autoPlay'] = this.autoPlay;
    data['loop'] = this.loop;
    return data;
  }
}

class ScrollingTextData {
  String? planName;
  int? scrollingSpeed;
  List<ScrollingList>? scrollingList;
  ScheduleTime? scheduleTime;
  String? style;

  ScrollingTextData(
      {this.scrollingSpeed,
      this.scrollingList,
      this.scheduleTime,
      this.planName,
      this.style});

  ScrollingTextData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scrollingSpeed = json['ScrollingSpeed'];
    if (json['ScrollingList'] != null) {
      scrollingList = <ScrollingList>[];
      json['ScrollingList'].forEach((v) {
        scrollingList!.add(new ScrollingList.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    style = json['style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['ScrollingSpeed'] = this.scrollingSpeed;
    if (this.scrollingList != null) {
      data['ScrollingList'] =
          this.scrollingList!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['style'] = this.style;
    return data;
  }
}

class ScrollingList {
  String? text;
  String? action;
  String? id;
  String? productTitle;
  String? textColor;
  String? backgroundColor;

  ScrollingList(
      {this.text,
      this.action,
      this.id,
      this.productTitle,
      this.textColor,
      this.backgroundColor});

  ScrollingList.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
    textColor = json['Text_Color'];
    backgroundColor = json['BackgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Text'] = this.text;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['Text_Color'] = this.textColor;
    data['BackgroundColor'] = this.backgroundColor;
    return data;
  }
}

class CollectionGridData {
  String? planName;
  String? heading;
  bool? enableSlider;
  int? columns;
  int? rows;
  bool? viewAll;
  List<CollectionList>? collectionList;
  ScheduleTime? scheduleTime;
  String? style;
  String? containerColor;
  String? textColor;
  String? cellTextColor;
  String? cellColor;
  int? marginTopBottom;
  int? marginLeftRight;
  int? buttonRadius;
  int? blockRadius;

  CollectionGridData(
      {this.heading,
      this.enableSlider,
      this.columns,
      this.rows,
      this.viewAll,
      this.collectionList,
      this.scheduleTime,
      this.planName,
      this.style,
      this.containerColor,
      this.textColor,
      this.cellTextColor,
      this.cellColor,
      this.marginTopBottom,
      this.marginLeftRight,
      this.buttonRadius,
      this.blockRadius});

  CollectionGridData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    enableSlider = json['Enable_Slider']; //bool.parse(json['Enable_Slider']);
    columns = json['Columns'];
    rows = json['Rows'];
    viewAll = json['view_all'];
    if (json['CollectionList'] != null) {
      collectionList = <CollectionList>[];
      json['CollectionList'].forEach((v) {
        collectionList!.add(new CollectionList.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    style = json['style'];
    containerColor = json['Container_color'];
    textColor = json['Text_color'];
    cellTextColor = json['Cell_Text_color'];
    cellColor = json['Cell_color'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    buttonRadius = json['buttonRadius'];
    blockRadius = json['blockRadius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['Enable_Slider'] = this.enableSlider;
    data['Columns'] = this.columns;
    data['Rows'] = this.rows;
    data['view_all'] = this.viewAll;
    if (this.collectionList != null) {
      data['CollectionList'] =
          this.collectionList!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['style'] = this.style;
    data['Container_color'] = this.containerColor;
    data['Text_color'] = this.textColor;
    data['Cell_Text_color'] = this.cellTextColor;
    data['Cell_color'] = this.cellColor;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['buttonRadius'] = this.buttonRadius;
    data['blockRadius'] = this.blockRadius;
    return data;
  }
}

class CollectionList {
  String? imageSrc;
  String? productTitle;
  String? action;
  String? id;

  CollectionList({this.imageSrc, this.productTitle, this.action, this.id});

  CollectionList.fromJson(Map<String, dynamic> json) {
    imageSrc = json['ImageSrc'];
    productTitle = json['productTitle'];
    action = json['Action'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSrc'] = this.imageSrc;
    data['productTitle'] = this.productTitle;
    data['Action'] = this.action;
    data['id'] = this.id;
    return data;
  }
}

class ProductGridData {
  String? planName;
  String? heading;
  bool? enableSlider;
  int? columns;
  int? show;
  bool? viewAll;
  String? imageRatio;
  List<ProductList>? productList;
  int? rows;
  ScheduleTime? scheduleTime;
  String? style;
  String? containerColor;
  String? cellTextColor;
  String? textColor;
  String? cellColor;
  String? buyNowBackgroundColor;
  String? buyNowForegroundColor;

  ProductGridData({
    this.heading,
    this.enableSlider,
    this.columns,
    this.show,
    this.viewAll,
    this.imageRatio,
    this.productList,
    this.rows,
    this.scheduleTime,
    this.planName,
    this.style,
    this.containerColor,
    this.cellTextColor,
    this.textColor,
    this.cellColor,
    this.buyNowBackgroundColor,
    this.buyNowForegroundColor,
  });

  ProductGridData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    enableSlider = bool.parse(json['Enable_Slider'].toString());
    columns = json['Columns'];
    show = json['Show'];
    viewAll = json['view_all'];
    imageRatio = json['Image_Ratio'];
    if (json['ProductList'] != null) {
      productList = <ProductList>[];
      json['ProductList'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    rows = json['Rows'];
    style = json['style'];
    containerColor = json['container_color'];
    cellTextColor = json['Cell_Text_color'];
    textColor = json['textColor'];
    cellColor = json['cellColor'];
    buyNowBackgroundColor = json['buy_now_background_color'];
    buyNowForegroundColor = json['buy_now_foreground_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['Enable_Slider'] = this.enableSlider;
    data['Columns'] = this.columns;
    data['Show'] = this.show;
    data['view_all'] = this.viewAll;
    data['Image_Ratio'] = this.imageRatio;
    if (this.productList != null) {
      data['ProductList'] = this.productList!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['Rows'] = this.rows;
    data['style'] = this.style;
    data['container_color'] = this.containerColor;
    data['Cell_Text_color'] = this.cellTextColor;
    data['textColor'] = this.textColor;
    data['cellColor'] = this.cellColor;
    data['buy_now_background_color'] = this.buyNowBackgroundColor;
    data['buy_now_foreground_color'] = this.buyNowForegroundColor;
    return data;
  }
}

class ProductList {
  String? imageSrc;
  String? productTitle;
  String? action;
  String? id;
  String? category;
  // int? ratings;
  PriceV2? discountedPrice;
  PriceV2? price;

  ProductList(
      {this.imageSrc,
      this.productTitle,
      this.action,
      this.id,
      this.category,
      // this.ratings,
      this.discountedPrice,
      this.price});

  ProductList.fromJson(Map<String, dynamic> json) {
    imageSrc = json['ImageSrc'];
    productTitle = json['productTitle'];
    action = json['Action'];
    id = json['id'];
    category = json['category'];
    // ratings = json['ratings'];
    try {
      discountedPrice = json['discountedPrice'] != null
          ? PriceV2.fromJson(json['discountedPrice'])
          : null;
    } catch (e) {
      discountedPrice = null;
    }
    try {
      price = json['price'] != null ? PriceV2.fromJson(json['price']) : null;
    } catch (e) {
      price = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSrc'] = this.imageSrc;
    data['productTitle'] = this.productTitle;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['category'] = this.category;
    // data['ratings'] = this.ratings;
    if (this.discountedPrice != null) {
      data['discountedPrice'] = this.discountedPrice!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class CountDownDate {
  String? planName;
  String? heading;
  String? date;
  String? time;
  bool? scheduleEnable;
  String? timeZone;
  String? style;
  String? bodyText;
  String? backgroundColor;
  String? textColor;
  String? cellColor;
  String? cellTextColor;
  ScheduleTime? scheduleTime;

  CountDownDate(
      {this.planName,
      this.heading,
      this.date,
      this.time,
      this.scheduleEnable,
      this.timeZone,
      this.style,
      this.bodyText,
      this.backgroundColor,
      this.textColor,
      this.cellColor,
      this.cellTextColor,
      this.scheduleTime});

  CountDownDate.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    date = json['date'];
    time = json['time'];
    scheduleEnable = json['ScheduleEnable'];
    timeZone = json['TimeZone'];
    style = json['style'];
    bodyText = json['bodyText'];
    backgroundColor = json['BackgroundColor'];
    textColor = json['TextColor'];
    cellColor = json['CellColor'];
    cellTextColor = json['CellTextColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['date'] = this.date;
    data['time'] = this.time;
    data['ScheduleEnable'] = this.scheduleEnable;
    data['TimeZone'] = this.timeZone;
    data['style'] = this.style;
    data['bodyText'] = this.bodyText;
    data['BackgroundColor'] = this.backgroundColor;
    data['TextColor'] = this.textColor;
    data['CellColor'] = this.cellColor;
    data['CellTextColor'] = this.cellTextColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class TestimonialsData {
  String? planName;
  String? backgroundColor;
  String? textColor;
  List<TestimonialsList>? testimonialsList;
  ScheduleTime? scheduleTime;

  TestimonialsData({this.testimonialsList, this.scheduleTime, this.planName});

  TestimonialsData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    if (json['TestimonialsList'] != null) {
      testimonialsList = <TestimonialsList>[];
      json['TestimonialsList'].forEach((v) {
        testimonialsList!.add(new TestimonialsList.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    if (this.testimonialsList != null) {
      data['TestimonialsList'] =
          this.testimonialsList!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class TestimonialsList {
  String? quote;
  String? authorDesignation;
  String? authorName;
  String? authorHeading;

  TestimonialsList(
      {this.quote,
      this.authorDesignation,
      this.authorName,
      this.authorHeading});

  TestimonialsList.fromJson(Map<String, dynamic> json) {
    quote = json['Quote'];
    authorDesignation = json['Author_designation'];
    authorName = json['Author_name'];
    authorHeading =
        json.containsKey('Author_heading') ? json['Author_heading'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Quote'] = this.quote;
    data['Author_designation'] = this.authorDesignation;
    data['Author_name'] = this.authorName;
    data['Author_heading'] = this.authorHeading;
    return data;
  }
}

class ImageWithTextData {
  String? planName;
  String? image;
  String? subheading;
  String? heading;
  String? description;
  String? buttonLabel;
  String? productTitle;
  String? action;
  String? id;
  ScheduleTime? scheduleTime;

  ImageWithTextData(
      {this.image,
      this.subheading,
      this.heading,
      this.description,
      this.buttonLabel,
      this.productTitle,
      this.action,
      this.id,
      this.scheduleTime,
      this.planName});

  ImageWithTextData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    image = json['ImageSrc'];
    subheading = json['Subheading'];
    heading = json['Heading'];
    description = json['Description'];
    buttonLabel = json['Button_label'];
    productTitle = json['productTitle'];
    action = json['Action'];
    id = json['id'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['ImageSrc'] = this.image;
    data['Subheading'] = this.subheading;
    data['Heading'] = this.heading;
    data['Description'] = this.description;
    data['Button_label'] = this.buttonLabel;
    data['productTitle'] = this.productTitle;
    data['Action'] = this.action;
    data['id'] = this.id;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class DividerData {
  String? planName;
  int? space;
  int? thickness;
  String? color;
  ScheduleTime? scheduleTime;

  DividerData(
      {this.space,
      this.thickness,
      this.color,
      this.scheduleTime,
      this.planName});

  DividerData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    space = json['Space'];
    thickness = json['thickness'];
    color = json['color'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Space'] = this.space;
    data['thickness'] = this.thickness;
    data['color'] = this.color;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class InstaData {
  String? planName;
  String? accessToken;
  ScheduleTime? scheduleTime;
  String? heading;
  int? columns;
  int? rows;

  InstaData(
      {this.accessToken,
      this.scheduleTime,
      this.heading,
      this.columns,
      this.rows,
      this.planName});

  InstaData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    accessToken = json['accessToken'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    heading = json['Heading'];
    columns = json['Columns'];
    rows = json['Rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['accessToken'] = this.accessToken;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['Heading'] = this.heading;
    data['Columns'] = this.columns;
    data['Rows'] = this.rows;
    return data;
  }
}

class IconTextData {
  String? planName;
  String? style;
  String? backgroundColor;
  int? height;
  int? width;
  List<IconWithTextList>? iconWithTextList;
  ScheduleTime? scheduleTime;

  IconTextData(
      {this.planName,
      this.style,
      this.scheduleTime,
      this.backgroundColor,
      this.height,
      this.width,
      this.iconWithTextList});

  IconTextData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    style = json['style'];
    height = json['height'] ?? 30;
    width = json['width'] ?? 40;
    if (json['IconWithTextList'] != null) {
      iconWithTextList = <IconWithTextList>[];
      json['IconWithTextList'].forEach((v) {
        iconWithTextList!.add(new IconWithTextList.fromJson(v));
      });
    }
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['style'] = this.style;
    data['height'] = this.height;
    data['width'] = this.width;
    if (this.iconWithTextList != null) {
      data['IconWithTextList'] =
          this.iconWithTextList!.map((v) => v.toJson()).toList();
    }
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['backgroundColor'] = this.backgroundColor;
    return data;
  }
}

class IconWithTextList {
  String? title;
  String? iconSrc;
  String? imageSrc;
  String? description;
  String? textColor;
  String? backgroundColor;

  IconWithTextList(
      {this.title,
      this.iconSrc,
      this.imageSrc,
      this.description,
      this.textColor,
      this.backgroundColor});

  IconWithTextList.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    iconSrc = json['IconSrc'];
    imageSrc = json['ImageSrc'];
    description = json['Description'];
    textColor = json['TextColor'];
    backgroundColor = json['BackgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['IconSrc'] = this.iconSrc;
    data['ImageSrc'] = this.imageSrc;
    data['Description'] = this.description;
    data['TextColor'] = this.textColor;
    data['BackgroundColor'] = this.backgroundColor;
    return data;
  }
}

class VideoData {
  String? planName;
  String? heading;
  String? uRL;
  String? coverImage;
  bool? autoplay;
  String? description;
  bool? loop;
  bool? controls;
  String? videoAltText;
  String? backgroundColor;
  String? textColor;
  int? height;
  ScheduleTime? scheduleTime;

  VideoData(
      {this.planName,
      this.description,
      this.heading,
      this.uRL,
      this.coverImage,
      this.autoplay,
      this.loop,
      this.controls,
      this.videoAltText,
      this.backgroundColor,
      this.textColor,
      this.height,
      this.scheduleTime});

  VideoData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    description = json['description'] ?? "";
    uRL = json['URL'];
    coverImage = json['Cover_Image'];
    autoplay = json['Autoplay'];
    loop = json['loop'];
    controls = json['controls'];
    videoAltText = json['VideoAltText'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    height = json['height'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['description'] = this.description;
    data['URL'] = this.uRL;
    data['Cover_Image'] = this.coverImage;
    data['Autoplay'] = this.autoplay;
    data['loop'] = this.loop;
    data['controls'] = this.controls;
    data['VideoAltText'] = this.videoAltText;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    data['height'] = this.height;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class SearchData {
  String? planName;
  String? heading;
  String? suffixIcon;
  String? prefixIcon;
  bool? suffixIconStatus;
  bool? prefixIconStatus;
  String? borderColor;
  String? iconColor;
  String? backgroundColor;
  String? textColor;
  ScheduleTime? scheduleTime;

  SearchData(
      {this.heading,
      this.suffixIcon,
      this.prefixIcon,
      this.suffixIconStatus,
      this.prefixIconStatus,
      this.borderColor,
      this.iconColor,
      this.scheduleTime,
      this.planName,
      this.backgroundColor,
      this.textColor});

  SearchData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    suffixIcon = json['SuffixIcon'];
    prefixIcon = json['PrefixIcon'];
    suffixIconStatus = json['SuffixIconStatus'];
    prefixIconStatus = json['PrefixIconStatus'];
    borderColor = json['borderColor'];
    iconColor = json['IconColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['SuffixIcon'] = this.suffixIcon;
    data['PrefixIcon'] = this.prefixIcon;
    data['SuffixIconStatus'] = this.suffixIconStatus;
    data['PrefixIconStatus'] = this.prefixIconStatus;
    data['borderColor'] = this.borderColor;
    data['IconColor'] = this.iconColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class ComparisonData {
  String? planName;
  String? heading;
  String? beforeImageSrc;
  String? afterImageSrc;
  String? imageHeight;
  String? backgroundColor;
  String? textColor;
  ScheduleTime? scheduleTime;

  ComparisonData(
      {this.heading,
      this.beforeImageSrc,
      this.afterImageSrc,
      this.imageHeight,
      this.scheduleTime,
      this.planName,
      this.backgroundColor,
      this.textColor});

  ComparisonData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    heading = json['Heading'];
    beforeImageSrc = json['Before_Image_src'];
    afterImageSrc = json['After_Image_src'];
    imageHeight = json['Image_height'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['Heading'] = this.heading;
    data['Before_Image_src'] = this.beforeImageSrc;
    data['After_Image_src'] = this.afterImageSrc;
    data['Image_height'] = this.imageHeight;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class DiscountData {
  String? planName;
  String? backgroundColor;
  String? textColor;
  List<DiscountList>? discountList;
  ScheduleTime? scheduleTime;

  DiscountData({this.discountList, this.scheduleTime, this.planName});

  DiscountData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    if (json['DiscountList'] != null) {
      discountList = <DiscountList>[];
      json['DiscountList'].forEach((v) {
        discountList!.add(new DiscountList.fromJson(v));
      });
    }
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.discountList != null) {
      data['DiscountList'] = this.discountList!.map((v) => v.toJson()).toList();
    }
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class DiscountList {
  String? title;
  String? imageSrc;
  String? description;

  DiscountList({this.title, this.imageSrc, this.description});

  DiscountList.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    imageSrc = json['ImageSrc'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['ImageSrc'] = this.imageSrc;
    data['Description'] = this.description;
    return data;
  }
}

class FormBlockData {
  String? planName;
  String? formId;
  bool? show;
  String? backgroundColor;
  String? textColor;
  ScheduleTime? scheduleTime;

  FormBlockData(
      {this.formId,
      this.show,
      this.backgroundColor,
      this.textColor,
      this.scheduleTime,
      this.planName});

  FormBlockData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    formId = json['formId'];
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['formId'] = this.formId;
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    return data;
  }
}

class ScheduleTime {
  String? startDate;
  String? endDate;
  bool? showWholeComponent;

  ScheduleTime({this.startDate, this.endDate, this.showWholeComponent});

  ScheduleTime.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'] ?? "";
    endDate = json['EndDate'] ?? "";
    showWholeComponent = json['ShowWholeComponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['ShowWholeComponent'] = this.showWholeComponent;
    return data;
  }
}

class BlogSliderData {
  String? planName;
  ScheduleTime? scheduleTime;
  List<BlogViewItem>? blogList;
  bool? show;
  String? backgroundColor;
  String? textColor;

  BlogSliderData(
      {this.scheduleTime,
      this.blogList,
      this.show,
      this.backgroundColor,
      this.textColor,
      this.planName});

  BlogSliderData.fromJson(Map<String, dynamic> json) {
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    if (json['BlogList'] != null) {
      blogList = <BlogViewItem>[];
      json['BlogList'].forEach((v) {
        if (v["node"] != null) {
          blogList!.add(new BlogViewItem.fromJson(v["node"]));
        } else {
          blogList!.add(new BlogViewItem.fromJson(v));
        }
      });
    }
    planName = json['plan'];
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    if (this.blogList != null) {
      data['BlogList'] = this.blogList!.map((v) => v.toJson()).toList();
    }
    data['plan'] = this.planName;
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class BlogViewItem {
  AuthorV2? authorV2;
  Comment? comments;
  String? content;
  String? contentHtml;
  String? excerpt;
  String? excerptHtml;
  String? handle;
  String? id;
  ShopifyImage? image;
  String? publishedAt;
  // List<String>? tags;
  String? title;

  BlogViewItem(
      {this.authorV2,
      this.comments,
      this.content,
      this.contentHtml,
      this.excerpt,
      this.excerptHtml,
      this.handle,
      this.id,
      this.image,
      this.publishedAt,
      // this.tags,
      this.title});

  BlogViewItem.fromJson(Map<String, dynamic> json) {
    authorV2 = json['authorV2'] != null
        ? new AuthorV2.fromJson(json['authorV2'])
        : null;
    comments = json['comments'] != null
        ? new Comment.fromJson(json['comments'])
        : null;
    content = json['content'];
    contentHtml = json['contentHtml'];
    excerpt = json['excerpt'];
    excerptHtml = json['excerptHtml'];
    handle = json['handle'];
    id = json['id'];
    image =
        json['image'] != null ? new ShopifyImage.fromJson(json['image']) : null;
    publishedAt = json['publishedAt'];
    // if (json['tags'] != null) {
    //   tags = <String>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorV2 != null) {
      data['authorV2'] = this.authorV2!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    data['content'] = this.content;
    data['contentHtml'] = this.contentHtml;
    data['excerpt'] = this.excerpt;
    data['excerptHtml'] = this.excerptHtml;
    data['handle'] = this.handle;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['publishedAt'] = this.publishedAt;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    data['title'] = this.title;
    return data;
  }
}

class FAQData {
  String? planName;
  ScheduleTime? scheduleTime;
  List<QuestionAndAnswerList>? questionAndAnswerList;
  bool? show;
  String? heading;
  String? backgroundColor;
  String? textColor;

  FAQData(
      {this.scheduleTime,
      this.questionAndAnswerList,
      this.show,
      this.heading,
      this.backgroundColor,
      this.textColor,
      this.planName});

  FAQData.fromJson(Map<String, dynamic> json) {
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    if (json['QuestionAndAnswereList'] != null) {
      questionAndAnswerList = <QuestionAndAnswerList>[];
      json['QuestionAndAnswereList'].forEach((v) {
        questionAndAnswerList!.add(new QuestionAndAnswerList.fromJson(v));
      });
    }
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    heading = json['heading'];
    textColor = json['textColor'];
    planName = json['plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    if (this.questionAndAnswerList != null) {
      data['QuestionAndAnswereList'] =
          this.questionAndAnswerList!.map((v) => v.toJson()).toList();
    }
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['heading'] = this.heading;
    data['textColor'] = this.textColor;
    data['plan'] = this.planName;
    return data;
  }
}

class QuestionAndAnswerList {
  String? id;
  String? question;
  String? answer;
  bool? expand;

  QuestionAndAnswerList({this.id, this.question, this.answer});

  QuestionAndAnswerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answere'];
    expand = json['expand'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answere'] = this.answer;
    data['expand'] = this.expand;
    return data;
  }
}

class ImageOnlyData {
  String? planName;
  ScheduleTime? scheduleTime;
  bool? show;
  String? action;
  String? id;
  String? productTitle;
  String? backgroundColor;
  String? actionLink;
  String? imageSrc;
  int? marginTopBottom;
  int? marginLeftRight;
  int? borderRadius;

  ImageOnlyData(
      {this.planName,
      this.scheduleTime,
      this.show,
      this.action,
      this.id,
      this.productTitle,
      this.backgroundColor,
      this.actionLink,
      this.imageSrc,
      this.marginTopBottom,
      this.marginLeftRight,
      this.borderRadius});

  ImageOnlyData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    show = json['show'];
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
    backgroundColor = json['backgroundColor'];
    actionLink = json['actionLink'];
    imageSrc = json['ImageSrc'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    borderRadius = json['borderRadius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['show'] = this.show;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['backgroundColor'] = this.backgroundColor;
    data['actionLink'] = this.actionLink;
    data['ImageSrc'] = this.imageSrc;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['borderRadius'] = this.borderRadius;
    return data;
  }
}

class TextOnlyData {
  String? planName;
  ScheduleTime? scheduleTime;
  bool? show;
  String? backgroundColor;
  String? fontSize;
  String? fontWeight;
  String? textColor;
  String? text;
  String? alignment;
  int? marginTopBottom;
  int? marginLeftRight;
  int? borderRadius;

  TextOnlyData(
      {this.scheduleTime,
      this.show,
      this.backgroundColor,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      this.text,
      this.alignment,
      this.planName,
      this.marginTopBottom,
      this.marginLeftRight,
      this.borderRadius});

  TextOnlyData.fromJson(Map<String, dynamic> json) {
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    fontSize = json['fontSize'];
    fontWeight = json['fontWeight'];
    textColor = json['textColor'];
    text = json['Text'];
    alignment = json['alignment'];
    planName = json['plan'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    borderRadius = json['borderRadius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['fontSize'] = this.fontSize;
    data['fontWeight'] = this.fontWeight;
    data['textColor'] = this.textColor;
    data['Text'] = this.text;
    data['alignment'] = this.alignment;
    data['plan'] = this.planName;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['borderRadius'] = this.borderRadius;
    return data;
  }
}

class SocialMediaLinksData {
  String? planName;
  ScheduleTime? scheduleTime;
  bool? show;
  String? iconsColor;
  String? backgroundColor;
  List<SocialMediaIconList>? iconList;

  SocialMediaLinksData(
      {this.scheduleTime,
      this.show,
      this.iconsColor,
      this.iconList,
      this.backgroundColor,
      this.planName});

  SocialMediaLinksData.fromJson(Map<String, dynamic> json) {
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    show = json['show'];
    iconsColor = json['iconsColor'];
    backgroundColor = json['backgroundColor'];
    planName = json['plan'];
    if (json['IconList'] != null) {
      iconList = <SocialMediaIconList>[];
      json['IconList'].forEach((v) {
        iconList!.add(new SocialMediaIconList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['show'] = this.show;
    data['iconsColor'] = this.iconsColor;
    data['backgroundColor'] = this.backgroundColor;
    data['plan'] = this.planName;
    if (this.iconList != null) {
      data['IconList'] = this.iconList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialMediaIconList {
  String? icon;
  bool? color;
  String? svg;
  String? link;

  SocialMediaIconList({this.icon, this.svg, this.link});

  SocialMediaIconList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    color = json['color'];
    svg = json['svg'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['svg'] = this.svg;
    data['link'] = this.link;
    return data;
  }

  static map(IconButton Function(dynamic link) param0) {}
}

class TextWithBackgroundImageData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? action;
  String? id;
  String? productTitle;
  String? blockHeading;
  String? description;
  String? buttonText;
  String? buttonTextColor;
  String? buttonBackgroundColor;
  String? backgroundImageUrl;
  bool? show;
  String? textColor;
  String? backgroundColor;
  String? buttonLink;
  String? headingTextAlign;
  String? descriptionTextAlign;
  String? buttonAlignment;
  bool? buttonStatus;
  int? blockRadius;
  int? marginTopBottom;
  int? marginLeftRight;
  int? buttonRadius;
  String? buttonStyle;
  String? width;
  int? height;
  String? bodyAlignment;

  TextWithBackgroundImageData(
      {this.planName,
      this.scheduleTime,
      this.action,
      this.id,
      this.productTitle,
      this.blockHeading,
      this.description,
      this.buttonText,
      this.buttonTextColor,
      this.buttonBackgroundColor,
      this.backgroundImageUrl,
      this.show,
      this.textColor,
      this.backgroundColor,
      this.buttonLink,
      this.headingTextAlign,
      this.descriptionTextAlign,
      this.buttonAlignment,
      this.buttonStatus,
      this.blockRadius,
      this.marginTopBottom,
      this.marginLeftRight,
      this.buttonRadius,
      this.buttonStyle,
      this.width,
      this.height,
      this.bodyAlignment});

  TextWithBackgroundImageData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
    blockHeading = json['BlockHeading'];
    description = json['Description'];
    buttonText = json['ButtonText'];
    buttonTextColor = json['ButtonTextColor'];
    buttonBackgroundColor = json['ButtonBackgroundColor'];
    backgroundImageUrl = json['backgroundImageUrl'];
    show = json['show'];
    textColor = json['textColor'];
    backgroundColor = json['backgroundColor'];
    buttonLink = json['buttonLink'];
    headingTextAlign = json['headingTextAlign'];
    descriptionTextAlign = json['descriptionTextAlign'];
    buttonAlignment = json['buttonAlignment'];
    buttonStatus = json['buttonStatus'];
    blockRadius = json['blockRadius'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    buttonRadius = json['buttonRadius'];
    buttonStyle = json['buttonStyle'];
    width = json['width'];
    height = json['height'];
    bodyAlignment = json['bodyAlignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['BlockHeading'] = this.blockHeading;
    data['Description'] = this.description;
    data['ButtonText'] = this.buttonText;
    data['ButtonTextColor'] = this.buttonTextColor;
    data['ButtonBackgroundColor'] = this.buttonBackgroundColor;
    data['backgroundImageUrl'] = this.backgroundImageUrl;
    data['show'] = this.show;
    data['textColor'] = this.textColor;
    data['backgroundColor'] = this.backgroundColor;
    data['buttonLink'] = this.buttonLink;
    data['headingTextAlign'] = this.headingTextAlign;
    data['descriptionTextAlign'] = this.descriptionTextAlign;
    data['buttonAlignment'] = this.buttonAlignment;
    data['buttonStatus'] = this.buttonStatus;
    data['blockRadius'] = this.blockRadius;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['buttonRadius'] = this.buttonRadius;
    data['buttonStyle'] = this.buttonStyle;
    data['width'] = this.width;
    data['height'] = this.height;
    data['bodyAlignment'] = this.bodyAlignment;
    return data;
  }
}

class TextListData {
  String? planName;
  ScheduleTime? scheduleTime;
  List<TextListDtata>? list;
  String? heading;
  bool? show;
  String? backgroundColor;
  String? listStyle;
  String? textColor;

  TextListData(
      {this.scheduleTime,
      this.list,
      this.heading,
      this.show,
      this.backgroundColor,
      this.listStyle,
      this.textColor,
      this.planName});

  TextListData.fromJson(Map<String, dynamic> json) {
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    if (json['List'] != null) {
      list = <TextListDtata>[];
      json['List'].forEach((v) {
        list!.add(new TextListDtata.fromJson(v));
      });
    }
    heading = json['heading'];
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    listStyle = json['listStyle'];
    textColor = json['textColor'];
    planName = json['plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    if (this.list != null) {
      data['List'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['heading'] = this.heading;
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['listStyle'] = this.listStyle;
    data['textColor'] = this.textColor;
    data['plan'] = this.planName;
    return data;
  }
}

class TextListDtata {
  String? txt;

  TextListDtata({this.txt});

  TextListDtata.fromJson(Map<String, dynamic> json) {
    txt = json['txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txt'] = this.txt;
    return data;
  }
}

class ButtonOnlyData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? action;
  String? id;
  String? productTitle;
  bool? show;
  String? backgroundColor;
  String? buttonColor;
  String? buttonText;
  String? textColor;
  String? width;
  String? alignment;
  String? buttonLink;
  int? marginTopBottom;
  int? marginLeftRight;
  bool? prefixIconStatus;
  bool? suffixIconStatus;
  String? prefixIcon;
  String? suffixIcon;

  ButtonOnlyData(
      {this.planName,
      this.scheduleTime,
      this.action,
      this.id,
      this.productTitle,
      this.show,
      this.backgroundColor,
      this.buttonColor,
      this.buttonText,
      this.textColor,
      this.width,
      this.alignment,
      this.buttonLink,
      this.marginTopBottom,
      this.marginLeftRight,
      this.prefixIconStatus,
      this.suffixIconStatus,
      this.prefixIcon,
      this.suffixIcon});

  ButtonOnlyData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
    show = json['show'];
    backgroundColor = json['backgroundColor'];
    buttonColor = json['buttonColor'];
    buttonText = json['ButtonText'];
    textColor = json['textColor'];
    width = json['width'];
    alignment = json['alignment'];
    buttonLink = json['buttonLink'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    prefixIconStatus = json['PrefixIconStatus'];
    suffixIconStatus = json['SuffixIconStatus'];
    prefixIcon = json['PrefixIcon'];
    suffixIcon = json['SuffixIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['show'] = this.show;
    data['backgroundColor'] = this.backgroundColor;
    data['buttonColor'] = this.buttonColor;
    data['ButtonText'] = this.buttonText;
    data['textColor'] = this.textColor;
    data['width'] = this.width;
    data['alignment'] = this.alignment;
    data['buttonLink'] = this.buttonLink;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['PrefixIconStatus'] = this.prefixIconStatus;
    data['SuffixIconStatus'] = this.suffixIconStatus;
    data['PrefixIcon'] = this.prefixIcon;
    data['SuffixIcon'] = this.suffixIcon;
    return data;
  }
}

class FeaturedCollectionData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? heading;
  String? containerColor;
  String? textColor;
  int? columns;
  int? rows;
  int? showItems;
  bool? viewAll;
  List<FeaturedCollectionList>? featuredCollectionList;
  List<FeaturedCollectionProductList>? featuredCollectionProductList;

  FeaturedCollectionData(
      {this.planName,
      this.scheduleTime,
      this.heading,
      this.containerColor,
      this.textColor,
      this.columns,
      this.rows,
      this.showItems,
      this.viewAll,
      this.featuredCollectionList,
      this.featuredCollectionProductList});

  FeaturedCollectionData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    heading = json['Heading'];
    containerColor = json['Container_color'];
    textColor = json['Text_color'];
    columns = json['Columns'];
    rows = json['Rows'];
    showItems = json['Show_Items'];
    viewAll = json['view_all'];
    if (json['Featured_Collection_list'] != null) {
      featuredCollectionList = <FeaturedCollectionList>[];
      json['Featured_Collection_list'].forEach((v) {
        featuredCollectionList!.add(new FeaturedCollectionList.fromJson(v));
      });
    }
    if (json['Featured_Collection_Product_list'] != null) {
      featuredCollectionProductList = <FeaturedCollectionProductList>[];
      json['Featured_Collection_Product_list'].forEach((v) {
        featuredCollectionProductList!
            .add(new FeaturedCollectionProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['Heading'] = this.heading;
    data['Container_color'] = this.containerColor;
    data['Text_color'] = this.textColor;
    data['Columns'] = this.columns;
    data['Rows'] = this.rows;
    data['Show_Items'] = this.showItems;
    data['view_all'] = this.viewAll;
    if (this.featuredCollectionList != null) {
      data['Featured_Collection_list'] =
          this.featuredCollectionList!.map((v) => v.toJson()).toList();
    }
    if (this.featuredCollectionProductList != null) {
      data['Featured_Collection_Product_list'] =
          this.featuredCollectionProductList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedCollectionList {
  // String? imageSrc;
  String? productTitle;
  String? action;
  String? id;

  FeaturedCollectionList(
      {
      // this.imageSrc,
      this.productTitle,
      this.action,
      this.id});

  FeaturedCollectionList.fromJson(Map<String, dynamic> json) {
    // imageSrc = json['ImageSrc'];
    productTitle = json['productTitle'];
    action = json['Action'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['ImageSrc'] = this.imageSrc;
    data['productTitle'] = this.productTitle;
    data['Action'] = this.action;
    data['id'] = this.id;
    return data;
  }
}

class FeaturedCollectionProductList {
  String? id;
  String? title;
  String? imageSrc;
  PriceV2? price;
  PriceV2? discountedPrice;

  FeaturedCollectionProductList(
      {this.id, this.title, this.imageSrc, this.price, this.discountedPrice});

  FeaturedCollectionProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageSrc = json['ImageSrc'];
    price = json['price'] != null ? new PriceV2.fromJson(json['price']) : null;
    discountedPrice = json['discount'] != null
        ? new PriceV2.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ImageSrc'] = this.imageSrc;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.discountedPrice != null) {
      data['discount'] = this.discountedPrice!.toJson();
    }
    return data;
  }
}

class MailChimpAddSectionData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? imageSrc;
  bool? imageInBackground;
  String? text;
  String? textColor;
  bool? show;
  String? placeholder;
  String? button;
  String? backgroundColor;

  MailChimpAddSectionData(
      {this.planName,
      this.scheduleTime,
      this.imageSrc,
      this.imageInBackground,
      this.text,
      this.textColor,
      this.show,
      this.placeholder,
      this.button,
      this.backgroundColor});

  MailChimpAddSectionData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    imageSrc = json['ImageSrc'];
    imageInBackground = json['ImageInBackground'];
    text = json['text'];
    textColor = json['textcolor'];
    show = json['show'];
    placeholder = json['placeholder'];
    button = json['button'];
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['ImageSrc'] = this.imageSrc;
    data['ImageInBackground'] = this.imageInBackground;
    data['text'] = this.text;
    data['textcolor'] = this.textColor;
    data['show'] = this.show;
    data['placeholder'] = this.placeholder;
    data['button'] = this.button;
    data['backgroundColor'] = this.backgroundColor;
    return data;
  }
}

class KlaviyoSubscriptionFormsData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? imageSrc;
  bool? imageInBackground;
  String? text;
  String? textColor;
  bool? show;
  String? placeholder;
  String? button;
  String? backgroundColor;
  String? textcolor;

  KlaviyoSubscriptionFormsData(
      {this.planName,
      this.scheduleTime,
      this.imageSrc,
      this.imageInBackground,
      this.text,
      this.textColor,
      this.show,
      this.placeholder,
      this.button,
      this.backgroundColor,
      this.textcolor});

  KlaviyoSubscriptionFormsData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    imageSrc = json['ImageSrc'];
    imageInBackground = json['ImageInBackground'];
    text = json['text'];
    textColor = json['textcolor'];
    show = json['show'];
    placeholder = json['placeholder'];
    button = json['button'];
    backgroundColor = json['backgroundColor'];
    textcolor = json['textcolor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['ImageSrc'] = this.imageSrc;
    data['ImageInBackground'] = this.imageInBackground;
    data['text'] = this.text;
    data['textcolor'] = this.textColor;
    data['show'] = this.show;
    data['placeholder'] = this.placeholder;
    data['button'] = this.button;
    data['backgroundColor'] = this.backgroundColor;
    data['textcolor'] = this.textcolor;
    return data;
  }
}

class RebuyTrendingProductData {
  String? plan;
  String? heading;
  bool? viewAll;
  String? backgroundColor;
  ScheduleTime? scheduleTime;
  // List<Null>? trendingProductList;

  RebuyTrendingProductData({
    this.plan,
    this.heading,
    this.viewAll,
    this.backgroundColor,
    this.scheduleTime,
    // this.trendingProductList
  });

  RebuyTrendingProductData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    heading = json['Heading'];
    viewAll = json['view_all'];
    backgroundColor = json['backgroundColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    // if (json['TrendingProductList'] != null) {
    //   trendingProductList = <Null>[];
    //   json['TrendingProductList'].forEach((v) {
    //     trendingProductList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['Heading'] = this.heading;
    data['view_all'] = this.viewAll;
    data['backgroundColor'] = this.backgroundColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    // if (this.trendingProductList != null) {
    //   data['TrendingProductList'] =
    //       this.trendingProductList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class RebuyRecommendedProductData {
  String? plan;
  String? heading;
  bool? viewAll;
  String? backgroundColor;
  ScheduleTime? scheduleTime;
  // List<Null>? recommendedProductList;

  RebuyRecommendedProductData({
    this.plan,
    this.heading,
    this.viewAll,
    this.backgroundColor,
    this.scheduleTime,
    // this.recommendedProductList
  });

  RebuyRecommendedProductData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    heading = json['Heading'];
    viewAll = json['view_all'];
    backgroundColor = json['backgroundColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    // if (json['RecommendedProductList'] != null) {
    //   recommendedProductList = <Null>[];
    //   json['RecommendedProductList'].forEach((v) {
    //     recommendedProductList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['Heading'] = this.heading;
    data['view_all'] = this.viewAll;
    data['backgroundColor'] = this.backgroundColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    // if (this.recommendedProductList != null) {
    //   data['RecommendedProductList'] =
    //       this.recommendedProductList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class RebuyQuickViewData {
  String? plan;
  String? heading;
  bool? viewAll;
  String? backgroundColor;
  ScheduleTime? scheduleTime;
  // List<Null>? quickViewList;

  RebuyQuickViewData({
    this.plan,
    this.heading,
    this.viewAll,
    this.backgroundColor,
    this.scheduleTime,
    // this.quickViewList
  });

  RebuyQuickViewData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    heading = json['Heading'];
    viewAll = json['view_all'];
    backgroundColor = json['backgroundColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    // if (json['QuickViewList'] != null) {
    //   quickViewList = <Null>[];
    //   json['QuickViewList'].forEach((v) {
    //     quickViewList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['Heading'] = this.heading;
    data['view_all'] = this.viewAll;
    data['backgroundColor'] = this.backgroundColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    // if (this.quickViewList != null) {
    //   data['QuickViewList'] =
    //       this.quickViewList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class RebuyTopSellersData {
  String? plan;
  String? heading;
  bool? viewAll;
  String? backgroundColor;
  ScheduleTime? scheduleTime;
  // List<Null>? topSellerList;

  RebuyTopSellersData({
    this.plan,
    this.heading,
    this.viewAll,
    this.backgroundColor,
    this.scheduleTime,
    // this.topSellerList
  });

  RebuyTopSellersData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    heading = json['Heading'];
    viewAll = json['view_all'];
    backgroundColor = json['backgroundColor'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    // if (json['Top_SellerList'] != null) {
    //   topSellerList = <Null>[];
    //   json['Top_SellerList'].forEach((v) {
    //     topSellerList!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['Heading'] = this.heading;
    data['view_all'] = this.viewAll;
    data['backgroundColor'] = this.backgroundColor;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    // if (this.topSellerList != null) {
    //   data['Top_SellerList'] =
    //       this.topSellerList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ImageGridData {
  String? planName;
  ScheduleTime? scheduleTime;
  String? heading;
  bool? enableSlider;
  int? columns;
  int? rows;
  int? showItems;
  String? containerColor;
  String? textColor;
  List<ImageGridItem>? imageGridList;
  String? style;
  String? cellColor;
  int? containerRadius;
  int? containerPadding;
  int? marginTopBottom;
  int? marginLeftRight;
  int? borderRadius;

  ImageGridData(
      {this.planName,
      this.scheduleTime,
      this.style,
      this.heading,
      this.enableSlider,
      this.columns,
      this.rows,
      this.showItems,
      this.containerColor,
      this.containerRadius,
      this.containerPadding,
      this.cellColor,
      this.textColor,
      this.marginTopBottom,
      this.marginLeftRight,
      this.borderRadius,
      this.imageGridList});

  ImageGridData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    heading = json['Heading'];
    enableSlider = bool.parse(json['Enable_Slider'].toString());
    columns = json['Columns'];
    rows = json['Rows'];
    showItems = json['Show_Items'];
    containerColor = json['Container_color'];
    containerRadius = json['Container_radius'];
    containerPadding = json['Container_padding'];
    textColor = json['Text_color'];
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    borderRadius = json['borderRadius'];
    if (json['Image_Gird_list'] != null) {
      imageGridList = <ImageGridItem>[];
      json['Image_Gird_list'].forEach((v) {
        imageGridList!.add(new ImageGridItem.fromJson(v));
      });
    }
    style = json['style'];
    cellColor = json['cell_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['style'] = this.style;
    data['Heading'] = this.heading;
    data['Enable_Slider'] = this.enableSlider;
    data['Columns'] = this.columns;
    data['Rows'] = this.rows;
    data['Show_Items'] = this.showItems;
    data['Container_color'] = this.containerColor;
    data['Container_radius'] = this.containerRadius;
    data['Container_padding'] = this.containerPadding;
    data['cell_color'] = this.cellColor;
    data['Text_color'] = this.textColor;
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['borderRadius'] = this.borderRadius;
    if (this.imageGridList != null) {
      data['Image_Gird_list'] =
          this.imageGridList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageGridItem {
  String? imageSrc;
  String? action;
  String? id;
  String? productTitle;
  String? title;

  ImageGridItem(
      {this.imageSrc, this.action, this.id, this.productTitle, this.title});

  ImageGridItem.fromJson(Map<String, dynamic> json) {
    imageSrc = json['imageScr'];
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageScr'] = this.imageSrc;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    data['title'] = this.title;
    return data;
  }
}

class RecentOrderThemeThirdData {
  String? plan;
  bool? viewAll;
  ScheduleTime? scheduleTime;
  bool? imageInBackground;
  String? backgroundColor;
  String? textColor;
  String? buttonText;
  String? buttonTextColor;
  String? buttonBackgroundColor;
  String? bannerText;
  String? bannerTextColor;
  String? bannerBackgroundColor;
  List<ProductList>? productList;

  RecentOrderThemeThirdData(
      {this.plan,
      this.viewAll,
      this.scheduleTime,
      this.imageInBackground,
      this.backgroundColor,
      this.textColor,
      this.buttonText,
      this.buttonTextColor,
      this.buttonBackgroundColor,
      this.bannerText,
      this.bannerTextColor,
      this.bannerBackgroundColor,
      this.productList});

  RecentOrderThemeThirdData.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    viewAll = json['view_all'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    imageInBackground = json['ImageInBackground'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    buttonText = json['buttonText'];
    buttonTextColor = json['buttonTextColor'];
    buttonBackgroundColor = json['buttonBackgroundColor'];
    bannerText = json['bannerText'];
    bannerTextColor = json['bannerTextColor'];
    bannerBackgroundColor = json['bannerBackgroundColor'];
    if (json['ProductList'] != null) {
      productList = <ProductList>[];
      json['ProductList'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['view_all'] = this.viewAll;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['ImageInBackground'] = this.imageInBackground;
    data['backgroundColor'] = this.backgroundColor;
    data['textColor'] = this.textColor;
    data['buttonText'] = this.buttonText;
    data['buttonTextColor'] = this.buttonTextColor;
    data['buttonBackgroundColor'] = this.buttonBackgroundColor;
    data['bannerText'] = this.bannerText;
    data['bannerTextColor'] = this.bannerTextColor;
    data['bannerBackgroundColor'] = this.bannerBackgroundColor;
    if (this.productList != null) {
      data['ProductList'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SmileIoData {
  String? planName;
  ScheduleTime? scheduleTime;
  bool? show;
  String? imageSrc;
  bool? imageInBackground;
  String? heading;
  String? backgroundColor;
  String? textcolor;
  String? rewardColor;
  String? button;

  SmileIoData(
      {this.planName,
      this.scheduleTime,
      this.show,
      this.imageSrc,
      this.imageInBackground,
      this.heading,
      this.backgroundColor,
      this.textcolor,
      this.rewardColor,
      this.button});

  SmileIoData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    show = json['show'];
    imageSrc = json['ImageSrc'];
    imageInBackground = json['ImageInBackground'];
    heading = json['Heading'];
    backgroundColor = json['backgroundColor'];
    textcolor = json['textcolor'];
    rewardColor = json['rewardColor'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['show'] = this.show;
    data['ImageSrc'] = this.imageSrc;
    data['ImageInBackground'] = this.imageInBackground;
    data['Heading'] = this.heading;
    data['backgroundColor'] = this.backgroundColor;
    data['textcolor'] = this.textcolor;
    data['rewardColor'] = this.rewardColor;
    data['button'] = this.button;
    return data;
  }
}

class CustomSectionData {
  String? planName;
  String? htmlScript;
  ScheduleTime? scheduleTime;
  int? blockHeight;

  CustomSectionData(
      {this.planName, this.htmlScript, this.scheduleTime, this.blockHeight});

  CustomSectionData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    htmlScript = json['HTMLScript'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    blockHeight = json['blockHeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['HTMLScript'] = this.htmlScript;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['blockHeight'] = this.blockHeight;
    return data;
  }
}

class TextGridData {
  String? planName;
  ScheduleTime? scheduleTime;
  bool? show;
  String? heading;
  String? containerColor;
  String? textColor;
  String? cellColor;
  int? width;
  int? height;
  String? alignment;
  List<TextGridItem>? textList;
  int? marginTopBottom;
  int? marginLeftRight;
  int? borderRadius;

  TextGridData(
      {this.planName,
      this.scheduleTime,
      this.show,
      this.heading,
      this.containerColor,
      this.textColor,
      this.cellColor,
      this.width,
      this.height,
      this.alignment,
      this.textList,
      this.marginTopBottom,
      this.marginLeftRight,
      this.borderRadius});

  TextGridData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    scheduleTime = json['ScheduleTime'] != null
        ? new ScheduleTime.fromJson(json['ScheduleTime'])
        : null;
    show = json['show'];
    heading = json['Heading'];
    containerColor = json['Container_color'];
    textColor = json['Text_color'];
    cellColor = json['cell_color'];
    width = json['width'];
    height = json['height'];
    alignment = json['alignment'];
    if (json['textList'] != null) {
      textList = <TextGridItem>[];
      json['textList'].forEach((v) {
        textList!.add(new TextGridItem.fromJson(v));
      });
    }
    marginTopBottom = json['marginTopBottom'];
    marginLeftRight = json['marginLeftRight'];
    borderRadius = json['borderRadius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    if (this.scheduleTime != null) {
      data['ScheduleTime'] = this.scheduleTime!.toJson();
    }
    data['show'] = this.show;
    data['Heading'] = this.heading;
    data['Container_color'] = this.containerColor;
    data['Text_color'] = this.textColor;
    data['cell_color'] = this.cellColor;
    data['width'] = this.width;
    data['height'] = this.height;
    data['alignment'] = this.alignment;
    if (this.textList != null) {
      data['textList'] = this.textList!.map((v) => v.toJson()).toList();
    }
    data['marginTopBottom'] = this.marginTopBottom;
    data['marginLeftRight'] = this.marginLeftRight;
    data['borderRadius'] = this.borderRadius;
    return data;
  }
}

class TextGridItem {
  String? text;
  String? action;
  String? id;

  TextGridItem({this.text, this.action, this.id});

  TextGridItem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    action = json['Action'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['Action'] = this.action;
    data['id'] = this.id;
    return data;
  }
}
// class ButtonOnlyData {
//   ScheduleTime? scheduleTime;
//   bool? show;
//   String? backgroundColor;
//   String? containerColor;
//   String? buttonText;
//   String? textColor;
//   String? width;
//   String? alignment;
//   String? buttonLink;
//
//   ButtonOnlyData(
//       {this.scheduleTime,
//         this.show,
//         this.backgroundColor,
//         this.containerColor,
//         this.buttonText,
//         this.textColor,
//         this.width,
//         this.alignment,
//         this.buttonLink});
//
//   ButtonOnlyData.fromJson(Map<String, dynamic> json) {
//     scheduleTime = json['ScheduleTime'] != null
//         ? new ScheduleTime.fromJson(json['ScheduleTime'])
//         : null;
//     show = json['show'];
//     backgroundColor = json['backgroundColor'];
//     containerColor = json['containerColor'];
//     buttonText = json['ButtonText'];
//     textColor = json['textColor'];
//     width = json['width'];
//     alignment = json['alignment'];
//     buttonLink = json['buttonLink'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.scheduleTime != null) {
//       data['ScheduleTime'] = this.scheduleTime!.toJson();
//     }
//     data['show'] = this.show;
//     data['backgroundColor'] = this.backgroundColor;
//     data['containerColor'] = this.containerColor;
//     data['ButtonText'] = this.buttonText;
//     data['textColor'] = this.textColor;
//     data['width'] = this.width;
//     data['alignment'] = this.alignment;
//     data['buttonLink'] = this.buttonLink;
//     return data;
//   }
// }






// class ImageBannerSliderData {
//   String? slideHeight;
//   String? autoSwitchSlides;
//   int? changeSlidesEvery;
//   List<ImageBanner>? imageBanner;

//   ImageBannerSliderData(
//       {this.slideHeight,
//       this.autoSwitchSlides,
//       this.changeSlidesEvery,
//       this.imageBanner});

//   ImageBannerSliderData.fromJson(Map<String, dynamic> json) {
//     slideHeight = json['SlideHeight'];
//     autoSwitchSlides = json['AutoSwitchSlides'];
//     changeSlidesEvery = json['ChangeSlidesEvery'];
//     if (json['ImageBanner'] != null) {
//       imageBanner = <ImageBanner>[];
//       json['ImageBanner'].forEach((v) {
//         imageBanner!.add(new ImageBanner.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['SlideHeight'] = this.slideHeight;
//     data['AutoSwitchSlides'] = this.autoSwitchSlides;
//     data['ChangeSlidesEvery'] = this.changeSlidesEvery;
//     if (this.imageBanner != null) {
//       data['ImageBanner'] = this.imageBanner!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ImageBanner {
//   String? imageSrc;
//   String? subheading;
//   String? heading;
//   String? primarybuttonlabel;
//   String? primarybuttonlink;
//   String? secondarybuttonlabel;
//   String? secondarybuttonlink;
//   String? productTitlePrimary;
//   String? productTitleSecondary;
//   String? primarybtnId;
//   String? secondarybtnId;

//   ImageBanner(
//       {this.imageSrc,
//       this.subheading,
//       this.heading,
//       this.primarybuttonlabel,
//       this.primarybuttonlink,
//       this.secondarybuttonlabel,
//       this.secondarybuttonlink,
//       this.productTitlePrimary,
//       this.productTitleSecondary,
//       this.primarybtnId,
//       this.secondarybtnId});

//   ImageBanner.fromJson(Map<String, dynamic> json) {
//     imageSrc = json['ImageSrc'];
//     subheading = json['Subheading'];
//     heading = json['Heading'];
//     primarybuttonlabel = json['Primarybuttonlabel'];
//     primarybuttonlink = json['Primarybuttonlink'];
//     secondarybuttonlabel = json['Secondarybuttonlabel'];
//     secondarybuttonlink = json['Secondarybuttonlink'];
//     productTitlePrimary = json['productTitlePrimary'];
//     productTitleSecondary = json['productTitleSecondary'];
//     primarybtnId = json['PrimarybtnId'];
//     secondarybtnId = json['SecondarybtnId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ImageSrc'] = this.imageSrc;
//     data['Subheading'] = this.subheading;
//     data['Heading'] = this.heading;
//     data['Primarybuttonlabel'] = this.primarybuttonlabel;
//     data['Primarybuttonlink'] = this.primarybuttonlink;
//     data['Secondarybuttonlabel'] = this.secondarybuttonlabel;
//     data['Secondarybuttonlink'] = this.secondarybuttonlink;
//     data['productTitlePrimary'] = this.productTitlePrimary;
//     data['productTitleSecondary'] = this.productTitleSecondary;
//     data['PrimarybtnId'] = this.primarybtnId;
//     data['SecondarybtnId'] = this.secondarybtnId;
//     return data;
//   }
// }
// class ScrollingTextData {
//   int? scrollingSpeed;
//   List<ScrollingList>? scrollingList;

//   ScrollingTextData({this.scrollingSpeed, this.scrollingList});

//   ScrollingTextData.fromJson(Map<String, dynamic> json) {
//     scrollingSpeed = json['ScrollingSpeed'];
//     if (json['ScrollingList'] != null) {
//       scrollingList = <ScrollingList>[];
//       json['ScrollingList'].forEach((v) {
//         scrollingList!.add(new ScrollingList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ScrollingSpeed'] = this.scrollingSpeed;
//     if (this.scrollingList != null) {
//       data['ScrollingList'] =
//           this.scrollingList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ScrollingList {
//   String? text;
//   String? action;
//   String? id;
//   String? productTitle;

//   ScrollingList({this.text, this.action, this.id, this.productTitle});

//   ScrollingList.fromJson(Map<String, dynamic> json) {
//     text = json['Text'];
//     action = json['Action'];
//     id = json['id'];
//     productTitle = json['productTitle'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Text'] = this.text;
//     data['Action'] = this.action;
//     data['id'] = this.id;
//     data['productTitle'] = this.productTitle;
//     return data;
//   }
// }

// class CollectionGridData {
//   String? heading;
//   String? enableSlider;
//   int? columns;
//   int? rows;
//   List<CollectionList>? collectionList;

//   CollectionGridData(
//       {this.heading,
//       this.enableSlider,
//       this.columns,
//       this.rows,
//       this.collectionList});

//   CollectionGridData.fromJson(Map<String, dynamic> json) {
//     heading = json['Heading'];
//     enableSlider = json['Enable_Slider'];
//     columns = json['Columns'];
//     rows = json['Rows'];
//     if (json['CollectionList'] != null) {
//       collectionList = <CollectionList>[];
//       json['CollectionList'].forEach((v) {
//         collectionList!.add(new CollectionList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Heading'] = this.heading;
//     data['Enable_Slider'] = this.enableSlider;
//     data['Columns'] = this.columns;
//     data['Rows'] = this.rows;
//     if (this.collectionList != null) {
//       data['CollectionList'] =
//           this.collectionList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CollectionList {
//   String? imageSrc;
//   String? productTitle;
//   String? action;
//   String? id;

//   CollectionList({this.imageSrc, this.productTitle, this.action, this.id});

//   CollectionList.fromJson(Map<String, dynamic> json) {
//     imageSrc = json['ImageSrc'];
//     productTitle = json['productTitle'];
//     action = json['Action'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ImageSrc'] = this.imageSrc;
//     data['productTitle'] = this.productTitle;
//     data['Action'] = this.action;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class ProductGridData {
//   String? heading;
//   String? enableSlider;
//   int? columns;
//   int? show;
//   bool? viewAll;
//   String? imageRatio;
//   List<ProductList>? productList;

//   ProductGridData(
//       {this.heading,
//       this.enableSlider,
//       this.columns,
//       this.show,
//       this.viewAll,
//       this.imageRatio,
//       this.productList});

//   ProductGridData.fromJson(Map<String, dynamic> json) {
//     heading = json['Heading'];
//     enableSlider = json['Enable_Slider'];
//     columns = json['Columns'];
//     show = json['Show'];
//     viewAll = json['view_all'];
//     imageRatio = json['Image_Ratio'];
//     if (json['ProductList'] != null) {
//       productList = <ProductList>[];
//       json['ProductList'].forEach((v) {
//         productList!.add(new ProductList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Heading'] = this.heading;
//     data['Enable_Slider'] = this.enableSlider;
//     data['Columns'] = this.columns;
//     data['Show'] = this.show;
//     data['view_all'] = this.viewAll;
//     data['Image_Ratio'] = this.imageRatio;
//     if (this.productList != null) {
//       data['ProductList'] = this.productList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductList {
//   String? imageSrc;
//   String? productTitle;
//   String? action;
//   String? id;
//   String? category;
//   String? ratings;
//   String? discountedPrice;
//   String? price;

//   ProductList(
//       {this.imageSrc,
//       this.productTitle,
//       this.action,
//       this.id,
//       this.category,
//       this.ratings,
//       this.discountedPrice,
//       this.price});

//   ProductList.fromJson(Map<String, dynamic> json) {
//     imageSrc = json['ImageSrc'];
//     productTitle = json['productTitle'];
//     action = json['Action'];
//     id = json['id'];
//     category = json['category'];
//     ratings = json['ratings'];
//     discountedPrice = json['discountedPrice'];
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ImageSrc'] = this.imageSrc;
//     data['productTitle'] = this.productTitle;
//     data['Action'] = this.action;
//     data['id'] = this.id;
//     data['category'] = this.category;
//     data['ratings'] = this.ratings;
//     data['discountedPrice'] = this.discountedPrice;
//     data['price'] = this.price;
//     return data;
//   }
// }

// class TestimonialsData {
//   List<TestimonialsList>? testimonialsList;

//   TestimonialsData({this.testimonialsList});

//   TestimonialsData.fromJson(Map<String, dynamic> json) {
//     if (json['TestimonialsList'] != null) {
//       testimonialsList = <TestimonialsList>[];
//       json['TestimonialsList'].forEach((v) {
//         testimonialsList!.add(new TestimonialsList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.testimonialsList != null) {
//       data['TestimonialsList'] =
//           this.testimonialsList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class TestimonialsList {
//   String? quote;
//   String? authorDesignation;
//   String? authorName;

//   TestimonialsList({this.quote, this.authorDesignation, this.authorName});

//   TestimonialsList.fromJson(Map<String, dynamic> json) {
//     quote = json['Quote'];
//     authorDesignation = json['Author_designation'];
//     authorName = json['Author_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Quote'] = this.quote;
//     data['Author_designation'] = this.authorDesignation;
//     data['Author_name'] = this.authorName;
//     return data;
//   }
// }

// class ImageWithTextData {
//   String? image;
//   String? subheading;
//   String? heading;
//   String? description;
//   String? buttonLabel;
//   String? productTitle;
//   String? action;
//   String? id;

//   ImageWithTextData(
//       {this.image,
//       this.subheading,
//       this.heading,
//       this.description,
//       this.buttonLabel,
//       this.productTitle,
//       this.action,
//       this.id});

//   ImageWithTextData.fromJson(Map<String, dynamic> json) {
//     image = json['Image'];
//     subheading = json['Subheading'];
//     heading = json['Heading'];
//     description = json['Description'];
//     buttonLabel = json['Button_label'];
//     productTitle = json['productTitle'];
//     action = json['Action'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Image'] = this.image;
//     data['Subheading'] = this.subheading;
//     data['Heading'] = this.heading;
//     data['Description'] = this.description;
//     data['Button_label'] = this.buttonLabel;
//     data['productTitle'] = this.productTitle;
//     data['Action'] = this.action;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class DividerDataData {
//   int? space;

//   DividerDataData({this.space});

//   DividerDataData.fromJson(Map<String, dynamic> json) {
//     space = json['Space'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Space'] = this.space;
//     return data;
//   }
// }

// class IconTextData {
//   List<IconWithTextList>? iconWithTextList;

//   IconTextData({this.iconWithTextList});

//   IconTextData.fromJson(Map<String, dynamic> json) {
//     if (json['IconWithTextList'] != null) {
//       iconWithTextList = <IconWithTextList>[];
//       json['IconWithTextList'].forEach((v) {
//         iconWithTextList!.add(new IconWithTextList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.iconWithTextList != null) {
//       data['IconWithTextList'] =
//           this.iconWithTextList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class IconWithTextList {
//   String? title;
//   String? column;
//   String? clickToUploadImage;
//   String? description;

//   IconWithTextList(
//       {this.title, this.column, this.clickToUploadImage, this.description});

//   IconWithTextList.fromJson(Map<String, dynamic> json) {
//     title = json['Title'];
//     column = json['Column'];
//     clickToUploadImage = json['Click to upload Image'];
//     description = json['Description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Title'] = this.title;
//     data['Column'] = this.column;
//     data['Click to upload Image'] = this.clickToUploadImage;
//     data['Description'] = this.description;
//     return data;
//   }
// }

// class VideoData {
//   String? heading;
//   String? uRL;
//   String? coverImage;
//   bool? autoplay;
//   String? videoAltText;

//   VideoData(
//       {this.heading,
//       this.uRL,
//       this.coverImage,
//       this.autoplay,
//       this.videoAltText});

//   VideoData.fromJson(Map<String, dynamic> json) {
//     heading = json['Heading'];
//     uRL = json['URL'];
//     coverImage = json['Cover_Image'];
//     autoplay = json['Autoplay'];
//     videoAltText = json['VideoAltText'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Heading'] = this.heading;
//     data['URL'] = this.uRL;
//     data['Cover_Image'] = this.coverImage;
//     data['Autoplay'] = this.autoplay;
//     data['VideoAltText'] = this.videoAltText;
//     return data;
//   }
// }

// class SearchData {
//   String? heading;
//   String? style;

//   SearchData({this.heading, this.style});

//   SearchData.fromJson(Map<String, dynamic> json) {
//     heading = json['Heading'];
//     style = json['Style'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Heading'] = this.heading;
//     data['Style'] = this.style;
//     return data;
//   }
// }

// class ComparisonData {
//   String? heading;
//   String? beforeImageSrc;
//   String? afterImageSrc;
//   String? imageHeight;

//   ComparisonData(
//       {this.heading,
//       this.beforeImageSrc,
//       this.afterImageSrc,
//       this.imageHeight});

//   ComparisonData.fromJson(Map<String, dynamic> json) {
//     heading = json['Heading'];
//     beforeImageSrc = json['Before_Image_src'];
//     afterImageSrc = json['After_Image_src'];
//     imageHeight = json['Image_height'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Heading'] = this.heading;
//     data['Before_Image_src'] = this.beforeImageSrc;
//     data['After_Image_src'] = this.afterImageSrc;
//     data['Image_height'] = this.imageHeight;
//     return data;
//   }
// }

// class DiscountData {
//   List<DiscountList>? discountList;

//   DiscountData({this.discountList});

//   DiscountData.fromJson(Map<String, dynamic> json) {
//     if (json['DiscountList'] != null) {
//       discountList = <DiscountList>[];
//       json['DiscountList'].forEach((v) {
//         discountList!.add(new DiscountList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.discountList != null) {
//       data['DiscountList'] = this.discountList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DiscountList {
//   String? title;
//   Null? imageSrc;
//   String? description;

//   DiscountList({this.title, this.imageSrc, this.description});

//   DiscountList.fromJson(Map<String, dynamic> json) {
//     title = json['Title'];
//     imageSrc = json['ImageSrc'];
//     description = json['Description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Title'] = this.title;
//     data['ImageSrc'] = this.imageSrc;
//     data['Description'] = this.description;
//     return data;
//   }
// }





