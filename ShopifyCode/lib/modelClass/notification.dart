class NotificationModel {
  String? titleLockey;
  String? body;
  // NotificationType? type;
  String? image;
  String? title;
  String? route;
  String? id;

  NotificationModel(
      {this.titleLockey,
      this.body,
      this.image,
      this.id,
      this.route,
      this.title});

  NotificationModel.fromJson(Map<String, dynamic> json1) {
    titleLockey = json1['titleLockey'];
    body = json1['body'];
    image = json1['image'];
    // type = json1['type'] != null ? new NotificationType.fromJson(json.decode(json1['type'])) : null;
    title = json1['title'];
    route = json1['routing'];
    id = json1['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleLockey'] = this.titleLockey;
    data['body'] = this.body;
    data['image'] = this.image;
    // if (this.type != null) {
    //   data['type'] = this.type!.toJson();
    // }
    data['title'] = this.title;
    data['routing'] = this.route;
    data['id'] = this.id;
    return data;
  }
}

// class NotificationType {
//   String? route;
//   String? id;

//   NotificationType({this.route, this.id});

//   NotificationType.fromJson(Map<String, dynamic> json) {
//     route = json['route'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['route'] = this.route;
//     data['id'] = this.id;
//     return data;
//   }
// }