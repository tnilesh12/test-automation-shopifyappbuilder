class TicketZendeskModel {

  Ticket ticket;
  TicketZendeskModel(this.ticket);

  factory TicketZendeskModel.fromJson(Map<dynamic, dynamic> json) {
    return TicketZendeskModel(Ticket.fromJson(json['ticket'] ?? {}));
  }
}


class Ticket {
  int id ;
  var requester_id;


  Ticket(this.id,this.requester_id);

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      json['id'] ?? 0,
      json['requester_id'] ?? ''
    );
  }
}







