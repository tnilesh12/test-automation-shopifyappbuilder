


class Metafield {
   String? id;
     String? namespace;
     String? key;
     String? value;
     String? valueType;
     String? description;
  

   Metafield({
    this.id,
   this.namespace,
    this.key,
    this.value,
    this.valueType,
     this.description,
  }) ;

  static Metafield fromGraphJson(Map<String, dynamic> json) {
    return Metafield(
        id: (json['node'] ?? const {})['id'],
        namespace: (json['node'] ?? const {})['namespace'],
        key: (json['node'] ?? const {})['key'],
        value: (json['node'] ?? const {})['value'],
        valueType: (json['node'] ?? const {})['valueType'],
        description: (json['node'] ?? const {})['description']);
  }

   Metafield.fromJson(Map<String, dynamic> json)
   {
    id=json['id'];
namespace=json['namespace'];
key=json['key'];
value=json['value'];
valueType=json['valueType'];
description=json['description'];

   }
   Map<String,dynamic> toJson()=>
   {
'id':'$id',
'namespace':'$namespace',
'key':'$key',
'value':'$value',
'valueType':'$valueType',
'description':'$description',
   };

}
