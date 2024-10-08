class StyleDataModel {
  String? typographySize;
  String? headingFont;
  String? bodyFont;
  General? general;
  SideNavigation? sideNavigation;
  BottomNavigation? bottomNavigation;
  PrimaryButton? primaryButton;
  PrimaryButton? secondaryButton;
  EditText? editText;

  StyleDataModel(
      {this.typographySize,
      this.headingFont,
      this.bodyFont,
      this.general,
      this.sideNavigation,
      this.bottomNavigation,
      this.primaryButton,
      this.secondaryButton,
      this.editText});

  StyleDataModel.fromJson(Map<String, dynamic> json) {
    typographySize = json['TypographySize'];
    headingFont = json['HeadingFont'];
    bodyFont = json['BodyFont'];
    general =
        json['General'] != null ? new General.fromJson(json['General']) : null;
    sideNavigation = json['Side_Navigation'] != null
        ? new SideNavigation.fromJson(json['Side_Navigation'])
        : null;
    bottomNavigation = json['Bottom_Navigation'] != null
        ? new BottomNavigation.fromJson(json['Bottom_Navigation'])
        : null;
    primaryButton = json['Primary_Button'] != null
        ? new PrimaryButton.fromJson(json['Primary_Button'])
        : null;
    secondaryButton = json['Secondary_Button'] != null
        ? new PrimaryButton.fromJson(json['Secondary_Button'])
        : null;
    editText = json['Edit_Text'] != null
        ? new EditText.fromJson(json['Edit_Text'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TypographySize'] = this.typographySize;
    data['HeadingFont'] = this.headingFont;
    data['BodyFont'] = this.bodyFont;
    if (this.general != null) {
      data['General'] = this.general!.toJson();
    }
    if (this.sideNavigation != null) {
      data['Side_Navigation'] = this.sideNavigation!.toJson();
    }
    if (this.bottomNavigation != null) {
      data['Bottom_Navigation'] = this.bottomNavigation!.toJson();
    }
    if (this.primaryButton != null) {
      data['Primary_Button'] = this.primaryButton!.toJson();
    }
    if (this.secondaryButton != null) {
      data['Secondary_Button'] = this.secondaryButton!.toJson();
    }
    if (this.editText != null) {
      data['Edit_Text'] = this.editText!.toJson();
    }
    return data;
  }
}

class General {
  String? appBarColor;
  String? appBarTextColor;
  String? textColor;
  String? backgroundColor;
  String? successColor;
  String? errorColor;
  String? borderColor;

  General(
      {this.appBarColor,
      this.appBarTextColor,
      this.textColor,
      this.backgroundColor,
      this.successColor,
      this.errorColor,
      this.borderColor});

  General.fromJson(Map<String, dynamic> json) {
    appBarColor = json['AppBar_Color'];
    appBarTextColor = json['AppBar_Text_Color'];
    textColor = json['Text_color'];
    backgroundColor = json['Background_Color'];
    successColor = json['Success_Color'];
    errorColor = json['Error_Color'];
    borderColor = json['Border_Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppBar_Color'] = this.appBarColor;
    data['AppBar_Text_Color'] = this.appBarTextColor;
    data['Text_color'] = this.textColor;
    data['Background_Color'] = this.backgroundColor;
    data['Success_Color'] = this.successColor;
    data['Error_Color'] = this.errorColor;
    data['Border_Color'] = this.borderColor;
    return data;
  }
}

class SideNavigation {
  String? selectedTextColor;
  String? unSelectedTextColor;
  String? selectedBackgroundColor;
  String? unSelectedBackgroundColor;
  String? menuBackgroundColor;

  SideNavigation(
      {this.selectedTextColor,
      this.unSelectedTextColor,
      this.selectedBackgroundColor,
      this.unSelectedBackgroundColor,
      this.menuBackgroundColor});

  SideNavigation.fromJson(Map<String, dynamic> json) {
    selectedTextColor = json['Selected_Text_Color'];
    unSelectedTextColor = json['UnSelected_Text_Color'];
    selectedBackgroundColor = json['Selected_Background_Color'];
    unSelectedBackgroundColor = json['UnSelected_Background_Color'];
    menuBackgroundColor = json['Menu_Background_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Selected_Text_Color'] = this.selectedTextColor;
    data['UnSelected_Text_Color'] = this.unSelectedTextColor;
    data['Selected_Background_Color'] = this.selectedBackgroundColor;
    data['UnSelected_Background_Color'] = this.unSelectedBackgroundColor;
    data['Menu_Background_color'] = this.menuBackgroundColor;
    return data;
  }
}

class BottomNavigation {
  String? selectedTextColor;
  String? unSelectedTextColor;
  String? selectedBackgroundColor;
  String? unSelectedBackgroundColor;
  String? bottomNavBackgroundColor;

  BottomNavigation(
      {this.selectedTextColor,
      this.unSelectedTextColor,
      this.selectedBackgroundColor,
      this.unSelectedBackgroundColor,
      this.bottomNavBackgroundColor});

  BottomNavigation.fromJson(Map<String, dynamic> json) {
    selectedTextColor = json['Selected_Text_Color'];
    unSelectedTextColor = json['UnSelected_Text_Color'];
    selectedBackgroundColor = json['Selected_Background_Color'];
    unSelectedBackgroundColor = json['UnSelected_Background_Color'];
    bottomNavBackgroundColor = json['Bottom_Nav_Background_Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Selected_Text_Color'] = this.selectedTextColor;
    data['UnSelected_Text_Color'] = this.unSelectedTextColor;
    data['Selected_Background_Color'] = this.selectedBackgroundColor;
    data['UnSelected_Background_Color'] = this.unSelectedBackgroundColor;
    data['Bottom_Nav_Background_Color'] = this.bottomNavBackgroundColor;
    return data;
  }
}

class PrimaryButton {
  String? background;
  String? text;

  PrimaryButton({this.background, this.text});

  PrimaryButton.fromJson(Map<String, dynamic> json) {
    background = json['Background'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Background'] = this.background;
    data['Text'] = this.text;
    return data;
  }
}

class EditText {
  String? background;
  String? placeholderColor;
  String? controllerTextColor;

  EditText({this.background, this.placeholderColor, this.controllerTextColor});

  EditText.fromJson(Map<String, dynamic> json) {
    background = json['Background'];
    placeholderColor = json['Placeholder_color'];
    controllerTextColor = json['Controller_Text_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Background'] = this.background;
    data['Placeholder_color'] = this.placeholderColor;
    data['Controller_Text_color'] = this.controllerTextColor;
    return data;
  }
}
