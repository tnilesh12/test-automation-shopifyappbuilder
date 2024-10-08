


class MailingAddress {
  String? id;
  String? address1;
  String? city;
  String? country;
  String? zip;
  String? lastName;
  String? name;
  String? firstName;
  String? address2;
  String? company;
  String? countryCodeV2;
  String? formattedArea;
  double? latitude;
  double? longitude;
  String? phone;
  String? province;
  String? provinceCode;

  MailingAddress({
    this.id,
    this.address1,
    this.city,
    this.country,
    this.zip,
    this.lastName,
    this.name,
    this.firstName,
    this.address2,
    this.company,
    this.countryCodeV2,
    this.formattedArea,
    this.latitude,
    this.longitude,
    this.phone,
    this.province,
    this.provinceCode,
  });

  MailingAddress.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    city = json['city'];
    country = json['country'];
    zip = json['zip'];
    lastName = json['lastName'];
    name = json['name'];
    firstName = json['firstName'];
    address2 = json['address2'];
    company = json['company'];
    countryCodeV2 = json['countryCodeV2'];
    formattedArea = json['formattedArea'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    province = json['province'];
    provinceCode = json['provinceCode'];
  }

  Map<String, dynamic> toJson() => {
        'address1': '$address1',
        'city': '$city',
        'country': '$country',
        'zip': '$zip',
        'lastName': '$lastName',
        'name': '$name',
        'firstName': '$firstName',
        'address2': '$address2',
        'company': '$company',
        'countryCodeV2': '$countryCodeV2',
        'formattedArea': '$formattedArea',
        'latitude': '$latitude',
        'longitude': '$longitude',
        'phone': '$phone',
        'province': '$province',
        'provinceCode': '$provinceCode',
      };

}
