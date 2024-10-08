import 'package:equatable/equatable.dart';

abstract class AddressScreenEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddressEvent extends AddressScreenEvent {
  String? address1;
  // String? address2;
  // String? company;
  String? city;
  String? country;
  String? firstName;
  String? lastName;
  String? phone;
  String? province;
  String? provinceCode;
  String? zip;
  String? name;
  bool? isUpdate;
  String? countryCode;
  String? countryName;

  String? id;
  // String? addressId;
  AddressEvent(
    this.id,
    this.address1,
    // this.address2,
    this.city,
    // this.company,
    this.firstName,
    this.lastName,
    this.phone,
    this.province,
    this.country,
    this.zip,
    this.name,
    this.provinceCode,
    this.countryCode,
    this.countryName,
    this.isUpdate,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
