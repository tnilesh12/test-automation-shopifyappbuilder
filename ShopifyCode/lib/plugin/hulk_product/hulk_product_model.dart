class HulkProductDataModel {
  List<Condition>? condition;
  DisplaySettings? displaySettings;
  Null? optionIdArray;
  HideShowArray? hideShowArray;
  OptionsTitle? optionsTitle;
  OptionsContainerStyle? optionsContainerStyle;
  OptionsNameStyle? optionsNameStyle;
  OptionValuesStyle? optionValuesStyle;
  PremiumOptionSettings? premiumOptionSettings;
  AdvancedUsers? advancedUsers;
  SwatchSettings? swatchSettings;
  String? pid;
  Relationship? relationship;
  String? currencySymbol;
  int? planId;
  String? plansFeatures;
  List<WidgetData>? value=[];
  List<bool>? valid;

  HulkProductDataModel(
      {this.condition,
      this.displaySettings,
      this.optionIdArray,
      this.hideShowArray,
      this.optionsTitle,
      this.optionsContainerStyle,
      this.optionsNameStyle,
      this.optionValuesStyle,
      this.premiumOptionSettings,
      this.advancedUsers,
      this.swatchSettings,
      this.pid,
      this.relationship,
      this.currencySymbol,
      this.planId,
      this.plansFeatures,
      this.value,
      this.valid});

  HulkProductDataModel.fromJson(Map<String, dynamic> json) {
    if (json['condition'] != null) {
      condition = <Condition>[];
      json['condition'].forEach((v) {
        condition!.add(new Condition.fromJson(v));
      });
    }
    displaySettings = json['display_settings'] != null
        ? new DisplaySettings.fromJson(json['display_settings'])
        : null;
    optionIdArray = json['option_id_array'];
    hideShowArray = json['hide_show_array'] != null
        ? new HideShowArray.fromJson(json['hide_show_array'])
        : null;
    optionsTitle = json['options_title'] != null
        ? new OptionsTitle.fromJson(json['options_title'])
        : null;
    optionsContainerStyle = json['options_container_style'] != null
        ? new OptionsContainerStyle.fromJson(json['options_container_style'])
        : null;
    optionsNameStyle = json['options_name_style'] != null
        ? new OptionsNameStyle.fromJson(json['options_name_style'])
        : null;
    optionValuesStyle = json['option_values_style'] != null
        ? new OptionValuesStyle.fromJson(json['option_values_style'])
        : null;
    premiumOptionSettings = json['premium_option_settings'] != null
        ? new PremiumOptionSettings.fromJson(json['premium_option_settings'])
        : null;
    advancedUsers = json['advanced_users'] != null
        ? new AdvancedUsers.fromJson(json['advanced_users'])
        : null;
    swatchSettings = json['swatch_settings'] != null
        ? new SwatchSettings.fromJson(json['swatch_settings'])
        : null;
    pid = json['pid'];
    relationship = json['relationship'] != null
        ? new Relationship.fromJson(json['relationship'])
        : null;
    currencySymbol = json['currency_symbol'];
    planId = json['plan_id'];
    plansFeatures = json['plans_features'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.condition != null) {
      data['condition'] = this.condition!.map((v) => v.toJson()).toList();
    }
    if (this.displaySettings != null) {
      data['display_settings'] = this.displaySettings!.toJson();
    }
    data['option_id_array'] = this.optionIdArray;
    if (this.hideShowArray != null) {
      data['hide_show_array'] = this.hideShowArray!.toJson();
    }
    if (this.optionsTitle != null) {
      data['options_title'] = this.optionsTitle!.toJson();
    }
    if (this.optionsContainerStyle != null) {
      data['options_container_style'] = this.optionsContainerStyle!.toJson();
    }
    if (this.optionsNameStyle != null) {
      data['options_name_style'] = this.optionsNameStyle!.toJson();
    }
    if (this.optionValuesStyle != null) {
      data['option_values_style'] = this.optionValuesStyle!.toJson();
    }
    if (this.premiumOptionSettings != null) {
      data['premium_option_settings'] = this.premiumOptionSettings!.toJson();
    }
    if (this.advancedUsers != null) {
      data['advanced_users'] = this.advancedUsers!.toJson();
    }
    if (this.swatchSettings != null) {
      data['swatch_settings'] = this.swatchSettings!.toJson();
    }
    data['pid'] = this.pid;
    if (this.relationship != null) {
      data['relationship'] = this.relationship!.toJson();
    }
    data['currency_symbol'] = this.currencySymbol;
    data['plan_id'] = this.planId;
    data['plans_features'] = this.plansFeatures;
    return data;
  }
}

