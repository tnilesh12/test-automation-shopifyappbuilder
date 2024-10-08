

import '../../../../repository/ApiResponse.dart';

class CountryListData extends Serializable{
  CountryListData({
      List<Countries>? countries,}){
    _countries = countries;
}

  CountryListData.fromJson(dynamic json) {
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? _countries;
CountryListData copyWith({  List<Countries>? countries,
}) => CountryListData(  countries: countries ?? _countries,
);
  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Countries extends Serializable{
  Countries({
      num? id, 
      String? name, 
      String? code,
    String? cc,
      String? taxName, 
      num? tax, 
      List<Provinces>? provinces,}){
    _id = id;
    _name = name;
    _code = code;
    _cc = cc;
    _taxName = taxName;
    _tax = tax;
    _provinces = provinces;
}

  Countries.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _cc = json['cc'];
    _taxName = json['tax_name'];
    _tax = json['tax'];
    if (json['provinces'] != null) {
      _provinces = [];
      json['provinces'].forEach((v) {
        _provinces?.add(Provinces.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _code;
  String? _cc;
  String? _taxName;
  num? _tax;
  List<Provinces>? _provinces;
Countries copyWith({  num? id,
  String? name,
  String? code,
  String? taxName,
  num? tax,
  List<Provinces>? provinces,
}) => Countries(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  taxName: taxName ?? _taxName,
  tax: tax ?? _tax,
  provinces: provinces ?? _provinces,
);
  num? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get taxName => _taxName;
  num? get tax => _tax;
  List<Provinces>? get provinces => _provinces;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['cc'] = _cc;
    map['tax_name'] = _taxName;
    map['tax'] = _tax;
    if (_provinces != null) {
      map['provinces'] = _provinces?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Provinces {
  Provinces({
      num? id, 
      num? countryId, 
      String? name, 
      String? code, 
      String? taxName, 
      dynamic taxType, 
      num? shippingZoneId, 
      num? tax, 
      num? taxPercentage,}){
    _id = id;
    _countryId = countryId;
    _name = name;
    _code = code;
    _taxName = taxName;
    _taxType = taxType;
    _shippingZoneId = shippingZoneId;
    _tax = tax;
    _taxPercentage = taxPercentage;
}

  Provinces.fromJson(dynamic json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _name = json['name'];
    _code = json['code'];
    _taxName = json['tax_name'];
    _taxType = json['tax_type'];
    _shippingZoneId = json['shipping_zone_id'];
    _tax = json['tax'];
    _taxPercentage = json['tax_percentage'];
  }
  num? _id;
  num? _countryId;
  String? _name;
  String? _code;
  String? _taxName;
  dynamic _taxType;
  num? _shippingZoneId;
  num? _tax;
  num? _taxPercentage;
Provinces copyWith({  num? id,
  num? countryId,
  String? name,
  String? code,
  String? taxName,
  dynamic taxType,
  num? shippingZoneId,
  num? tax,
  num? taxPercentage,
}) => Provinces(  id: id ?? _id,
  countryId: countryId ?? _countryId,
  name: name ?? _name,
  code: code ?? _code,
  taxName: taxName ?? _taxName,
  taxType: taxType ?? _taxType,
  shippingZoneId: shippingZoneId ?? _shippingZoneId,
  tax: tax ?? _tax,
  taxPercentage: taxPercentage ?? _taxPercentage,
);
  num? get id => _id;
  num? get countryId => _countryId;
  String? get name => _name;
  String? get code => _code;
  String? get taxName => _taxName;
  dynamic get taxType => _taxType;
  num? get shippingZoneId => _shippingZoneId;
  num? get tax => _tax;
  num? get taxPercentage => _taxPercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_id'] = _countryId;
    map['name'] = _name;
    map['code'] = _code;
    map['tax_name'] = _taxName;
    map['tax_type'] = _taxType;
    map['shipping_zone_id'] = _shippingZoneId;
    map['tax'] = _tax;
    map['tax_percentage'] = _taxPercentage;
    return map;
  }

}