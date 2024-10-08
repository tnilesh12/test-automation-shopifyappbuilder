class UserListPreviewAppEvent {}

class UserListOnScrollPreviewAppEvent extends UserListPreviewAppEvent {
  int currentPage;
  int offset;

  UserListOnScrollPreviewAppEvent(this.currentPage, this.offset);
}
