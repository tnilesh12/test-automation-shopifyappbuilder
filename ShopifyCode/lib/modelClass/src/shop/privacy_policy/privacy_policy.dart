


class PrivacyPolicy  {
   String? body;
    String? handle;
    String? id;
    String? title;
    String? url;
   PrivacyPolicy({
   this.body,
  this.handle,
    this.id,
   this.title,
    this.url,
  }) ;

   PrivacyPolicy.fromJson(Map<String, dynamic> json)
   {
    body=json['body']==null?" ":json['body'];
     handle=json['handle']==null?" ":json['handle'];
      id=json['id']==null?" ":json['id'];
       title=json['title']==null?" ":json['title'];
        url=json['url']==null?" ":json['url'];
   }
   Map<String,dynamic> toJson()=>
   {
'body':'$body',
'handle':'$handle',
'id':'$id',
'title':'$title',
'url':'$url',
   };
 
}
