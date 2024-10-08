import 'dart:core';

class Address {
  String? id;
  String? address1;
  // String? address2;
  String? city;
  // String? company;
  String? country;
  String? countryCode;
  String? firstName;
  String? lastName;
  String? formattedArea;
  String? latitude;
  String? longitude;
  String? name;
  String? phone;
  String? province;
  String? provinceCode;
  String? zip;

  Address({
    this.id,
    this.address1,
    // this.address2,
    this.city,
    // this.company,
    this.country,
    this.countryCode,
    this.firstName,
    this.lastName,
    this.formattedArea,
    this.latitude,
    this.longitude,
    this.name,
    this.phone,
    this.province,
    this.provinceCode,
    this.zip,
  });

  static Address fromGraphJson(Map<String, dynamic> json) {
    return Address(
        id: (json['node'] ?? const {})['id'],
        address1: (json['node'] ?? const {})['address1'],
        // address2: (json['node'] ?? const {})['address2'],
        city: (json['node'] ?? const {})['city'],
        // company: (json['node'] ?? const {})['company'],
        country: (json['node'] ?? const {})['country'],
        countryCode: (json['node'] ?? const {})['countryCodeV2'],
        firstName: (json['node'] ?? const {})['firstName'],
        lastName: (json['node'] ?? const {})['lastName'],
        formattedArea: (json['node'] ?? const {})['formattedArea'],
        latitude: (json['node'] ?? const {})['latitude'],
        longitude: (json['node'] ?? const {})['longitude'],
        name: (json['node'] ?? const {})['name'],
        phone: (json['node'] ?? const {})['phone'],
        province: (json['node'] ?? const {})['province'],
        provinceCode: (json['node'] ?? const {})['provinceCode'],
        zip: (json['node'] ?? const {})['zip']);
  }

  Address.fromJson(Map<String, dynamic> json) {
    if (json.length != 0) {
      id = json['id'];
      address1 = json['address1'] ?? "";
      // address2 = json['address2'] ?? "";
      city = json['city'] ?? "";
      // company = json['company'] ?? "";
      country = json['country'] ?? "";
      countryCode = json['countryCode'] ?? "";
      firstName = json['firstName'] ?? "";
      lastName = json['lastName'] ?? "";
      formattedArea = json['formattedArea'] ?? "";
      latitude = json['latitude'] ?? "";
      longitude = json['longitude'] ?? "";
      name = json['name'] ?? "";
      phone = json['phone'] ?? "";
      province = json['province'] ?? "";
      provinceCode = json['provinceCode'] ?? "";
      zip = json['zip'] ?? "";
    }
  }
  Map<String, dynamic> toJson() => {
        'id': '$id',
        'address1': '$address1',
        // 'address2': '$address2',
        'city': '$city',
        // 'company': '$company',
        'country': '$country',
        'countryCode': '$countryCode',
        'firstName': '$firstName',
        'lastName': '$lastName',
        'formattedArea': '$formattedArea',
        'latitude': '$latitude',
        'longitude': '$longitude',
        'name': '$name',
        'phone': '$phone',
        'province': '$province',
        'provinceCode': '$provinceCode',
        'zip': '$zip',
      };

  String GetFormattedAddress() {
    String address = "";
    address = address + (address1 ?? "");
    // address = address + " " + (address2 ?? "");
    address = address + " " + (city ?? "");
    address = address + " " + (province ?? "");
    address = address + " " + (country ?? "");
    address = address + " " + (zip ?? "");
    return address;
  }

  String getAddressListAddress() {
    String address = "";
    address = address + " " + (city ?? "");
    address = address + " " + (province ?? "");
    address = address + " " + (country ?? "");
    address = address + " " + (zip ?? "");

    return address;
  }
}