class WidgetData {
  String? id;
  dynamic data;
  bool? validate;

  WidgetData({this.id, this.data, this.validate});

  WidgetData.fromJson(Map<String, dynamic> json) {
    id = json['uniqueId']??"";
    data = json['data']??" ";
    validate = json['validate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = new Map<String, dynamic>();
    jsonData['uniqueId'] = this.id;
    jsonData['data'] = this.data;
    jsonData['validate'] = this.validate;

    return jsonData;
  }
}

class Condition {
  int? id;
  String? uuid;
  String? storeId;
  int? relationshipId;
  String? conditions;
  String? createdAt;
  String? updatedAt;

  Condition(
      {this.id,
      this.uuid,
      this.storeId,
      this.relationshipId,
      this.conditions,
      this.createdAt,
      this.updatedAt});

  Condition.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    uuid = json['uuid']??" ";
    storeId = json['store_id']??" ";
    relationshipId = json['relationship_id']??0;
    conditions = json['conditions']??" ";
    createdAt = json['created_at']??" ";
    updatedAt = json['updated_at']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['store_id'] = this.storeId;
    data['relationship_id'] = this.relationshipId;
    data['conditions'] = this.conditions;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DisplaySettings {
  int? id;
  String? uuid;
  String? storeId;
  String? swatchSettings;
  String? optionsTitle;
  String? optionsContainerStyle;
  String? optionNameStyle;
  String? optionValuesStyle;
  String? premiumOptionSettings;
  String? advancedUsers;
  String? createdAt;
  String? updatedAt;
  String? generalSettings;
  String? charcterCountMessage;
  String? editOptionButtonSettings;
  bool? isMonthlyEmail;
  String? buttonOptionSettings;
  String? orderTag;
  String? optionHelpTextStyle;
  bool? isThemeChangeEmail;
  String? cartSelectors;
  String? cartItemPrice;
  String? cartItemLinePrice;
  String? cartTotalPrice;
  String? cartItemProperties;
  String? cartLineitemParents;
  String? optionTooltipStyle;
  String? imageThumbnailParents;
  String? labelStyle;
  String? imageColorPosition;
  String? imageColorShape;
  bool? dynamicCheckoutButtonIntegration;
  bool? dynamicCheckoutDiscountCode;
  bool? scheduleStoreTime;
  bool? inventoryReporting;
  String? inventoryReportingType;
  bool? formulaOptionNameInline;
  bool? isCheckoutApi;
  String? recomodationSetting;
  String? inventoryText;
  String? outOfStockText;
  String? changeButtonText;
  String? selectButtonText;
  bool? ignoreMinMaxValidation;
  String? freeGiftText;

  DisplaySettings(
      {this.id,
      this.uuid,
      this.storeId,
      this.swatchSettings,
      this.optionsTitle,
      this.optionsContainerStyle,
      this.optionNameStyle,
      this.optionValuesStyle,
      this.premiumOptionSettings,
      this.advancedUsers,
      this.createdAt,
      this.updatedAt,
      this.generalSettings,
      this.charcterCountMessage,
      this.editOptionButtonSettings,
      this.isMonthlyEmail,
      this.buttonOptionSettings,
      this.orderTag,
      this.optionHelpTextStyle,
      this.isThemeChangeEmail,
      this.cartSelectors,
      this.cartItemPrice,
      this.cartItemLinePrice,
      this.cartTotalPrice,
      this.cartItemProperties,
      this.cartLineitemParents,
      this.optionTooltipStyle,
      this.imageThumbnailParents,
      this.labelStyle,
      this.imageColorPosition,
      this.imageColorShape,
      this.dynamicCheckoutButtonIntegration,
      this.dynamicCheckoutDiscountCode,
      this.scheduleStoreTime,
      this.inventoryReporting,
      this.inventoryReportingType,
      this.formulaOptionNameInline,
      this.isCheckoutApi,
      this.recomodationSetting,
      this.inventoryText,
      this.outOfStockText,
      this.changeButtonText,
      this.selectButtonText,
      this.ignoreMinMaxValidation,
      this.freeGiftText});

  DisplaySettings.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    uuid = json['uuid']??" ";
    storeId = json['store_id']??" ";
    swatchSettings = json['swatch_settings']??" ";
    optionsTitle = json['options_title']??" ";
    optionsContainerStyle = json['options_container_style']??" ";
    optionNameStyle = json['option_name_style']??" ";
    optionValuesStyle = json['option_values_style']??" ";
    premiumOptionSettings = json['premium_option_settings']??" ";
    advancedUsers = json['advanced_users']??" ";
    createdAt = json['created_at']??" ";
    updatedAt = json['updated_at']??" ";
    generalSettings = json['general_settings']??" ";
    charcterCountMessage = json['charcter_count_message']??" ";
    editOptionButtonSettings = json['edit_option_button_settings']??" ";
    isMonthlyEmail = json['is_monthly_email'];
    buttonOptionSettings = json['button_option_settings']??" ";
    orderTag = json['order_tag']??" ";
    optionHelpTextStyle = json['option_help_text_style']??" ";
    isThemeChangeEmail = json['is_theme_change_email'];
    cartSelectors = json['cart_selectors']??" ";
    cartItemPrice = json['cart_item_price']??" ";
    cartItemLinePrice = json['cart_item_line_price']??" ";
    cartTotalPrice = json['cart_total_price']??" ";
    cartItemProperties = json['cart_item_properties']??" ";
    cartLineitemParents = json['cart_lineitem_parents']??" ";
    optionTooltipStyle = json['option_tooltip_style']??" ";
    imageThumbnailParents = json['image_thumbnail_parents']??" ";
    labelStyle = json['label_style']??" ";
    imageColorPosition = json['image_color_position']??" ";
    imageColorShape = json['image_color_shape'];
    dynamicCheckoutButtonIntegration =
        json['dynamic_checkout_button_integration'];
    dynamicCheckoutDiscountCode = json['dynamic_checkout_discount_code'];
    scheduleStoreTime = json['schedule_store_time'];
    inventoryReporting = json['inventory_reporting']??" ";
    inventoryReportingType = json['inventory_reporting_type'];
    formulaOptionNameInline = json['formula_option_name_inline'];
    isCheckoutApi = json['is_checkout_api'];
    recomodationSetting = json['recomodation_setting']??" ";
    inventoryText = json['inventory_text']??" ";
    outOfStockText = json['out_of_stock_text']??" ";
    changeButtonText = json['change_button_text']??" ";
    selectButtonText = json['select_button_text']??" ";
    ignoreMinMaxValidation = json['ignore_min_max_validation'];
    freeGiftText = json['free_gift_text']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['store_id'] = this.storeId;
    data['swatch_settings'] = this.swatchSettings;
    data['options_title'] = this.optionsTitle;
    data['options_container_style'] = this.optionsContainerStyle;
    data['option_name_style'] = this.optionNameStyle;
    data['option_values_style'] = this.optionValuesStyle;
    data['premium_option_settings'] = this.premiumOptionSettings;
    data['advanced_users'] = this.advancedUsers;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['general_settings'] = this.generalSettings;
    data['charcter_count_message'] = this.charcterCountMessage;
    data['edit_option_button_settings'] = this.editOptionButtonSettings;
    data['is_monthly_email'] = this.isMonthlyEmail;
    data['button_option_settings'] = this.buttonOptionSettings;
    data['order_tag'] = this.orderTag;
    data['option_help_text_style'] = this.optionHelpTextStyle;
    data['is_theme_change_email'] = this.isThemeChangeEmail;
    data['cart_selectors'] = this.cartSelectors;
    data['cart_item_price'] = this.cartItemPrice;
    data['cart_item_line_price'] = this.cartItemLinePrice;
    data['cart_total_price'] = this.cartTotalPrice;
    data['cart_item_properties'] = this.cartItemProperties;
    data['cart_lineitem_parents'] = this.cartLineitemParents;
    data['option_tooltip_style'] = this.optionTooltipStyle;
    data['image_thumbnail_parents'] = this.imageThumbnailParents;
    data['label_style'] = this.labelStyle;
    data['image_color_position'] = this.imageColorPosition;
    data['image_color_shape'] = this.imageColorShape;
    data['dynamic_checkout_button_integration'] =
        this.dynamicCheckoutButtonIntegration;
    data['dynamic_checkout_discount_code'] = this.dynamicCheckoutDiscountCode;
    data['schedule_store_time'] = this.scheduleStoreTime;
    data['inventory_reporting'] = this.inventoryReporting;
    data['inventory_reporting_type'] = this.inventoryReportingType;
    data['formula_option_name_inline'] = this.formulaOptionNameInline;
    data['is_checkout_api'] = this.isCheckoutApi;
    data['recomodation_setting'] = this.recomodationSetting;
    data['inventory_text'] = this.inventoryText;
    data['out_of_stock_text'] = this.outOfStockText;
    data['change_button_text'] = this.changeButtonText;
    data['select_button_text'] = this.selectButtonText;
    data['ignore_min_max_validation'] = this.ignoreMinMaxValidation;
    data['free_gift_text'] = this.freeGiftText;
    return data;
  }
}

class HideShowArray {
  HideShowArray();

