class Presidio1QuizEvent {}

class PresidioQuizInitialEvent extends Presidio1QuizEvent {
  PresidioQuizInitialEvent();
}

class PresidioQuizInitialEventNext extends Presidio1QuizEvent {
  PresidioQuizInitialEventNext();
}

class PresidioQuizInitialEventPrev extends Presidio1QuizEvent {
  PresidioQuizInitialEventPrev();
}

class PresidioQuizInitialEventSkip extends Presidio1QuizEvent {
  PresidioQuizInitialEventSkip();
}

class PresidioQuizInitialEventStart extends Presidio1QuizEvent {
  PresidioQuizInitialEventStart();
}

class PresidioQuizSubmitEvent extends Presidio1QuizEvent {
  PresidioQuizSubmitEvent();
}

class PresidioQuizUpdateAnsEvent extends Presidio1QuizEvent {
  dynamic ans;
  PresidioQuizUpdateAnsEvent(this.ans);
}

class PresidioQuizFinalSubmitEvent extends Presidio1QuizEvent {
  String email;
  PresidioQuizFinalSubmitEvent(this.email);
}
