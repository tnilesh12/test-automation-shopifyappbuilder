import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/product/selected_option/selected_option.dart';
import 'package:shopify_code/plugin/presidio_quiz/presidio_quiz_bloc/presidio_quiz_bloc.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

import '../../theme/custom_text_theme.dart';
import '../../theme/my_text_style.dart';
import '../../util/utils.dart';
import 'presidio_quiz_bloc/presidio1_quiz_event.dart';

class PresidioQuestionView extends StatefulWidget {
  dynamic data;
  Function(dynamic data) OnUpdateData;
  PresidioQuestionView(this.data, this.OnUpdateData);

  @override
  State<PresidioQuestionView> createState() => _PresidioQuestionViewState();
}

class _PresidioQuestionViewState extends State<PresidioQuestionView> {
  String selectedValue = " ";
  bool select = false, isActive = false;
  List<int> selectedValues = [];

  List<dynamic> selectedValuesAns = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            child: Text(
              widget.data['name'].toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          widget.data['description'] == ""
              ? Container()
              : SizedBox(
                  height: 10,
                ),
          widget.data['description'] == ""
              ? Container()
              : Padding(
                  padding: EdgeInsets.fromLTRB(
                    DashboardFontSize.paddingLeft,
                    DashboardFontSize.paddingTop,
                    DashboardFontSize.paddingRight,
                    DashboardFontSize.paddingBottom,
                  ),
                  child: Text(
                    widget.data['description'].toString(),
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
          widget.data['multiSelection'] ? SizedBox(height: 10) : Container(),
          widget.data['multiSelection']
              ? Column(
                  children: [
                    ...widget.data['answers'].map<Widget>((option) {
                      return getCheckBox(
                          title: option['name'],
                          isSelected: selectedValues.contains(option['id']),
                          onChanged: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                print(
                                    "selected options ----------->>>${selectedValues}");
                                selectedValues.add(option['id']);
                                selectedValuesAns.add(option);
                              } else {
                                selectedValues.remove(option['id']);
                                selectedValuesAns.remove(option);
                              }
                              print(
                                  "selected options ----------->>>${selectedValues}");
                              widget.OnUpdateData(option);
                            });
                          });
                      // Container(
                      //   padding: EdgeInsets.only(top: 5, bottom: 5),
                      //   height: 50,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           setState(() {
                      //             if (select) {
                      //               select = false;
                      //             } else {
                      //               select = true;
                      //             }
                      //             print("--------select $select--------");
                      //           });
                      //         },
                      //         child: select
                      //             ? Container(
                      //                 height: 20,
                      //                 width: 20,
                      //                 decoration: BoxDecoration(
                      //                     borderRadius:
                      //                         BorderRadius.circular(100),
                      //                     border: Border.all(
                      //                       width: 2,
                      //                       color: AppTheme
                      //                           .secondaryButtonBackground!,
                      //                     )),
                      //                 child: Container(
                      //                   height: 10,
                      //                   width: 10,
                      //                   margin: EdgeInsets.all(2),
                      //                   decoration: BoxDecoration(
                      //                     color: AppTheme
                      //                         .secondaryButtonBackground!,
                      //                     borderRadius:
                      //                         BorderRadius.circular(100),
                      //                   ),
                      //                 ),
                      //               )
                      //             : Container(
                      //                 padding: EdgeInsets.all(0),
                      //                 height: 20,
                      //                 width: 20,
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.transparent,
                      //                     borderRadius:
                      //                         BorderRadius.circular(100),
                      //                     border: Border.all(
                      //                       width: 2,
                      //                       color: Colors.black,
                      //                       //AppTheme.secondaryButtonBackground!,
                      //                     )),
                      //               ),
                      //       ),
                      //       SizedBox(
                      //         width: 18,
                      //       ),
                      //       Text(
                      //         option['name'],
                      //         maxLines: 3,
                      //         overflow: TextOverflow.ellipsis,
                      //         style: TextStyle(),
                      //       )
                      //     ],
                      //   ),
                      // );

                      // CheckboxListTile(
                      //   title: Text(option['name']),
                      //   value: selectedValues.contains(option['name']),
                      //   activeColor: AppTheme.secondaryButtonBackground,
                      //   // Replace with your AppTheme.secondaryButtonBackground
                      //   onChanged: (bool? value) {
                      //     setState(() {
                      //       if (value == true) {
                      //         selectedValues.add(option['name']);
                      //       } else {
                      //         selectedValues.remove(option['name']);
                      //       }
                      //     });
                      //   },
                      // );
                    }).toList(),
                  ],
                )
              : widget.data['type'] == 'select' ||
                      widget.data['type'] == 'radio-buttons'
                  ? Column(
                      children: [
                        ...widget.data['answers'].map((option) {
                          // isActive = false;
                          print(
                              "------isActive-${AppTheme.primaryButtonText.toString().substring(2, 9)}-----");
                          if (option['selected'] == null)
                            option['selected'] = false;
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.only(bottom: 8),
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: option['selected']
                                    ? Colors.white
                                    : AppTheme.primaryButtonBackground,
                                border: Border.all(
                                    width: 0.5, color: Colors.black)),
                            child: RadioListTile<dynamic>(
                              // contentPadding: EdgeInsets.symmetric(),
                              title: Text(
                                option['name'],
                                style: TextStyle(
                                    color: option['selected']
                                        ? Colors.black
                                        : AppTheme.primaryButtonText),
                              ),
                              value: true,
                              activeColor: AppTheme.primaryButtonBackground,
                              groupValue: option['selected'] ?? false,
                              onChanged: (value) {
                                // selectedValue = value!;
                                if (value!) {
                                  widget.OnUpdateData(option);
                                }
                              },
                            ),
                          );
                        }).toList()
                      ],
                    )
                  // : widget.data['type'] == 'text'
                  //     ? CustomTextFormField(hintText: "")
                  : Container()
        ],
      ),
    );
  }

  Widget getCheckBox(
      {required String title,
      required bool isSelected,
      required ValueChanged<bool> onChanged}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelected ? Colors.white : AppTheme.primaryButtonBackground,
          border: Border.all(width: 0.5, color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onChanged(!isSelected);
              // setState(() {

              // });
              // setState(() {
              //   if (isSelected) {
              //     isSelected = false;
              //   } else {
              //     isSelected = true;
              //   }
              //   print("--------isSelected $isSelected--------");
              // });
            },
            child: isSelected
                ? Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 2,
                          color: AppTheme.primaryButtonBackground!,
                        )),
                    child: Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryButtonBackground!,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(0),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                          //AppTheme.secondaryButtonBackground!,
                        )),
                  ),
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
//
  }
}
