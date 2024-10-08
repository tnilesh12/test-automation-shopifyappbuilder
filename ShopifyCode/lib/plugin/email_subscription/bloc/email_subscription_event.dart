class EmailSubscriptionEvent {}

class OnButtonClickEvent extends EmailSubscriptionEvent {
  String customerEmail;
  String pluginName;
  OnButtonClickEvent(this.customerEmail, this.pluginName);
}
