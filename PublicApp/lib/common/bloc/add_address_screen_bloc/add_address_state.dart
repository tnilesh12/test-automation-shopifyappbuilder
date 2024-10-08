

import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/modelClass/zipcode/zip_code_model.dart';

abstract class AddressScreenState  {
   AddressScreenState();
}

class AddressScreenInitial extends AddressScreenState {
  @override
  List<Object> get props => [];
}

class AddressScreenCountryLoaded extends AddressScreenState {
  String code;
  AddressScreenCountryLoaded(this.code);
  @override
  List<Object> get props => [];
}

class AddressScreenLoading extends AddressScreenState {
  @override
  List<Object> get props => [];
}
class AddressScreenLoaded extends AddressScreenState {
  AddressScreenLoaded();

  @override
  List<Object> get props => [];
}
class AddressScreenNoDataFound extends AddressScreenState {
  @override
  List<Object> get props => [];
}

class AddressScreenNoInternet extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredCountry extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredAddressFirstName extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredAddressLastName extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredAddressCompany extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredAddress1 extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class RequiredAddress2 extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredCity extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredProvince extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RequiredZip extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class RequiredCountryCode extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class CountryCodeLoaded extends AddressScreenState{
  // @override
  // TODO: implement props
  // List<Object?> get props =>[];
  List<Countries> list;
  CountryCodeLoaded(this.list){}

}
class RequiredPhoneNumber extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Success extends AddressScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class Error extends AddressScreenState{
  String message;
  Error(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class AddAddressErrorState extends AddressScreenState{
  String error;
  AddAddressErrorState(this.error);
}
// class ZipCodeLoaded extends AddressScreenState{
//     List<Code>? codeList;
//     // Addresses addressList;
//     ZipCodeLoaded(this.codeList);
//   // @override
//   // // TODO: implement props
//   // List<Object?> get props => [];

// }