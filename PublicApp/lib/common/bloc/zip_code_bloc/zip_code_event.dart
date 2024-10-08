class ZipCodeEvent {}

class ZipCodeOnFocusEvent extends ZipCodeEvent {
String countryCode;
String zip;
ZipCodeOnFocusEvent(this.countryCode,this.zip);
}