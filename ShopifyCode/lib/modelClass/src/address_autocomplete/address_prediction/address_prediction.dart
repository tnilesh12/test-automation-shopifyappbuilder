

import '../matched_substring/matched_substring.dart';

// part 'address_prediction.freezed.dart';
// part 'address_prediction.g.dart';


class AddressPrediction {
   String? addressId;
     String? description;
      List<MatchedSubstring>? matchedSubstrings;



    AddressPrediction({
     this.addressId,
    this.description,
    this.matchedSubstrings,
  }) ;

   AddressPrediction.fromJson(Map<String, dynamic> json)
   {
addressId=json['addressId'];
description=json['description'];
matchedSubstrings=json['matchedSubstrings'];
   }
Map<String,dynamic> toJson() =>{
'addressId':'$addressId',
'description':'$description',
'matchedSubstrings':'$matchedSubstrings'
};
}
