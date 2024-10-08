import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio1_quiz_event.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio_quiz_state.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/repository/api_repository_without_base_url.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PresidioQuizBloc extends Bloc<Presidio1QuizEvent, PresidioQuizState> {
  PresidioQuizBloc() : super(PresidioQuizeInitialState()) {
    getData();
    on<PresidioQuizInitialEventNext>((events, emit) {
      CURRENT_INDEX++;
      if (CURRENT_INDEX >= getLength()) {
        CURRENT_INDEX--;
        ISSUBMIT = true;
        ISSTART = false;
      }
      CURRENT_QUESTION_DATA = DATA["quiz"]["questions"][CURRENT_INDEX];
      print("PresidioQuizInitialEventNext${ISSTART} ${ISSUBMIT}");
      emit(PresidioQuizeSuccessState(DATA));
    });
    on<PresidioQuizInitialEventPrev>((events, emit) {
      CURRENT_INDEX--;
      if (CURRENT_INDEX < 0) {
        CURRENT_INDEX = 0;
      }
      CURRENT_QUESTION_DATA = DATA["quiz"]["questions"][CURRENT_INDEX];
      print("PresidioQuizInitialEventPrev");
      emit(PresidioQuizeSuccessState(DATA));
    });
    on<PresidioQuizInitialEventSkip>((events, emit) {
      CURRENT_INDEX++;
      if (CURRENT_INDEX > getLength()) {
        CURRENT_INDEX--;
        ISSUBMIT = true;
        ISSTART = false;
      }
      CURRENT_QUESTION_DATA = DATA["quiz"]["questions"][CURRENT_INDEX];
      print("PresidioQuizInitialEventSkip");
      emit(PresidioQuizeSuccessState(DATA));
    });

    on<PresidioQuizInitialEventStart>((events, emit) {
      ISSTART = true;
      print("sdfdsf");
      emit(PresidioQuizeSuccessState(DATA));
    });

    on<PresidioQuizSubmitEvent>((events, emit) {
      ISSUBMIT = true;
      print("sdfdsf");
      emit(PresidioQuizeSuccessState(DATA));
    });

    on<PresidioQuizUpdateAnsEvent>((events, emit) {
      print(
          "***************${DATA["quiz"]["questions"].length}++++${CURRENT_INDEX}*****${DATA["quiz"]["questions"][CURRENT_INDEX]["answers"].length}");
      int index = 0;
      DATA["quiz"]["questions"][CURRENT_INDEX]["answers"].forEach((p) {
        print("._____===========>>.${p}");
        print(".==========><><>M><><>.${events.ans}");

        if (p["id"] == events.ans["id"]) {
          DATA["quiz"]["questions"][CURRENT_INDEX]["answers"].removeAt(index);
          p["selected"] = true;
          DATA["quiz"]["questions"][CURRENT_INDEX]["answers"].insert(index, p);
        } else {
          if (DATA["quiz"]["questions"][CURRENT_INDEX]["multiSelection"] ==
              false) {
            DATA["quiz"]["questions"][CURRENT_INDEX]["answers"].removeAt(index);
            p["selected"] = false;
            DATA["quiz"]["questions"][CURRENT_INDEX]["answers"]
                .insert(index, p);
          }
        }

        index++;
      });
      print(
          "dddd...${DATA["quiz"]["questions"][CURRENT_INDEX]["answers"]}.....");

      emit(PresidioQuizeSuccessState(DATA));
    });

    on<PresidioQuizFinalSubmitEvent>((event, emit) {
      if (event.email == null || event.email.length == 0) {
        print("wrong email");
      } else {
        var rules = {}, answers = [], userData;
        userData = {"acceptsMarketing": true, "email": event.email};

        DATA["quiz"]["questions"].forEach((question) {
          var ans = [];
          var selectedAnswers = [];
          question["answers"].forEach((p) {
            print(p);
            print(p["selected"]);
            if (p["selected"] == true) {
              ans.add(p["id"]);
              selectedAnswers.add({"id": p["id"], "value": p["name"]});
            }
          });
          answers.add({
            "questionId": question["id"],
            "questionTitle": question["name"],
            "selectedAnswers": selectedAnswers
          });
          rules[question["id"].toString()] = ans;
        });

        var finalResult = {
          "rules": rules,
          "answers": answers,
          "userData": userData,
          "redirectResult": false
        };

        submitData(finalResult);

        String str = finalResult.toString();

        print(
            "----------->>><><><><<<><><><><><><><><><><> final Result ******* ${finalResult}------->>${str}");
      }
    });
  }

  dynamic CURRENT_QUESTION_DATA;
  dynamic DATA;
  int CURRENT_INDEX = 0;
  bool ISSTART = false;
  bool ISSUBMIT = false;
  String email = "";

  getLength() {
    return DATA["quiz"]["questions"].length;
  }

  getData() async {
    
    ApiResponse res =
        await ApiRepositoryWithoutBaseUrl.getAPI(ApiConst.startQuiz
            // "https://api.quizkitapp.com/api/v1/quizzes/1jVH02ZYrq"
            );

    if (res.status) {
      DATA = res.data;
      CURRENT_QUESTION_DATA = DATA["quiz"]["questions"][CURRENT_INDEX];
      print("------------->>>>>>>>>>data of quiz ${res.data}");
      emit(PresidioQuizeSuccessState(res.data));
    } else {
      emit(PresidioQuizeErrorState());
    }
  }

  submitData(dynamic finalData) async {
    print("++++++++++++>API CALLING------>>>");
    ApiResponse response = await ApiRepositoryWithoutBaseUrl.postAPI(
        "https://api.quizkitapp.com/api/v1/quizzes/1jVH02ZYrq?presentment_currencies=USD&countryCode=US",
        finalData);

    if (response.status) {
      print(
          "----------------<><><><><><><><>Data Submitted------------->>>>${response.message}------${response.data}");
          emit(PresidioQuizSubmitState(response.data));
    } else {
      print("there is some ERROR in api response ${response.message}");
    }
  }
}
