


class UnitPriceMeasurement {
   String? measuredType;
     String? quantityUnit;
     double? quantityValue;
     String? referenceUnit;
     int? referenceValue;

   UnitPriceMeasurement({
      this.measuredType,
      this.quantityUnit,
      this.quantityValue,
      this.referenceUnit,
      this.referenceValue,
  }) ;

   UnitPriceMeasurement.fromJson(Map<String, dynamic> json)
   {
    measuredType=json['measuredType'];
    quantityUnit=json['quantityUnit'];
    quantityValue=json['quantityValue'];
referenceUnit=json['referenceUnit'];
    referenceValue=json['referenceValue'];

   }
   Map<String,dynamic> toJson()=>
   {
'measuredType':'$measuredType',
'quantityUnit':'$quantityUnit',
'quantityValue':'$quantityValue',
'referenceUnit':'$referenceUnit',
'referenceValue':'$referenceValue'

   };

}
