class PartnerInfoModel {
  String? sId;
  int? shopifyId;
  String? name;
  String? email;
  String? password;
  String? domain;
  String? city;
  String? country;
  String? zip;
  String? shopOwner;
  String? myshopifyDomain;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? phoneNumber;
  String? planName;
  String? trailDate;
  String? subscribeId;
  dynamic? amount;
  String? chargeId;
  String? planDate;
  AppSettings? appSettings;
  List<Settings>? settings;
  List<Plugins>? plugins;
  int? remainingDays;
  String? currentTheme;
  String? publishedTheme;

  PartnerInfoModel(
      {this.sId,
      this.shopifyId,
      this.name,
      this.email,
      this.password,
      this.domain,
      this.city,
      this.country,
      this.zip,
      this.shopOwner,
      this.myshopifyDomain,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.phoneNumber,
      this.planName,
      this.trailDate,
      this.subscribeId,
      this.amount,
      this.chargeId,
      this.planDate,
      this.appSettings,
      this.settings,
      this.plugins,
      this.remainingDays,
      this.currentTheme,
      this.publishedTheme});

  PartnerInfoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopifyId = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    domain = json['domain'];
    city = json['city'];
    country = json['country'];
    zip = json['zip'];
    shopOwner = json['shop_owner'];
    myshopifyDomain = json['myshopify_domain'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    planName = json['planName'] ?? "CUSTOM";
    trailDate = json['trailDate'];
    subscribeId = json['subscribeId'];
    amount = json['amount'];
    chargeId = json['charge_id'];
    planDate = json['planDate'];
    appSettings = json['appSettings'] != null
        ? new AppSettings.fromJson(json['appSettings'])
        : null;
    if (json['settings'] != null) {
      settings = <Settings>[];
      json['settings'].forEach((v) {
        settings!.add(new Settings.fromJson(v));
      });
    }
    plugins = <Plugins>[];
    if (json['plugins'] != null) {
      json['plugins'].forEach((v) {
        plugins!.add(new Plugins.fromJson(v));
      });
    }
    remainingDays = json['remainingDays'];
    currentTheme = json['currentTheme'];
    publishedTheme = json['publishedTheme'] ?? "first";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.shopifyId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['domain'] = this.domain;
    data['city'] = this.city;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['shop_owner'] = this.shopOwner;
    data['myshopify_domain'] = this.myshopifyDomain;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['phoneNumber'] = this.phoneNumber;
    data['planName'] = this.planName;
    data['trailDate'] = this.trailDate;
    data['subscribeId'] = this.subscribeId;
    data['amount'] = this.amount;
    data['charge_id'] = this.chargeId;
    data['planDate'] = this.planDate;
    if (this.appSettings != null) {
      data['appSettings'] = this.appSettings!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.map((v) => v.toJson()).toList();
    }
    if (this.plugins != null) {
      data['plugins'] = this.plugins!.map((v) => v.toJson()).toList();
    }
    data['remainingDays'] = this.remainingDays;
    data['currentTheme'] = this.currentTheme;
    data['publishedTheme'] = this.publishedTheme;
    return data;
  }
}

class AppSettings {
  String? appIconSrc;
  String? launchImageSrc;
  String? appName;
  bool? enableLoader;
  String? loaderColor;
  String? updatedAt;

  AppSettings(
      {this.appIconSrc,
      this.launchImageSrc,
      this.appName,
      this.enableLoader,
      this.loaderColor,
      this.updatedAt});

