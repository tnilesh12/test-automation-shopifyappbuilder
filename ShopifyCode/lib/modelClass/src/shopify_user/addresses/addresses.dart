import 'dart:convert';
import '../address/address.dart';

class Addresses {
  List<Address>? addressList;
  
  Addresses({this.addressList});


  static Addresses fromGraphJson(Map<String, dynamic> json) {
    return Addresses(addressList: _getAddressList(json));
  }

  Addresses.fromJson(Map<String, dynamic> json) {
    addressList = _getAddressList(json);
  }
  Map<String, dynamic> toJson() => {
        'addressList': addressList,
      };
  static _getAddressList(Map<String, dynamic> json) {
    List<Address> addressList = [];
    json['edges']?.forEach((address) =>
        addressList.add(Address.fromGraphJson(address ?? const [])));
    return addressList;
  }
}
