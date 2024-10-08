class FormModel {
  String? formId;
  String? partnerId;
  String? name;
  FormJson? formJson;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FormModel(
      {this.formId,
      this.partnerId,
      this.name,
      this.formJson,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FormModel.fromJson(Map<String, dynamic> json) {
    formId = json['_id'];
    partnerId = json['partnerId'];
    name = json['name'];
    formJson = json['formJson'] != null
        ? new FormJson.fromJson(json['formJson'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.formId;
    data['partnerId'] = this.partnerId;
    data['name'] = this.name;
    if (this.formJson != null) {
      data['formJson'] = this.formJson!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FormJson {
  String? description;
  String? buttonText;
  List<Fields>? fields;

  FormJson({this.description, this.buttonText, this.fields});

  FormJson.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    buttonText = json['buttonText'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['buttonText'] = this.buttonText;
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String? key;
  String? fieldName;
  String? name;
  // String? type;
  String? label;
  String? placeholder;
  String? keyBoardType;
  String? alignment;
  bool? required;
  String? value;
  List<Options>? options;
  String? onLabel;
  String? offLabel;

  Fields(
      {this.key,
      this.fieldName,
      this.name,
      // this.type,
      this.label,
      this.placeholder,
      this.keyBoardType,
      this.alignment,
      this.required,
      this.value,
      this.options,
      this.onLabel,
      this.offLabel});

  Fields.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    fieldName = json['fieldName'];
    name = json['name'];
    // type = json['type'];
    label = json['label'];
    placeholder = json['placeholder'];
    keyBoardType = json['KeyBoardType'];
    alignment = json['alignment'];
    required = json['required'];
    value = json['value'] ?? "";
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    onLabel = json['onLabel'];
    offLabel = json['offLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['fieldName'] = this.fieldName;
    data['name'] = this.name;
    // data['type'] = this.type;
    data['label'] = this.label;
    data['placeholder'] = this.placeholder;
    data['KeyBoardType'] = this.keyBoardType;
    data['alignment'] = this.alignment;
    data['required'] = this.required;
    data['value'] = this.value;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['onLabel'] = this.onLabel;
    data['offLabel'] = this.offLabel;
    return data;
  }
}

class Options {
  String? label;
  String? value;

  Options({this.label, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
