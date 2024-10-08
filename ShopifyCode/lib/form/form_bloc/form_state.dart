import 'package:shopify_code/modelClass/form/form_model.dart';

class CustomFormState {}

class CustomFormInitialState extends CustomFormState {}

class CustomFormLoadingState extends CustomFormState {}

class CustomFormDataLoadedState extends CustomFormState {
  FormModel formModel;
  CustomFormDataLoadedState(this.formModel);
}

class CustomFormSubmittedSuccessfullyState extends CustomFormState {
  String message;
  CustomFormSubmittedSuccessfullyState(this.message);
}

class CustomFormAPIFailureState extends CustomFormState {
  String message;
  CustomFormAPIFailureState(this.message);
}

class CustomFormSubmittingState extends CustomFormState {}
