


class PrimaryDomain  {
  String? host;
   bool? sslEnabled;
    String? url;
   PrimaryDomain({this.host, this.sslEnabled, this.url});
  

   PrimaryDomain.fromJson(Map<String, dynamic> json)
   {
    host=json['host'];
    sslEnabled=json['sslEnabled'];
    url=json['url'];
   }
   Map<String,dynamic> toJson()=>
   {
'host':'$host',
'sslEnabled':'$sslEnabled',
'url':'$url'
   };

}
