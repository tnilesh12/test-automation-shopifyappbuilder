import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItgeekWidgetFaq extends StatefulWidget {
  FAQData faqData;
  ItgeekWidgetFaq(this.faqData);
  @override
  State<ItgeekWidgetFaq> createState() => _FAQState();
}

class _FAQState extends State<ItgeekWidgetFaq> {
  bool isExpanded = false;
  List<QuestionAndAnswerList> listQuestionAnswer = [];
  QuestionAndAnswerList? previous;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.faqData.questionAndAnswerList!
        .map((item) => {listQuestionAnswer.add(item)})
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    listQuestionAnswer.clear();
    widget.faqData.questionAndAnswerList!
        .map((item) => {listQuestionAnswer.add(item)})
        .toList();

    print("listQuestionAnswer $listQuestionAnswer");
    return Container(
        width: double.infinity,
      padding: EdgeInsets.fromLTRB(DashboardFontSize.paddingLeft, 10,
          DashboardFontSize.paddingRight, 10),
        // margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Utils.getColorFromHex(widget.faqData.backgroundColor!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.faqData.heading!,
            style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Utils.getColorFromHex(widget.faqData.textColor!),
                                          fontSize:
                                              DashboardFontSize.headingFontSize)
            ),
            Container(
              child: ListView.separated(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listQuestionAnswer.length,
                separatorBuilder: (context, index) {
                  return Container();
                  //  Divider(
                  //   height: 2,
                  //   color: const Color.fromARGB(255, 84, 84, 84),
                  // );
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 2, bottom: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // if (widget.faqData.ViewType == ViewType.FAQDetailView.name) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => ItgeekWidgetFullView(
                            //               "",
                            //               listQuestionAnswer[index].question!,
                            //               listQuestionAnswer[index].answer,
                            //                   widget.faqData.styleProperties!.alignment,
                            //                  widget.faqData.styleProperties!.titleTextColor,
                            //                   widget.faqData.styleProperties!.descriptionTextColor,
                            //                   widget.faqData.styleProperties!.titleTextFontSize!,
                            //                   widget.faqData.styleProperties!.descriptionTextFontSize!,
                            //                   widget.faqData.styleProperties!.padding!,
                            //                   widget.faqData.styleProperties!.margin!,
                            //                   widget.faqData.styleProperties!.backgroundColor,
                            //                   widget.faqData.styleProperties!.backgroundColor
                            //               )));
                            // } else {
                            setState(() {
                              if (listQuestionAnswer[index].expand!) {
                                listQuestionAnswer[index].expand = false;
                                isExpanded = false;
                                previous = null;
                              } else {
                                if (previous != null) {
                                  previous!.expand = false;
                                }
                                isExpanded = true;
                                listQuestionAnswer[index].expand = true;
                                previous = listQuestionAnswer[index];
                              }
                              listQuestionAnswer.clear();
                            });
                            // }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6, bottom: 4),
                                  child: Text(
                                    listQuestionAnswer[index].question!,
                                    style: TextStyle(
                                        color: Utils.getColorFromHex(
                                            widget.faqData.textColor!),
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            DashboardFontSize.subHeadingFontSize),
                                  ),
                                ),
                              ),
                              // widget.faqData.arrowVisibility!?
                              Container(
                                  padding: EdgeInsets.all(10),
                                  // child:
                                  // Transform.rotate(
                                  //   angle: listQuestionAnswer[index].expand!
                                  //       ? 1.5708
                                  //       : 0.0, // 90 degrees in radians
                                  child:
                                      // Icon(
                                      //   Icons.arrow_forward_ios,
                                      //   size: 14,
                                      //   color: Utils.getColorFromHex(
                                      //       widget.faqData.textColor!),
                                      // ),
                                      Container(
                                          height: 14,
                                          width: 14,
                                          child: SvgPicture.asset(
                                              listQuestionAnswer[index].expand!
                                                  ? "assets/images/remove.svg"
                                                  : "assets/images/add.svg",
                                              colorFilter: ColorFilter.mode(
                                                  Utils.getColorFromHex(
                                                      widget.faqData.textColor!),
                                                  BlendMode.srcIn)))
                                  // ),
                                  )
                              // : SizedBox()
                            ],
                          ),
                        ),
                        listQuestionAnswer[index].expand!
                            ? Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  listQuestionAnswer[index].answer!,
                                  style: TextStyle(
                                      color: Utils.getColorFromHex(
                                          widget.faqData.textColor!),
                                      fontSize: DashboardFontSize.subHeadingFontSize),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
