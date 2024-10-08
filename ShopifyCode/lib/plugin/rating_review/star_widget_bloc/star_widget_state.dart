part of 'star_widget_bloc.dart';

abstract class StarWidgetState  {
  const StarWidgetState();
}

class StarWidgetInitialState extends StarWidgetState {}

class StarWidgetLoadingState extends StarWidgetState {}

class StarWidgetLoadedState extends StarWidgetState {
  int? rating;
  StarWidgetLoadedState(this.rating);
}

class StarWidgetAPIFailureState extends StarWidgetState {
  String message;
  StarWidgetAPIFailureState(this.message);
}

class StarWidgetNoDataState extends StarWidgetState {
  int? rating;
  StarWidgetNoDataState(this.rating);
}
