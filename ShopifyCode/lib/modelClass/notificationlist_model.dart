class NotificationListModel {
  bool? status;
  String? message;
  List<Result>? result;

  NotificationListModel({this.status, this.message, this.result});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result']["notificationsList"].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? title;
  String? message;
  Type? type;
  String? image;
  String? timeZone;
  String? partnerId;
  bool? isScheduled;
  String? scheduledAt;
  bool? status;
  String? segmentId;
  int? success;
  int? failure;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? jobId;

  Result(
      {this.sId,
      this.title,
      this.message,
      this.type,
      this.image,
      this.timeZone,
      this.partnerId,
      this.isScheduled,
      this.scheduledAt,
      this.status,
      this.segmentId,
      this.success,
      this.failure,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.jobId});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    message = json['message'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    image = json['image'];
    timeZone = json['timeZone'];
    partnerId = json['partnerId'];
    isScheduled = json['isScheduled'];
    scheduledAt = json['scheduledAt'];
    status = json['status'];
    segmentId = json['segmentId'];
    success = json['success'];
    failure = json['failure'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    jobId = json['jobId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['image'] = this.image;
    data['timeZone'] = this.timeZone;
    data['partnerId'] = this.partnerId;
    data['isScheduled'] = this.isScheduled;
    data['scheduledAt'] = this.scheduledAt;
    data['status'] = this.status;
    data['segmentId'] = this.segmentId;
    data['success'] = this.success;
    data['failure'] = this.failure;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['jobId'] = this.jobId;
    return data;
  }
}

class Type {
  String? id;
  String? route;

  Type({this.id, this.route});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['route'] = this.route;
    return data;
  }
}
