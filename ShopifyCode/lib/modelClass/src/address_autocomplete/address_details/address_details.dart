


// part 'address_details.freezed.dart';
// part 'address_details.g.dart';


class AddressDetails  {
    
     String? address1;
     String? address2;
     String? city;
     String? company;
     String? completionService;
     String? country;
     String? countryCode;
     double? latitude;
     double? longitude;
     String? province;
     String? provinceCode;
     String? zip;

   AddressDetails({
     this.address1,
   this.address2,
    this.city,
   this.company,
    this.completionService,
    this.country,
    this.countryCode,
   this.latitude,
   this.longitude,
   this.province,
    this.provinceCode,
   this.zip,
  }) ;

   AddressDetails.fromJson(Map<String, dynamic> json)
   {
     address1=json['address1'];
     address2=json['address2'];
    city=json['city'];
     company=json['company'];
     completionService=json['completionService'];
     country=json['country'];
  countryCode=json['countryCode'];
     latitude=json['latitude'];
     longitude=json['longitude'];
    province=json['province'];
 provinceCode=json['provinceCode'];
    zip=json['zip'];
   }

  Map<String,dynamic> toJson()=>
  {
    'address1':'$address1',
    'address2':'$address2',
      'city':'$city',
      'company':'$company',
      'completionService':'$completionService',
     'country':'$country',
     'countryCode':'$countryCode',
     'latitude':'$latitude',
     'longitude':'$longitude',
      'province':'$province',
      'provinceCode':'$provinceCode',
     'zip':'$zip'
  };
}
