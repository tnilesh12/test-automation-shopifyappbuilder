class InstaFeedModel {
  List<Data>? data;

  InstaFeedModel({this.data});

  InstaFeedModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? mediaType;
  String? mediaUrl;
  String? timestamp;
  String? thumbnailUrl;
  String? caption;

  Data(
      {this.id,
      this.mediaType,
      this.mediaUrl,
      this.timestamp,
      this.thumbnailUrl,
      this.caption});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    mediaUrl = json['media_url'];
    timestamp = json['timestamp'];
    thumbnailUrl = json['thumbnail_url'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['media_url'] = this.mediaUrl;
    data['timestamp'] = this.timestamp;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['caption'] = this.caption;
    return data;
  }
}