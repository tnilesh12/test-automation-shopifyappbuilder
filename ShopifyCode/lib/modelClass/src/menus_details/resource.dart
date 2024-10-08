// class Resource {
//   String? sTypename;

//   Resource({this.sTypename});

//   Resource.fromJson(Map<String, dynamic> json) {
//     sTypename = json['__typename'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['__typename'] = this.sTypename;
//     return data;
//   }
// }