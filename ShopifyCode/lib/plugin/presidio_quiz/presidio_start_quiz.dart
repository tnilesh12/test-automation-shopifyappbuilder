import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio1_quiz_event.dart';
import 'package:shopify_code/theme/app_theme.dart';

import 'presidio_question_view.dart';
import 'presidio_quiz_bloc/presidio_quiz_bloc.dart';
import 'presidio_quiz_bloc/presidio_quiz_state.dart';

class PresidioStartQuiz {
  PresidioQuizBloc bloc;
  PresidioStartQuiz(this.bloc);
  getbuild(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color.fromARGB(255, 181, 128, 125)),
      padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 15,
            child: Center(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  // height: 480,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 181, 128, 125)),
                  child: BlocBuilder<PresidioQuizBloc, PresidioQuizState>(
                      builder: (context, state) {
                    return PresidioQuestionView(bloc.CURRENT_QUESTION_DATA,
                        (data) {
                      print("response of answer::: ${data}");

                      context
                          .read<PresidioQuizBloc>()
                          .add(PresidioQuizUpdateAnsEvent(data));
                    });
                  })),
            ),
          ),
          Expanded(
            child: bloc.CURRENT_QUESTION_DATA['allowSkip']
                ? InkWell(
                    onTap: () {
                      bloc.add(PresidioQuizInitialEventSkip());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      height: 10,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 181, 128, 125)),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: AppTheme.primaryButtonText),
                      ),
                    ),
                  )
                : Container(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    bloc.add(PresidioQuizInitialEventPrev());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 1,
                        //   color: Colors.grey,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.primaryButtonBackground),
                    child: Text(
                      "Previous",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.primaryButtonText),
                    ),
                  ),
                ),
                SizedBox(
                  width: 19,
                ),
                InkWell(
                  onTap: () {
                    bloc.add(PresidioQuizInitialEventNext());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   width: 1,
                        //   color: Colors.grey,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.primaryButtonBackground),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.primaryButtonText),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