  HideShowArray.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class OptionsTitle {
  String? titleText;
  String? titleFontSize;
  String? titlePadding;
  String? titleTextAlign;
  String? titleBackground;
  String? titleBorder;
  String? titleFontColor;
  String? titleDisplay;
  String? titleBold;

  OptionsTitle(
      {this.titleText,
      this.titleFontSize,
      this.titlePadding,
      this.titleTextAlign,
      this.titleBackground,
      this.titleBorder,
      this.titleFontColor,
      this.titleDisplay,
      this.titleBold});

  OptionsTitle.fromJson(Map<String, dynamic> json) {
    titleText = json['title_text']??" ";
    titleFontSize = json['title_font_size']??" ";
    titlePadding = json['title_padding']??" ";
    titleTextAlign = json['title_text_align']??" ";
    titleBackground = json['title_background']??" ";
    titleBorder = json['title_border']??" ";
    titleFontColor = json['title_font_color']??" ";
    titleDisplay = json['title_display']??" ";
    titleBold = json['title_bold']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_text'] = this.titleText;
    data['title_font_size'] = this.titleFontSize;
    data['title_padding'] = this.titlePadding;
    data['title_text_align'] = this.titleTextAlign;
    data['title_background'] = this.titleBackground;
    data['title_border'] = this.titleBorder;
    data['title_font_color'] = this.titleFontColor;
    data['title_display'] = this.titleDisplay;
    data['title_bold'] = this.titleBold;
    return data;
  }
}

class OptionsContainerStyle {
  String? backgroundColor;
  String? borderColor;
  String? padding;
  String? spacingBetweenOptions;
  String? lineBetweenOptions;
  String? enableTooltip;

