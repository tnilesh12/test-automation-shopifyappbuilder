import 'package:shopify_code/modelClass/sort_key_product_collection.dart';

class FilterList {
  List<FilterBottomList> SortBottomList = [
   FilterBottomList('Latest', false, false, SortKeyProductCollection.ID),
  FilterBottomList(
      'Best Selling', true, false, SortKeyProductCollection.BEST_SELLING),
  FilterBottomList(
      'Alphabetically A-Z', false, false, SortKeyProductCollection.TITLE),
  FilterBottomList(
      'Alphabetically Z-A', false, true, SortKeyProductCollection.TITLE),
  FilterBottomList(
      'Price - Low to High ', false, false, SortKeyProductCollection.PRICE),
  FilterBottomList(
      'Price - High to Low', false, true, SortKeyProductCollection.PRICE),
  FilterBottomList(
      'Item - Old to New ', false, false, SortKeyProductCollection.CREATED),
  FilterBottomList(
      'Item - New to Old', false, true, SortKeyProductCollection.CREATED),
  ];

}

List<FilterBottomList> SortBottomList = [
  FilterBottomList('Latest', false, false, SortKeyProductCollection.ID),
  FilterBottomList(
      'Best Selling', true, false, SortKeyProductCollection.BEST_SELLING),
  FilterBottomList(
      'Alphabetically A-Z', false, false, SortKeyProductCollection.TITLE),
  FilterBottomList(
      'Alphabetically Z-A', false, true, SortKeyProductCollection.TITLE),
  FilterBottomList(
      'Price - Low to High ', false, false, SortKeyProductCollection.PRICE),
  FilterBottomList(
      'Price - High to Low', false, true, SortKeyProductCollection.PRICE),
  FilterBottomList(
      'Item - Old to New ', false, false, SortKeyProductCollection.CREATED),
  FilterBottomList(
      'Item - New to Old', false, true, SortKeyProductCollection.CREATED),
];

class FilterBottomList {
  String title;
  bool? valuee;
  bool? reverse;
  SortKeyProductCollection sortKeyProductCollection =
      SortKeyProductCollection.BEST_SELLING;

  FilterBottomList(
      this.title, this.valuee, this.reverse, this.sortKeyProductCollection);
}