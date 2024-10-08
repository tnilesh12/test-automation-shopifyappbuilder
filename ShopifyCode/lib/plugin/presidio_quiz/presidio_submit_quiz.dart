import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio1_quiz_event.dart';
import 'package:shopify_code/util/utils.dart';

import '../../theme/custom_text_theme.dart';
import '../../theme/my_text_style.dart';
import 'presidio_question_view.dart';
import 'presidio_quiz_bloc/presidio_quiz_bloc.dart';
import 'presidio_quiz_bloc/presidio_quiz_state.dart';

class PresidioSubmitQuiz {
  PresidioQuizBloc bloc;
  PresidioSubmitQuiz(this.bloc);
  TextEditingController controller = TextEditingController();
  getbuild(BuildContext context) {
    return BlocBuilder<PresidioQuizBloc, PresidioQuizState>(
        builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 181, 128, 125)),
        padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 30,
            // ),
            Container(
                // flex: 1,
                child: Icon(Icons.email)),
            SizedBox(
              height: 30,
            ),
            Container(
                // flex: 1,
                child: Text(
              bloc.DATA['quiz']['styles']['subscribe']['subheading'],
              style: TextStyle(
                  fontSize: double.parse(bloc.DATA['quiz']['styles']
                      ['subscribe']['subheadingStyles']['fontSize']),
                  fontWeight: FontWeight.w400,
                  color: Utils.getColorFromHex(bloc.DATA['quiz']['styles']
                      ['subscribe']['subheadingStyles']['textColor'])),
            )),
            SizedBox(
              height: 30,
            ),
            Container(
                // flex: 1,
                child: Text(
              bloc.DATA['quiz']['styles']['subscribe']['description'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: double.parse(bloc.DATA['quiz']['styles']
                      ['subscribe']['decline']['fontSize']),
                  fontWeight: FontWeight.w400,
                  color: Utils.getColorFromHex(bloc.DATA['quiz']['styles']
                      ['subscribe']['subheadingStyles']['textColor'])),
            )),
            SizedBox(
              height: 40,
            ),
            Container(
              // flex: 1,
              child: Focus(
                onFocusChange: (value) {
                  if (controller.text.length > 0) {
                    bloc.email = controller.text;
                  }
                },
                child: TextFormField(
                  showCursor: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    String pattern =
                        '''r'^[a-zA-Z0-9.a-zA-Z0-9.!#%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+''';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  controller: controller,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    // labelText: labelText,
                    filled: true,
                    // fillColor: Color(0xFFF2F3F5),
                    labelStyle: CustomTextTheme.getTextStyle(
                        MyTextStyle.TextFormFieldInput, context),
                    labelText: bloc.DATA['quiz']['styles']['subscribe']
                        ['placeholder'],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                context
                    .read<PresidioQuizBloc>()
                    .add(PresidioQuizFinalSubmitEvent(controller.text));
              },
              child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.all(2),
                height: 50,
                width: 210,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Utils.getColorFromHex(bloc.DATA['quiz']['styles']
                          ['subscribe']
                      ['backgroundColor']), //Color.fromARGB(255, 181, 128, 125)
                ),
                child: Text(
                  bloc.DATA['quiz']['styles']['subscribe']['confirmBtnLabel'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