  OptionsContainerStyle(
      {this.backgroundColor,
      this.borderColor,
      this.padding,
      this.spacingBetweenOptions,
      this.lineBetweenOptions,
      this.enableTooltip});

  OptionsContainerStyle.fromJson(Map<String, dynamic> json) {
    backgroundColor = json['background_color']??" ";
    borderColor = json['border_color']??" ";
    padding = json['padding']??" ";
    spacingBetweenOptions = json['spacing_between_options']??" ";
    lineBetweenOptions = json['line_between_options']??" ";
    enableTooltip = json['enable_tooltip']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['background_color'] = this.backgroundColor;
    data['border_color'] = this.borderColor;
    data['padding'] = this.padding;
    data['spacing_between_options'] = this.spacingBetweenOptions;
    data['line_between_options'] = this.lineBetweenOptions;
    data['enable_tooltip'] = this.enableTooltip;
    return data;
  }
}

class OptionsNameStyle {
  String? optionNameWidth;
  String? optionNameFontSize;
  String? optionNameTextAlign;
  String? fontColor;
  String? onTitleBold;
  String? optionNameInline;

  OptionsNameStyle(
      {this.optionNameWidth,
      this.optionNameFontSize,
      this.optionNameTextAlign,
      this.fontColor,
      this.onTitleBold,
      this.optionNameInline});

