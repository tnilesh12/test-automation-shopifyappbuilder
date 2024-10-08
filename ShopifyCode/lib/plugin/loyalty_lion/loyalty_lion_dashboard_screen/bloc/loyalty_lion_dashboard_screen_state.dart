class LoyaltyLionDashboardScreenState {}

class LoyaltyLionDashboardScreenInitialState extends LoyaltyLionDashboardScreenState {}

class LoyaltyLionDashboardScreenLoadingState extends LoyaltyLionDashboardScreenState {}

class LoyaltyLionDashboardScreenDataLoaded extends LoyaltyLionDashboardScreenState {}

class LoyaltyLionDashboardScreenAPIFailureState
    extends LoyaltyLionDashboardScreenState {
  String message;
  LoyaltyLionDashboardScreenAPIFailureState(this.message);
}
