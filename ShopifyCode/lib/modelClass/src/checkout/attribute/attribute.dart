


class Attribute {
    String? key;
     String? value;
  

   Attribute({
    this.key,
    this.value,
  });

   Attribute.fromJson(Map<String, dynamic> json)
   {
    key=json['key']??" ";
    value=json['value']??" ";

   }
   Map<String,dynamic> toJson()=>
   {
'key':'$key',
'value':'$value'
   };

}
