class SmileIoDashboardScreenState {}

class SmileIoDashboardScreenInitialState extends SmileIoDashboardScreenState {}

class SmileIoDashboardScreenLoadingState extends SmileIoDashboardScreenState {}

class SmileIoDashboardScreenDataLoaded extends SmileIoDashboardScreenState {}

class SmileIoDashboardScreenAPIFailureState
    extends SmileIoDashboardScreenState {
  String message;
  SmileIoDashboardScreenAPIFailureState(this.message);
}
