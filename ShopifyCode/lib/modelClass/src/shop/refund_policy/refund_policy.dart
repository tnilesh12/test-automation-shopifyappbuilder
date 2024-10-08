


class RefundPolicy  {
    String? body;
    String? handle;
    String? id;
    String? title;
    String? url;
   RefundPolicy({
    this.body,
    this.handle,
    this.id,
    this.title,
    this. url,
  });

   RefundPolicy.fromJson(Map<String, dynamic> json)
   {
    body=json['body']??" ";
    handle=json['handle']??" ";
    id=json['id']??" ";
    title=json['title']??" ";
    url=json['url']??" ";
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
