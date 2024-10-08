

import '../../repository/ApiResponse.dart';

class CountryListData extends Serializable{
  CountryListData({
    List<Countries>? countries,}){
    _countries = countries;
  }

  CountryListData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _countries = [];
      json['data'].forEach((v) {
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


  static const countryPhoneCodes = {
    "US": "+1",
    "IN": "+91",
    "*": "",
    "AF": "+93",
    "AX": "+358",
    "AL": "+355",
    "DZ": "+213",
    "AS": "+1684",
    "AD": "+376",
    "AO": "+244",
    "AI": "+1264",
    "AQ": "+672",
    "AG": "+1268",
    "AR": "+54",
    "AM": "+374",
    "AW": "+297",
    "AU": "+61",
    "AT": "+43",
    "AZ": "+994",
    "BS": "+1242",
    "BH": "+973",
    "BD": "+880",
    "BB": "+1246",
    "BY": "+375",
    "BE": "+32",
    "BZ": "+501",
    "BJ": "+229",
    "BM": "+1441",
    "BT": "+975",
    "BO": "+591",
    "BA": "+387",
    "BW": "+267",
    "BR": "+55",
    "IO": "+246",
    "BN": "+673",
    "BG": "+359",
    "BF": "+226",
    "BI": "+257",
    "KH": "+855",
    "CM": "+237",
    "CA": "+1",
    "CV": "+238",
    "KY": "+ 345",
    "CF": "+236",
    "TD": "+235",
    "CL": "+56",
    "CN": "+86",
    "CX": "+61",
    "CC": "+61",
    "CO": "+57",
    "KM": "+269",
    "CG": "+242",
    "CD": "+243",
    "CK": "+682",
    "CR": "+506",
    "CI": "+225",
    "HR": "+385",
    "CU": "+53",
    "CY": "+357",
    "CZ": "+420",
    "DK": "+45",
    "DJ": "+253",
    "DM": "+1767",
    "DO": "+1849",
    "EC": "+593",
    "EG": "+20",
    "SV": "+503",
    "GQ": "+240",
    "ER": "+291",
    "EE": "+372",
    "ET": "+251",
    "FK": "+500",
    "FO": "+298",
    "FJ": "+679",
    "FI": "+358",
    "FR": "+33",
    "GF": "+594",
    "PF": "+689",
    "GA": "+241",
    "GM": "+220",
    "GE": "+995",
    "DE": "+49",
    "GH": "+233",
    "GI": "+350",
    "GR": "+30",
    "GL": "+299",
    "GD": "+1473",
    "GP": "+590",
    "GU": "+1671",
    "GT": "+502",
    "GG": "+44",
    "GN": "+224",
    "GW": "+245",
    "GY": "+595",
    "HT": "+509",
    "VA": "+379",
    "HN": "+504",
    "HK": "+852",
    "HU": "+36",
    "IS": "+354",
    "ID": "+62",
    "IR": "+98",
    "IQ": "+964",
    "IE": "+353",
    "IM": "+44",
    "IL": "+972",
    "IT": "+39",
    "JM": "+1876",
    "JP": "+81",
    "JE": "+44",
    "JO": "+962",
    "KZ": "+77",
    "KE": "+254",
    "KI": "+686",
    "KP": "+850",
    "KR": "+82",
    "KW": "+965",
    "KG": "+996",
    "LA": "+856",
    "LV": "+371",
    "LB": "+961",
    "LS": "+266",
    "LR": "+231",
    "LY": "+218",
    "LI": "+423",
    "LT": "+370",
    "LU": "+352",
    "MO": "+853",
    "MK": "+389",
    "MG": "+261",
    "MW": "+265",
    "MY": "+60",
    "MV": "+960",
    "ML": "+223",
    "MT": "+356",
    "MH": "+692",
    "MQ": "+596",
    "MR": "+222",
    "MU": "+230",
    "YT": "+262",
    "MX": "+52",
    "FM": "+691",
    "MD": "+373",
    "MC": "+377",
    "MN": "+976",
    "ME": "+382",
    "MS": "+1664",
    "MA": "+212",
    "MZ": "+258",
    "MM": "+95",
    "NA": "+264",
    "NR": "+674",
    "NP": "+977",
    "NL": "+31",
    "AN": "+599",
    "NC": "+687",
    "NZ": "+64",
    "NI": "+505",
    "NE": "+227",
    "NG": "+234",
    "NU": "+683",
    "NF": "+672",
    "MP": "+1670",
    "NO": "+47",
    "OM": "+968",
    "PK": "+92",
    "PW": "+680",
    "PS": "+970",
    "PA": "+507",
    "PG": "+675",
    "PY": "+595",
    "PE": "+51",
    "PH": "+63",
    "PN": "+872",
    "PL": "+48",
    "PT": "+351",
    "PR": "+1939",
    "QA": "+974",
    "RO": "+40",
    "RU": "+7",
    "RW": "+250",
    "RE": "+262",
    "BL": "+590",
    "SH": "+290",
    "KN": "+1869",
    "LC": "+1758",
    "MF": "+590",
    "PM": "+508",
    "VC": "+1784",
    "WS": "+685",
    "SM": "+378",
    "ST": "+239",
    "SA": "+966",
    "SN": "+221",
    "RS": "+381",
    "SC": "+248",
    "SL": "+232",
    "SG": "+65",
    "SK": "+421",
    "SI": "+386",
    "SB": "+677",
    "SO": "+252",
    "ZA": "+27",
    "SS": "+211",
    "GS": "+500",
    "ES": "+34",
    "LK": "+94",
    "SD": "+249",
    "SR": "+597",
    "SJ": "+47",
    "SZ": "+268",
    "SE": "+46",
    "CH": "+41",
    "SY": "+963",
    "TW": "+886",
    "TJ": "+992",
    "TZ": "+255",
    "TH": "+66",
    "TL": "+670",
    "TG": "+228",
    "TK": "+690",
    "TO": "+676",
    "TT": "+1868",
    "TN": "+216",
    "TR": "+90",
    "TM": "+993",
    "TC": "+1649",
    "TV": "+688",
    "UG": "+256",
    "UA": "+380",
    "AE": "+971",
    "GB": "+44",
    "UY": "+598",
    "UZ": "+998",
    "VU": "+678",
    "VE": "+58",
    "VN": "+84",
    "VG": "+1284",
    "VI": "+1340",
    "WF": "+681",
    "YE": "+967",
    "ZM": "+260",
    "ZW": "+263",
  };

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



