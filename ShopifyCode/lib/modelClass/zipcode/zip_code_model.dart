class ZipCodeValidator {
  Query? query;
  ZipCodeResult? results;

  ZipCodeValidator({this.query, this.results});

  ZipCodeValidator.fromJson(Map<String, dynamic> json) {
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    results =
        json['results'] != null ?  ZipCodeResult.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Query {
  List<String>? codes;
  String? country;

  Query({this.codes, this.country});

  Query.fromJson(Map<String, dynamic> json) {
    codes = json['codes'].cast<String>();
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codes'] = this.codes;
    data['country'] = this.country;
    return data;
  }
}

class ZipCodeResult {
  List<Code>? code;

  ZipCodeResult({this.code});

  ZipCodeResult.fromJson(Map<String, dynamic> json) {
    if (json['code'] != null) {
      code = <Code>[];
      json['code'].forEach((v) {
        code!.add(new Code.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.code != null) {
      data['code'] = this.code!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Code {
  String? postalCode;
  String? countryCode;
  double? latitude;
  double? longitude;
  String? city;
  String? state;
  String? cityEn;
  String? stateEn;
  String? stateCode;

  Code(
      {this.postalCode,
      this.countryCode,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.cityEn,
      this.stateEn,
      this.stateCode});

  Code.fromJson(Map<String, dynamic> json) {
    postalCode = json['postal_code'];
    countryCode = json['country_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    cityEn = json['city_en'];
    stateEn = json['state_en'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postal_code'] = this.postalCode;
    data['country_code'] = this.countryCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['state'] = this.state;
    data['city_en'] = this.cityEn;
    data['state_en'] = this.stateEn;
    data['state_code'] = this.stateCode;
    return data;
  }
}