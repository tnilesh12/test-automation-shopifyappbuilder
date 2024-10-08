part of 'profile_screen_bloc.dart';


class ProfileScreenEvent {
  const ProfileScreenEvent();
}


class PrivacyPolicyDataLoadEvent extends ProfileScreenEvent {}

class ReplaceReturnPolicyDataLoadEvent extends ProfileScreenEvent {}

class TermsOfServiceDataLoadEvent extends ProfileScreenEvent {}