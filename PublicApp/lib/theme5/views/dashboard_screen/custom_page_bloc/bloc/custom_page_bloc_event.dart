part of 'custom_page_bloc_bloc.dart';

@immutable
abstract class CustomPageBlocEvent {}

class CustomPageBlocEventrefresh extends CustomPageBlocEvent {
  String? id;
  CustomPageBlocEventrefresh(this.id);
}
