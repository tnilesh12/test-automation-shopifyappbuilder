import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'recent_product.dart';

class DataBaseOperation {
  Database? db;
  DataBaseOperation(this.db);

  Future<void> insertProduct(String id, String title, String price,
      String image, DateTime date) async {
    // Get a reference to the database.
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.

    int delete = await (db!.delete(
      'recent_product',
      where: 'id = ?',
      whereArgs: [id],
    ));
    if (delete == 1)
      debugPrint("----------------------------->>>>1 deleted existing product");

    int? insert = await db?.insert(
      'recent_product',
      {
        "id": id,
        "title": title,
        "price": price,
        "image": image,
        "date": date.toString(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    if (insert == 1)
      debugPrint("------------------------------->>>1 product inserted");
  }

  // Future<List<Product>> getRecentProductList() async {
  //   // Get a reference to the database.

  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db!.query('recent_product');

  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //   return List.generate(maps.length, (i) {
  //     "id":maps[i].[]
  //     // Product(
  //     //   id: maps[i]['id'] as String,
  //     //   title: maps[i]['title'] as String,
  //     //   Price: maps[i]['priceCompareUpdate'] as int,
  //     //   image: maps[i]["image"] as String,
  //     // );
  //   });
  // }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<RecentProduct>> listOfProducts() async {
    // Get a reference to the database.
    // final db = await database;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> productMaps =
        await db!.query('recent_product');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
            'id': id as String,
            'title': title as String,
            'price': price as String,
            'image': image as String,
            'date': date as String,
          } in productMaps)
        RecentProduct(
            id: id, title: title, price: price, image: image, date: date),
    ];
  }

  // ConvertStringToJson(String str){
  //   str = str.replaceAll('{', '{"');
  //   str = str.replaceAll(': ', '": "');
  //   str = str.replaceAll(', ', '", "');
  //   str = str.replaceAll('}', '"}');
  //   str = str.replaceAll('"[', '[');
  //   str = str.replaceAll(']"', ']');
  //   str = str.replaceAll('"{', '{');
  //   str = str.replaceAll('}"', '}');
  //   return str;
  // }
  //
  // String convertStringToJson2(String str){
  //   str = str.replaceAll('{', '{"');
  //   str = str.replaceAll(': ', '": "');
  //   str = str.replaceAll(', ', '", "');
  //   str = str.replaceAll('}', '"}');
  //   str = str.replaceAll('"[', '["');
  //   str = str.replaceAll(']"', '"]');
  //   str = str.replaceAll('"{', '{');
  //   str = str.replaceAll('}"', '}');
  //   return str;
  // }
  // Future<int> getCartCount() async {
  //   // Get a reference to the database.

  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db!.query('cart');
  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //   return maps.length;
  // }

  // Future<void> updateCart(Cart cart) async {
  //   // Get a reference to the database.

  //   // Update the given Dog.
  //   await db!.update(
  //     'cart',
  //     cart.toMap(),
  //     // Ensure that the Dog has a matching id.
  //     where: 'id = ?',
  //     // Pass the Dog's id as a whereArg to prevent SQL injection.
  //     whereArgs: [cart.id],
  //   );
  // }

  // Future<void> deleteCart(Cart cart) async {
  //   // Get a reference to the database.

  //   // Update the given Dog.
  // await db!.delete(
  //   'cart',
  //   // Ensure that the Dog has a matching id.
  //   where: 'id = ?',
  //   // Pass the Dog's id as a whereArg to prevent SQL injection.
  //   whereArgs: [cart.id],
  // );
  // }

  // Future<void> deleteCartAll() async {
  //   // Get a reference to the database.

  //   // Update the given Dog.
  //   await db!.delete(
  //     'cart',
  //     // Ensure that the Dog has a matching id.
  //   );
  // }

  // Future<bool> checkCart(Cart cart) async {
  //   // Get a reference to the database.
  //   bool? checkcartvariantid = false;

  //   // Update the given Dog.
  //   final List<Map<String, dynamic>> maps = await db!
  //       .rawQuery('select * from cart where variantId="${cart.variantId}"');
  //   List<Cart> c = List.generate(maps.length, (i) {
  //     return Cart(
  //       id: maps[i]['id'] as int,
  //       title: maps[i]['title'] as String,
  //       quantity: maps[i]['quantity'] as int,
  //       variant: maps[i]["variant"] as String,
  //       variantId: maps[i]["variantId"] as String,
  //     );
  //   });

  //   if (c.isNotEmpty) {
  //     checkcartvariantid = true;
  //     print("update.....${checkcartvariantid}");

  //     c.first.quantity = c.first.quantity + cart.quantity;
  //     await updateCart(
  //       c.first,
  //     );
  //   } else {
  //     print("inset.....${checkcartvariantid}");
  //     await insertCart(cart);
  //   }

  //   return checkcartvariantid!;
  // }

  // Future<void> insertFavorite(String productId) async {
  //   await db!.insert(
  //     'favorites',
  //     {'product_id': productId},
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<List<String>> getFavoriteListProductsIds() async {
  //   // Get a reference to the database.

  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db!.query('favorites');

  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //   return List.generate(maps.length, (i) {
  //     return maps[i]['product_id'];
  //   });
  // }

  // Future<void> deleteFavoriteByProductId(String productId) async {
  //   await db!.delete(
  //     'favorites',
  //     where: 'product_id = ?',
  //     whereArgs: [productId],
  //   );
  // }

  // Future<bool> isProductInFavorite(String productId) async {
  //   // Get a reference to the database.

  //   // Query the 'favorites' table to check if the product is a favorite
  //   List<Map<String, dynamic>> result = await db!.query(
  //     'favorites',
  //     where: 'product_id = ?',
  //     whereArgs: [productId],
  //   );

  //   // If the result contains any entries, then the product is a favorite
  //   return result.isNotEmpty;
  // }

  Future<void> insertSearchHistory(String productId) async {
    await deleteSearchTextHistory(productId);
    await db!.insert(
      'search_history',
      {'search_text': productId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<List<SearchHistory>> getSearchHistory() async {
  //   // Get a reference to the database.

  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db!.query('search_history');

  //   // Convert the List<Map<String, dynamic> into a List<SearchHistory>.
  //   return List.generate(maps.length, (i) {
  //     return SearchHistory(
  //       id: maps[i]['id'] as int,
  //       search_text: maps[i]["search_text"] as String,
  //     );
  //   });
  // }

  Future<List<String>> getSearchTextHistory() async {
    // Get a reference to the database.

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db!.query('search_history');

    // Convert the List<Map<String, dynamic> into a List<SearchHistory>.
    return List.generate(maps.length, (i) {
      return maps[i]['search_text'];
    });
  }

  Future<void> deleteSearchTextHistory(String searchHistory) async {
    await db!.delete(
      'search_history',
      where: 'search_text = ?',
      whereArgs: [searchHistory],
    );
  }

  Future<void> deleteSearchCompleteHistory() async {
    await db!.delete('search_history');
  }
}
