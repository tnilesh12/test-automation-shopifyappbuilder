part of 'profile_screen_bloc.dart';

abstract class ProfileScreenState {
  const ProfileScreenState();
}

final class ProfileScreenInitial extends ProfileScreenState {}

final class ProfileScreenLoadingState extends ProfileScreenState {}

final class ProfileScreenLoaded extends ProfileScreenState {}


final class ProfileScreenIsUserLoginState extends ProfileScreenState {
  bool isLogin;
  ProfileScreenIsUserLoginState(this.isLogin);
}


final class ProfileScreenAPIFailureState extends ProfileScreenState {
  String message;
  ProfileScreenAPIFailureState(this.message);
}

final class ProfileScreenPrivacyPolicySuccessState extends ProfileScreenState {
  PrivacyPolicy privacyPolicy;
  ProfileScreenPrivacyPolicySuccessState(this.privacyPolicy);
}

final class ProfileScreenReplaceReturnPolicySuccessState
    extends ProfileScreenState {
  RefundPolicy refundPolicy;
  ProfileScreenReplaceReturnPolicySuccessState(this.refundPolicy);
}

final class ProfileScreenTermsOfServiceSuccessState extends ProfileScreenState {
  TermsOfService termsOfService;
  ProfileScreenTermsOfServiceSuccessState(this.termsOfService);
}
