


class ShopifyImage {
  String? originalSrc;
  String? id;
  String? altText;
String? url;
  

  ShopifyImage({
    this.originalSrc,
    this.id,
    this.altText,
    this.url
  });

  ShopifyImage.fromJson(Map<String, dynamic> json) {
 if( json['originalSrc'] !=null)
  {
    originalSrc = json['originalSrc'];
  }
  else{
    originalSrc = json['url'];
  }
    id = json['id']?? " ";
    altText = json['altText']==null? " ":json['altText'];
    url=json['url']??" ";
  }

  Map<String, dynamic> toJson() =>
      {'originalSrc': '$originalSrc', 'id': '$id', 'altText': '$altText','url':'$url'};

}