  OptionsNameStyle.fromJson(Map<String, dynamic> json) {
    optionNameWidth = json['option_name_width']??" ";
    optionNameFontSize = json['option_name_font_size']??" ";
    optionNameTextAlign = json['option_name_text_align']??" ";
    fontColor = json['font_color']??" ";
    onTitleBold = json['on_title_bold']??" ";
    optionNameInline = json['option_name_inline']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_name_width'] = this.optionNameWidth;
    data['option_name_font_size'] = this.optionNameFontSize;
    data['option_name_text_align'] = this.optionNameTextAlign;
    data['font_color'] = this.fontColor;
    data['on_title_bold'] = this.onTitleBold;
    data['option_name_inline'] = this.optionNameInline;
    return data;
  }
}

class OptionValuesStyle {
  String? ovFontSize;
  String? ovFontColor;
  String? singleLine;
  String? ovFontWeight;
  String? ovTextAlign;

  OptionValuesStyle(
      {this.ovFontSize,
      this.ovFontColor,
      this.singleLine,
      this.ovFontWeight,
      this.ovTextAlign});

  OptionValuesStyle.fromJson(Map<String, dynamic> json) {
    ovFontSize = json['ov_font_size']??" ";
    ovFontColor = json['ov_font_color']??" ";
    singleLine = json['single_line']??" ";
    ovFontWeight = json['ov_font_weight']??" ";
    ovTextAlign = json['ov_text_align']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ov_font_size'] = this.ovFontSize;
    data['ov_font_color'] = this.ovFontColor;
    data['single_line'] = this.singleLine;
    data['ov_font_weight'] = this.ovFontWeight;
    data['ov_text_align'] = this.ovTextAlign;
    return data;
  }
}

class PremiumOptionSettings {
  String? updateTotalText;
  String? postTotalText;
  String? totalContainerBackgroundColor;
  String? totalContainerBorderColor;
  String? totalContainerFontColor;
  String? totalContainerPriceColor;
  String? priceSetting;
  String? priceClass;
  String? additionPriceFontSize;
  String? additionPriceFontColor;
  String? amountNoteDisplay;

  PremiumOptionSettings(
      {this.updateTotalText,
      this.postTotalText,
      this.totalContainerBackgroundColor,
      this.totalContainerBorderColor,
      this.totalContainerFontColor,
      this.totalContainerPriceColor,
      this.priceSetting,
      this.priceClass,
      this.additionPriceFontSize,
      this.additionPriceFontColor,
      this.amountNoteDisplay});

