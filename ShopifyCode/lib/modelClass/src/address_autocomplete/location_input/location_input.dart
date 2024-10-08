

// part 'location_input.freezed.dart';
// part 'location_input.g.dart';


class LocationInput{
  late double? latitude;
    late double? longitude;


   LocationInput({
     this.latitude,
    this.longitude,
  }) ;

   LocationInput.fromJson(Map<String, dynamic> json)
   {
    latitude=json['latitude'];
    longitude=json['longitude'];
   }
   Map<String,dynamic> toJson()=>{
'latitude':'$latitude',
'longitude':'$longitude'
   };
 
}
