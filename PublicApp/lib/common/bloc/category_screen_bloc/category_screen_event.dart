part of 'category_screen_bloc.dart';

abstract class CategoryScreenEvent {
  const CategoryScreenEvent();
}

class OnCategoryItemClick extends CategoryScreenEvent {
  int index;

  OnCategoryItemClick(this.index);
}

// class OnSubCategoryItemClick extends CategoryScreenEvent {
//   int index;
//   OnSubCategoryItemClick(this.index);
// }
