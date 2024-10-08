// part of 'country_code_bloc.dart';

import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';

 class CountryCodeState {
   CountryCodeState();
}

class CountryCodeInitial extends CountryCodeState {
}

class CountryCodeLoading extends CountryCodeState {
}

class CountryCodeLoaded extends CountryCodeState {
   List<Countries>? list;
  CountryCodeLoaded(this.list){}
}

class CountryCodeNoInternet extends CountryCodeState {
}


class CountryCodeNoData extends CountryCodeState {
}

class StateCodeNoInternet extends CountryCodeState {
}


class StateLoading extends CountryCodeState {
}

class StateLoaded extends CountryCodeState {
  List<Provinces> selectedProvinces;
  StateLoaded(this.selectedProvinces);
}

class StateNoData extends CountryCodeState {
}


