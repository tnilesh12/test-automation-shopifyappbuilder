class PresidioQuizState {}

class PresidioQuizeInitialState extends PresidioQuizState {}

class PresidioQuizeSuccessState extends PresidioQuizState {
  dynamic data;
  PresidioQuizeSuccessState(this.data);
}

class PresidioQuizeErrorState extends PresidioQuizState{

}

class PresidioQuizSubmitState extends PresidioQuizState {
  dynamic data;
  PresidioQuizSubmitState(this.data);
}