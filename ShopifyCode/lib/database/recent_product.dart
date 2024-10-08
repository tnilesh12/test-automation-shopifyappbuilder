class RecentProduct {
  String? id;
  late String title;
  late String price;
  late String image;
  late String date;

  // ProductVariant GetVariant() {
  //   Map<String, dynamic> valueMap = jsonDecode(variant);
  //   return ProductVariant.fromJson(valueMap);
  // }

  RecentProduct({
    this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.date,
  }) {}

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'date': date,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Cart{id: $id, title: $title, price: $price, image: $image,date:$date}';
  }
}
