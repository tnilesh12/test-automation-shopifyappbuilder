


class SuccessfulFullfilmentTrackingInfo
 {
   String? number;
     String? url;


   SuccessfulFullfilmentTrackingInfo({
    this.number,
    this.url,
  }) ;

  static SuccessfulFullfilmentTrackingInfo fromGraphJson(
      Map<String, dynamic> json) {
    return SuccessfulFullfilmentTrackingInfo(
      number: json['number'],
      url: json['url'],
    );
  }

   SuccessfulFullfilmentTrackingInfo.fromJson(
          Map<String, dynamic> json)
          {
            number=json['number'];
            url=json['url'];
          }
          Map<String,dynamic> toJson()=>
          {
         'number':'$number',
         'url':'$url'
          };
   
}