  PremiumOptionSettings.fromJson(Map<String, dynamic> json) {
    updateTotalText = json['update_total_text']??" ";
    postTotalText = json['post_total_text'];
    totalContainerBackgroundColor = json['total_container_background_color']??" ";
    totalContainerBorderColor = json['total_container_border_color']??" ";
    totalContainerFontColor = json['total_container_font_color']??" ";
    totalContainerPriceColor = json['total_container_price_color'];
    priceSetting = json['price_setting']??" ";
    priceClass = json['price_class']??" ";
    additionPriceFontSize = json['addition_price_font_size']??" ";
    additionPriceFontColor = json['addition_price_font_color']??" ";
    amountNoteDisplay = json['amount_note_display']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['update_total_text'] = this.updateTotalText;
    data['post_total_text'] = this.postTotalText;
    data['total_container_background_color'] =
        this.totalContainerBackgroundColor;
    data['total_container_border_color'] = this.totalContainerBorderColor;
    data['total_container_font_color'] = this.totalContainerFontColor;
    data['total_container_price_color'] = this.totalContainerPriceColor;
    data['price_setting'] = this.priceSetting;
    data['price_class'] = this.priceClass;
    data['addition_price_font_size'] = this.additionPriceFontSize;
    data['addition_price_font_color'] = this.additionPriceFontColor;
    data['amount_note_display'] = this.amountNoteDisplay;
    return data;
  }
}

class AdvancedUsers {
  String? customJs;
  String? customCss;
  String? customizeMessage;

  AdvancedUsers({this.customJs, this.customCss, this.customizeMessage});

  AdvancedUsers.fromJson(Map<String, dynamic> json) {
    customJs = json['custom_js']??" ";
    customCss = json['custom_css']??" ";
    customizeMessage = json['customize_message']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custom_js'] = this.customJs;
    data['custom_css'] = this.customCss;
    data['customize_message'] = this.customizeMessage;
    return data;
  }
}

class SwatchSettings {
  String? swatchWidth;
  String? swatchHeight;
  String? tooltipPosition;
  String? tooltipContains;
  String? tooltipDisplay;
  String? roundCorners;
  String? swatchSelectedBorder;
  String? enableSwatchWithText;

  SwatchSettings(
      {this.swatchWidth,
      this.swatchHeight,
      this.tooltipPosition,
      this.tooltipContains,
      this.tooltipDisplay,
      this.roundCorners,
      this.swatchSelectedBorder,
      this.enableSwatchWithText});

  SwatchSettings.fromJson(Map<String, dynamic> json) {
    swatchWidth = json['swatch_width']??" ";
    swatchHeight = json['swatch_height']??" ";
    tooltipPosition = json['tooltip_position']??" ";
    tooltipContains = json['tooltip_contains']??" ";
    tooltipDisplay = json['tooltip_display']??" ";
    roundCorners = json['round_corners']??" ";
    swatchSelectedBorder = json['swatch_selected_border']??" ";
    enableSwatchWithText = json['enable_swatch_with_text']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['swatch_width'] = this.swatchWidth;
    data['swatch_height'] = this.swatchHeight;
    data['tooltip_position'] = this.tooltipPosition;
    data['tooltip_contains'] = this.tooltipContains;
    data['tooltip_display'] = this.tooltipDisplay;
    data['round_corners'] = this.roundCorners;
    data['swatch_selected_border'] = this.swatchSelectedBorder;
    data['enable_swatch_with_text'] = this.enableSwatchWithText;
    return data;
  }
}

class Relationship {
  int? id;
  List<Options>? options;
  String? optionSetName;
  String? uuid;
  String? storeId;
  String? productRelationType;
  List<Null>? productRelationValue;
  String? createdAt;
  String? updatedAt;
  List<Null>? customerTags;

  Relationship(
      {this.id,
      this.options,
      this.optionSetName,
      this.uuid,
      this.storeId,
      this.productRelationType,
      this.productRelationValue,
      this.createdAt,
      this.updatedAt,
      this.customerTags});

