part of 'category_screen_bloc.dart';

abstract class CategoryScreenState {
  const CategoryScreenState();
}

class CategoryScreenInitial extends CategoryScreenState {}

class CategoryScreenLoaded extends CategoryScreenState {
  final MenuDataModel menuDataModel;
  final int index;
  CategoryScreenLoaded(this.menuDataModel, this.index);
}

class CategoryScreenLoadingCollection extends CategoryScreenState {}

class CategoryScreenLoadedCollection extends CategoryScreenState {
  CategoryScreenLoadedCollection();
}

class CategoryScreenNoDataFound extends CategoryScreenState {}

class CategoryScreenAPIFailureState extends CategoryScreenState {
  String message;
  CategoryScreenAPIFailureState(this.message);
}
