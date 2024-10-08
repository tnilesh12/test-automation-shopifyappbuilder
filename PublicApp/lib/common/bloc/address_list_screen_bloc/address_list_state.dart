
import 'package:equatable/equatable.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/modelClass/src/shopify_user/addresses/addresses.dart';



 class AddressListScreenState extends Equatable{
  AddressListScreenState();
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddressListScreenInitial extends AddressListScreenState{
  @override
  List<Object?> get props =>[];

}

class AddressListScreenLoading extends AddressListScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class AddressListScreenLoadingDialog extends AddressListScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AddressListScreenLoaded extends AddressListScreenState{
    List<Address>? addressList;
    // Addresses addressList;
    AddressListScreenLoaded(this.addressList);
  // @override
  // // TODO: implement props
  // List<Object?> get props => [];

}

class AddressListScreenNoInternet extends AddressListScreenState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class AddressListScreenNoFoundData extends AddressListScreenState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class RequiredAddressListCountry extends AddressListScreenState{
  @override 
  List<Object?> get props=>[];
}
class RequiredAddressListFirstName extends AddressListScreenState{
   @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RequiredAddressListLastName extends AddressListScreenState{
  @override

  List<Object?> get props => [];
}
class RequiredAddressListAddress1 extends AddressListScreenState{
    @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RequiredAddressListPhoneNumber extends AddressListScreenState{
  @override
  List<Object?> get props => [];
}
class RequiredAddressListCity extends AddressListScreenState{
    @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RequiredAddressListZip extends AddressListScreenState{
  @override
  List<Object?> get props =>[];
}
class RequiredAddressListCompany extends AddressListScreenState{
  @override
  List<Object?> get props => [];
}

class addressListAPIFailureState extends AddressListScreenState
{
  String message;
  addressListAPIFailureState(this.message);
}
class AddressListErrorState extends AddressListScreenState {
  String error;
  AddressListErrorState(this.error);
}
class AddressListSuccessState extends AddressListScreenState {
  String message;
  AddressListSuccessState(this.message);
}