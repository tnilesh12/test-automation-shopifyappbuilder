import 'package:equatable/equatable.dart';

abstract class AddressListScreenEvent {
   
  @override
  // TODO: implement props
  List<Object?> get props => [];
}




class AddressDelete extends AddressListScreenEvent{
  String? addressId;
 
  AddressDelete( this.addressId);
   @override
  // TODO: implement props
  List<Object?> get props => [];
}
