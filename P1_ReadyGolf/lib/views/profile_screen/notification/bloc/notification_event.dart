class NotificationEvent {}

class NotificationEventOnScrollEvent extends NotificationEvent {
  int index;
  int offset;

  NotificationEventOnScrollEvent(this.index, this.offset);
}