  Relationship.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    optionSetName = json['option_set_name']??" ";
    uuid = json['uuid']??" ";
    storeId = json['store_id']??" ";
    productRelationType = json['product_relation_type']??" ";
    if (json['product_relation_value'] != null) {
      productRelationValue = <Null>[];
      json['product_relation_value'].forEach((v) {
        //  productRelationValue!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['created_at']??" ";
    updatedAt = json['updated_at']??" ";
    if (json['customer_tags'] != null) {
      customerTags = <Null>[];
      json['customer_tags'].forEach((v) {
        // customerTags!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['option_set_name'] = this.optionSetName;
    data['uuid'] = this.uuid;
    data['store_id'] = this.storeId;
    data['product_relation_type'] = this.productRelationType;
    if (this.productRelationValue != null) {
      // data['product_relation_value'] = this.productRelationValue!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customerTags != null) {
      // data['customer_tags'] = this.customerTags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  String? optionName;
  String? optionType;
  String? optionUniqueName;
  ExtraField? extraField;
  String? tooltip;
  String? helptext;
  List<ValuesJson>? valuesJson;
  bool? require;
  bool? isThumbnailChange;
  String? helptextHyperlink;
  String? tooltipHyperlink;
  bool? isQuantitySelector;

  Options(
      {this.id,
      this.optionName,
      this.optionType,
      this.optionUniqueName,
      this.extraField,
      this.tooltip,
      this.helptext,
      this.valuesJson,
      this.require,
      this.isThumbnailChange,
      this.helptextHyperlink,
      this.tooltipHyperlink,
      this.isQuantitySelector});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    optionName = json['option_name']??" ";
    optionType = json['option_type']??" ";
    optionUniqueName = json['option_unique_name']??" ";
    extraField = json['extra_field'] != null
        ? new ExtraField.fromJson(json['extra_field'])
        : null;
    tooltip = json['tooltip']??" ";
    helptext = json['helptext']??" ";
    if (json['values_json'] != null) {
      valuesJson = <ValuesJson>[];
      json['values_json'].forEach((v) {
        valuesJson!.add(new ValuesJson.fromJson(v));
      });
    }
    require = json['require'];
    isThumbnailChange = json['is_thumbnail_change'];
    helptextHyperlink = json['helptext_hyperlink']??" ";
    tooltipHyperlink = json['tooltip_hyperlink']??" ";
    isQuantitySelector = json['is_quantity_selector'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['option_name'] = this.optionName;
    data['option_type'] = this.optionType;
    data['option_unique_name'] = this.optionUniqueName;
    if (this.extraField != null) {
      data['extra_field'] = this.extraField!.toJson();
    }
    data['tooltip'] = this.tooltip;
    data['helptext'] = this.helptext;
    if (this.valuesJson != null) {
      data['values_json'] = this.valuesJson!.map((v) => v.toJson()).toList();
    }
    data['require'] = this.require;
    data['is_thumbnail_change'] = this.isThumbnailChange;
    data['helptext_hyperlink'] = this.helptextHyperlink;
    data['tooltip_hyperlink'] = this.tooltipHyperlink;
    data['is_quantity_selector'] = this.isQuantitySelector;
    return data;
  }
}

class ExtraField {
  String? characterLimit;
  String? maximumSelection;
  String? minimumSelection;

  ExtraField(
      {this.characterLimit, this.maximumSelection, this.minimumSelection});

  ExtraField.fromJson(Map<String, dynamic> json) {
    characterLimit = json['character_limit']??" ";
    maximumSelection = json['maximum_selection']??" ";
    minimumSelection = json['minimum_selection']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['character_limit'] = this.characterLimit;
    data['maximum_selection'] = this.maximumSelection;
    data['minimum_selection'] = this.minimumSelection;
    return data;
  }
}

class ValuesJson {
  String? optionVal;
  String? optionPrice;
  String? swatchType;
  String? swatchVal;
  String? variantId;
  String? optionTitle;
  bool? defaultVal;
  String? shippingUnit;
  double? shippingWeight;
  bool? manageInventory;
  String? inventoryCount;
  String? inventorySku;
  bool? isContinueSelling;
  bool? disabledOutOfStock;
  String? chargeType;
  List<String>? googleFonts;
  GoogleFontWithPrice? googleFontWithPrice;
  String? defaultSelectionGoogleFont;
  String? defaultSelectionGooglePrice;

  ValuesJson(
      {this.optionVal,
      this.optionPrice,
      this.swatchType,
      this.swatchVal,
      this.variantId,
      this.optionTitle,
      this.defaultVal,
      this.shippingUnit,
      this.shippingWeight,
      this.manageInventory,
      this.inventoryCount,
      this.inventorySku,
      this.isContinueSelling,
      this.disabledOutOfStock,
      this.chargeType,
      this.googleFonts,
      this.googleFontWithPrice,
      this.defaultSelectionGoogleFont,
      this.defaultSelectionGooglePrice});

  ValuesJson.fromJson(Map<String, dynamic> json) {
    optionVal = json['option_val']??" ";
    optionPrice = json['option_price']??" ";
    swatchType = json['swatch_type']??" ";
    swatchVal = json['swatch_val']??" ";
    variantId = json['variant_id']??" ";
    optionTitle = json['option_title']??" ";
    defaultVal = json['default_val'];
    shippingUnit = json['shipping_unit']??" ";
    shippingWeight = json['shipping_weight']==null?null:json['shipping_weight'];
    manageInventory = json['manage_inventory'];
    inventoryCount = json['inventory_count']??" ";
    inventorySku = json['inventory_sku']??" ";
    isContinueSelling = json['is_continue_selling'];
    disabledOutOfStock = json['disabled_out_of_stock'];
    chargeType = json['charge_type']??" ";
    googleFonts = json['google_fonts'].cast<String>();
    googleFontWithPrice = json['google_font_with_price'] != null
        ? new GoogleFontWithPrice.fromJson(json['google_font_with_price'])
        : null;
    defaultSelectionGoogleFont = json['default_selection_google_font']??" ";
    defaultSelectionGooglePrice = json['default_selection_google_price']??" ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_val'] = this.optionVal;
    data['option_price'] = this.optionPrice;
    data['swatch_type'] = this.swatchType;
    data['swatch_val'] = this.swatchVal;
    data['variant_id'] = this.variantId;
    data['option_title'] = this.optionTitle;
    data['default_val'] = this.defaultVal;
    data['shipping_unit'] = this.shippingUnit;
    data['shipping_weight'] = this.shippingWeight;
    data['manage_inventory'] = this.manageInventory;
    data['inventory_count'] = this.inventoryCount;
    data['inventory_sku'] = this.inventorySku;
    data['is_continue_selling'] = this.isContinueSelling;
    data['disabled_out_of_stock'] = this.disabledOutOfStock;
    data['charge_type'] = this.chargeType;
    data['google_fonts'] = this.googleFonts;
    if (this.googleFontWithPrice != null) {
      data['google_font_with_price'] = this.googleFontWithPrice!.toJson();
    }
    data['default_selection_google_font'] = this.defaultSelectionGoogleFont;
    data['default_selection_google_price'] = this.defaultSelectionGooglePrice;
    return data;
  }
}

class GoogleFontWithPrice {
  ADLaMDisplay? aDLaMDisplay;

  GoogleFontWithPrice({this.aDLaMDisplay});

  GoogleFontWithPrice.fromJson(Map<String, dynamic> json) {
    aDLaMDisplay = json['ADLaM Display'] != null
        ? new ADLaMDisplay.fromJson(json['ADLaM Display'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aDLaMDisplay != null) {
      data['ADLaM Display'] = this.aDLaMDisplay!.toJson();
    }
    return data;
  }
}

class ADLaMDisplay {
  double? price;
  String? optionChargeType;

  ADLaMDisplay({this.price, this.optionChargeType});

  ADLaMDisplay.fromJson(Map<String, dynamic> json) {
    price = json['price']??json['price'].toDouble();
    optionChargeType = json['option_charge_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['option_charge_type'] = this.optionChargeType;
    return data;
  }
}