  AppSettings.fromJson(Map<String, dynamic> json) {
    appIconSrc = json['App_Icon_Src'];
    launchImageSrc = json['Launch_Image_Src'];
    appName = json['App_Name'];
    enableLoader = json['Enable_Loader'];
    loaderColor = json['Loader_Color'] ?? "#FFFFFF";
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['App_Icon_Src'] = this.appIconSrc;
    data['Launch_Image_Src'] = this.launchImageSrc;
    data['App_Name'] = this.appName;
    data['Enable_Loader'] = this.enableLoader;
    data['Loader_Color'] = this.loaderColor;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Settings {
  String? sId;
  String? title;
  String? description;
  String? plan;
  bool? value;
  String? settingsEnum;
  OtherData? otherData;
  DefaultLanguage? defaultLanguage;
  String? minimumValue;
  SplashImages? splashImages;

  Settings(
      {this.sId,
      this.title,
      this.description,
      this.plan,
      this.value,
      this.settingsEnum,
      this.otherData,
      this.defaultLanguage,
      this.minimumValue,
      this.splashImages});

  Settings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    plan = json['plan'];
    value = json['value'];
    settingsEnum = json['settingsEnum'];
    otherData = json['otherData'] != null
        ? new OtherData.fromJson(json['otherData'])
        : null;
    defaultLanguage = json['defaultLanguage'] != null
        ? new DefaultLanguage.fromJson(json['defaultLanguage'])
        : null;
    minimumValue = json['minimumValue'];
    splashImages = json['ImagesObj'] != null
        ? new SplashImages.fromJson(json['ImagesObj'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['plan'] = this.plan;
    data['value'] = this.value;
    data['settingsEnum'] = this.settingsEnum;
    if (this.otherData != null) {
      data['otherData'] = this.otherData!.toJson();
    }
    if (this.defaultLanguage != null) {
      data['defaultLanguage'] = this.defaultLanguage!.toJson();
    }
    data['minimumValue'] = this.minimumValue;
     if (this.splashImages != null) {
      data['ImagesObj'] = this.splashImages!.toJson();
    }
    return data;
  }
}

class SplashImages {
  String? imageOne;
  String? imageTwo;
  String? imageThree;

  SplashImages({this.imageOne, this.imageTwo, this.imageThree});

  SplashImages.fromJson(Map<String, dynamic> json) {
    imageOne = json['imageOne'];
    imageTwo = json['imageTwo'];
    imageThree = json['imageThree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageOne'] = this.imageOne;
    data['imageTwo'] = this.imageTwo;
    data['imageThree'] = this.imageThree;
    return data;
  }
}

class OtherData {
  List<Language>? language;
  String? position;
  String? symbol;

  OtherData({this.language, this.position, this.symbol});

  OtherData.fromJson(Map<String, dynamic> json) {
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(new Language.fromJson(v));
      });
    }
    position = json['position'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Language {
  String? language;
  bool? selected;
  String? code;

  Language({this.language, this.selected, this.code});

  Language.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    selected = json['selected'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['selected'] = this.selected;
    data['code'] = this.code;
    return data;
  }
}

class DefaultLanguage {
  String? language;
  String? code;

  DefaultLanguage({this.language, this.code});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['code'] = this.code;
    return data;
  }
}

class Plugins {
  String? sId;
  String? title;
  List<Apps>? apps;

  Plugins({this.sId, this.title, this.apps});

  Plugins.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['apps'] != null) {
      apps = <Apps>[];
      json['apps'].forEach((v) {
        apps!.add(new Apps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.apps != null) {
      data['apps'] = this.apps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Apps {
  String? sId;
  String? name;
  bool? isOn;
  Secrets? secrets;
  String? link;
  String? pluginsEnum;

  Apps(
      {this.sId,
      this.name,
      this.isOn,
      this.secrets,
      this.link,
      this.pluginsEnum});

  Apps.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isOn = json['isOn'];
    secrets = json['secretes'] != null
        ? new Secrets.fromJson(json['secretes'])
        : null;
    link = json['link'];
    pluginsEnum = json['pluginsEnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['isOn'] = this.isOn;
    if (this.secrets != null) {
      data['secretes'] = this.secrets!.toJson();
    }
    data['link'] = this.link;
    data['pluginsEnum'] = this.pluginsEnum;
    return data;
  }
}

class Secrets {
  String? accessToken;
  String? appKey;
  String? clintId;
  String? secret;
  String? redirectUrl;
  String? email;
  bool? showOnSignUpPage;
  bool? popUp;
  String? baseUrl;
  String? subscriberId;

  Secrets(
      {this.accessToken,
      this.appKey,
      this.clintId,
      this.secret,
      this.redirectUrl,
      this.email,
      this.showOnSignUpPage,
      this.popUp,
      this.baseUrl,
      this.subscriberId});

  Secrets.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    appKey = json['app_key'];
    clintId = json['clintId'];
    secret = json['secret '];
    redirectUrl = json['redirectUrl'];
    email = json['email'];
    showOnSignUpPage = json['sign_page'];
    popUp = json['pop_up'];
    baseUrl = json['baseUrl'];
    subscriberId = json['subscriber_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['app_key'] = this.appKey;
    data['clintId'] = this.clintId;
    data['secret '] = this.secret;
    data['redirectUrl'] = this.redirectUrl;
    data['email'] = this.email;
    data['sign_page'] = this.showOnSignUpPage;
    data['pop_up'] = this.popUp;
    data['baseUrl'] = this.baseUrl;
    data['subscriber_id'] = this.subscriberId;
    return data;
  }
}
