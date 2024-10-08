

class ShippingAddress {
  String? name;
     String? firstName;
     String? id;
     String? lastName;
     String? address1;
     String? city;
     String? country;
    String? address2;
    String? company;
    String? countryCodeV2;
    double? latitude;
    double? longitude;
    String? phone;
    String? province;
    String? provinceCode;
     String? zip;
   ShippingAddress({
    this.name,
    this.firstName,
    this.id,
    this.lastName,
    this.address1,
    this.city,
   this.country,
   this.address2,
   this.company,
  this.countryCodeV2,
   this.latitude,
   this.longitude,
   this.phone,
   this.province,
   this.provinceCode,
   this.zip,
  }) ;

   ShippingAddress.fromJson(Map<String, dynamic> json)
   {
    name=json['name'];
      firstName=json['firstName'];
        id=json['id'];
          lastName=json['lastName'];
            address1=json['address1'];
              city=json['city'];
                country=json['country'];
                  address2=json['address2'];
                    company=json['company'];
                      countryCodeV2=json['countryCodeV2'];
                        latitude=json['latitude'];
                          longitude=json['longitude'];
                            province=json['province'];
                              provinceCode=json['provinceCode'];
                                zip=json['zip'];
                                 phone=json['phone'];
                                

   }
   Map<String,dynamic> toJson()=>
   {
'name':'$name',
'firstName':'$firstName',
'id':'$id',
'lastName':'$lastName',
'address1':'$address1',
'city':'$city',
'country':'$country',
'address2':'$address2',
'company':'$company',
'countryCodeV2':'$countryCodeV2',
'latitude':'$latitude',
'longitude':'$longitude',
'province':'$province',
'provinceCode':'$provinceCode',
'zip':'$zip',
'phone':'$phone'
   };


 String GetFormattedAddress(){
     String address = "";
  address = address + (address1??"");
  address = address + " " +(address2??"");
  address = address + " "+ (city??"");
  address = address + " "+ (province??"");
  address = address + " "+ (country??"");
  address = address + " "+(zip??"");
     return address;


  }

}
