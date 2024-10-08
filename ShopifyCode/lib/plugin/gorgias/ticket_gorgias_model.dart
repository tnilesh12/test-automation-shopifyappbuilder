class TicketGorgiasModel {
  int id ;
  Customer customer;
  TicketGorgiasModel( this.id,this.customer);

  factory TicketGorgiasModel.fromJson(Map<dynamic, dynamic> json) {
    return TicketGorgiasModel( json['id'] ?? 0 ,Customer.fromJson(json['customer'] ?? {}));
  }
}


class Customer {
  int id ;
  String email;
  String name;
  String firstname;
  String lastname;

  Customer(this.id,this.email, this.name,this.firstname, this.lastname);

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      json['id'] ?? 0,
      json['email'] ?? '',
      json['name'] ?? '',
      json['firstname'] ?? '',
      json['lastname'] ?? ''
    );
  }
}







