
import 'successful_fulfilment_tracking_info/successful_fulfilment_tracking_info.dart';


class SuccessfulFullfilment {
  

String? trackingCompany;
     List<SuccessfulFullfilmentTrackingInfo>? trackingInfo;
   SuccessfulFullfilment({
this.trackingCompany,
    this.trackingInfo,
  }) ;

  static SuccessfulFullfilment fromGraphJson(Map<String, dynamic> json) {
    return SuccessfulFullfilment(
      trackingCompany: json['trackingCompany'],
      trackingInfo: _getTrackingInfoList(json['trackingInfo'] ?? []),
    );
  }

   SuccessfulFullfilment.fromJson(Map<String, dynamic> json)
   {
    trackingCompany=json['trackingCompany'];
    trackingInfo=_getTrackingInfoList(json['trackingInfo']);
   }
   Map<String,dynamic> toJson()=>
   {
'trackingCompany':'$trackingCompany',
'trackingInfo':trackingInfo
   };

  static List<SuccessfulFullfilmentTrackingInfo> _getTrackingInfoList(List<dynamic> json) {
    List<SuccessfulFullfilmentTrackingInfo> successfulFulfillmentsList = [];
    if (json.isNotEmpty) {
      json
          .forEach((e) => successfulFulfillmentsList.add(SuccessfulFullfilmentTrackingInfo.fromGraphJson(e ?? const {})));
    }
    return successfulFulfillmentsList;
  }
}
