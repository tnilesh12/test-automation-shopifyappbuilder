


class SelectedOption {
  String? name;
  String? value;


  SelectedOption({
    this.name,
    this.value,
  });

  SelectedOption.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() => {'name': '$name', 'value': '$value'};
}
