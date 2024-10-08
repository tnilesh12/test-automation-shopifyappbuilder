import '../collection.dart';

class Collections {
  List<Collection>? collectionList;
  bool? hasNextPage;
  Collections({this.collectionList, this.hasNextPage});

  Collections.fromJson(Map<String, dynamic> json) {
    collectionList = _getCollectionList(json);
    hasNextPage = json['hasNextPage'];
  }
  Map<String, dynamic> toJson() =>
      {'collectionList': '$_getCollectionList', 'hasNextPage': '$hasNextPage'};

  static Collections fromGraphJson(Map<String, dynamic> json) {
    return Collections(
        collectionList: _getCollectionList(json),
        hasNextPage: (json['pageInfo'] ?? const {})['hasNextPage']);
  }

  static List<Collection> _getCollectionList(Map<String, dynamic> json) {
    List<Collection> collectionList = [];
    json['edges']?.forEach(
        (e) => collectionList.add(Collection.fromGraphJson(e ?? const {})));
    return collectionList;
  }
}
