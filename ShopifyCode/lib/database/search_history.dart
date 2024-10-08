class SearchHistory {
  int? id;
  String? search_text;

  SearchHistory({
    this.id,
    this.search_text
  }) {}

  // The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'search_text' : search_text
    };
  }

  // Implement toString to make it easier to see information 
  // when using the print statement.
  @override
  String toString() {
    return 'SearchHistory{id: $id, search_text: $search_text}';
  }
}
