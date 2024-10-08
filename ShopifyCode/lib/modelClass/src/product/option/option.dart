


class Option {
  String? id;
  String? name;
  List<String>? values;
String? value;
 

  Option({
    this.id,
    this.name,
    this.values,
    this.value
  });

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    values = _getValues(json);
    value=json['value'];
  }

  Map<String, dynamic> toJson() =>
      {'id': '$id', 'name': '$name', 'values': '$_getValues','value':'$value'};

  static List<String> _getValues(Map<String, dynamic> json) {
    List<String> values = [];
    if (json['values'] == null) return values;
    json['values']?.forEach((e) => values.add(e ?? const {}));
    return values;
  }

}
