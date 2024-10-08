import 'package:equatable/equatable.dart';

 class ProductFilterScreenEvent  {
  ProductFilterScreenEvent();
}
class ProductFilterIndexClickEvent extends ProductFilterScreenEvent
{
  int index;
  ProductFilterIndexClickEvent(this.index);
}