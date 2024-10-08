import 'package:shopify_code/modelClass/form/form_model.dart';

class CustomFormEvent {}

class CustomFormOnSubmitEvent extends CustomFormEvent {
  FormModel formModel;
  CustomFormOnSubmitEvent(this.formModel);
}


class CustomFormReloadEvent extends CustomFormEvent {

  CustomFormReloadEvent();
}