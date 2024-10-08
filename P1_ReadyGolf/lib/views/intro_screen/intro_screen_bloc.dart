import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopify_code/session/session.dart';
part 'intro_screen_event.dart';
part 'intro_screen_state.dart';

class IntroScreenBloc extends Bloc<IntroScreenEvent, IntroScreenState> {
  IntroScreenBloc() : super(IntroScreenInitial()) {
    on<IntroScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    Load();
  }

  Load() async {
    bool islogin = await Session().IsLogin();
    if (islogin) {
      emit(IntroScreenUserLogin());
    }
  }
}
