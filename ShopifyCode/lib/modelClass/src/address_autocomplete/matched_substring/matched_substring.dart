

// part 'matched_substring.freezed.dart';
// part 'matched_substring.g.dart';


class MatchedSubstring  {
   int? length;
    int? offset;
    MatchedSubstring({
    this.length,
    this.offset,
  }) ;

   MatchedSubstring.fromJson(Map<String, dynamic> json) 
   {
    length=json['length'];
    offset=json['offset'];
   }
   Map<String,dynamic> toJson()=>
   {
'length':'$length',
'offset':'$offset'
   };

}
