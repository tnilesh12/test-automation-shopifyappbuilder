// part of 'country_code_bloc.dart';

 import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';

class CountryCodeEvent {
   CountryCodeEvent();
}

class OnFillterEvent extends CountryCodeEvent {
  final String text;

  OnFillterEvent(this.text) {}
}

class OnStateSelectEvent extends CountryCodeEvent{
  String searchText;
  List<Provinces> listOfState;
  OnStateSelectEvent(this.searchText,this.listOfState);
}

