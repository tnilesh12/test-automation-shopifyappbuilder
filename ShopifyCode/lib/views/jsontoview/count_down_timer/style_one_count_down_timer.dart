import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class StyleOneCountDownTimer extends StatefulWidget {
  CountDownDate countDownDate;
  StyleOneCountDownTimer(this.countDownDate, {super.key});

  @override
  State<StyleOneCountDownTimer> createState() => _StyleOneCountDownTimerState();
}

class _StyleOneCountDownTimerState extends State<StyleOneCountDownTimer> {
  late Timer timer;
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Duration difference =
      Duration(days: 00, hours: 00, minutes: 00, seconds: 00, milliseconds: 00);

  @override
  void initState() {
    super.initState();
    DateTime targetDate;
    // Set the target date and time
    if (widget.countDownDate.date == "" && widget.countDownDate.time == "") {
      targetDate = DateTime.parse("0000-00-00 00:00:00");
    } else if (widget.countDownDate.time == "") {
      targetDate = DateTime.parse("${widget.countDownDate.date!} 00:00:00");
    } else {
      print("Demo----------->>> ${widget.countDownDate.date} ");
      targetDate = DateTime.parse(
          "${widget.countDownDate.date == "" ? "0000-00-00" : widget.countDownDate.date} ${widget.countDownDate.time}:00");
    }
    // DateTime targetDate = DateTime.now().add(Duration(days: widget.countDownDate., hours: , minutes: )));

    // Calculate the initial difference
    difference = targetDate.difference(DateTime.now());

    print(
        "--$targetDate------${widget.countDownDate.date!} ${widget.countDownDate.time}-----------CountDown ${difference}");

    print(
        "---days${difference.inDays}, hours=${difference.inHours}, minute=${difference.inMinutes} seconds=${difference.inSeconds}");

    // Set initial values
    days = difference.inDays;
    hours = difference.inHours.remainder(24);
    minutes = difference.inMinutes.remainder(60);
    seconds = difference.inSeconds.remainder(60);

    // Start the timer to update the countdown
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (difference.inSeconds > 0) {
        setState(() {
          difference = targetDate.difference(DateTime.now());
          days = difference.inDays;
          hours = difference.inHours.remainder(24);
          minutes = difference.inMinutes.remainder(60);
          seconds = difference.inSeconds.remainder(60);
        });
      } else {
        // Timer reached zero, stop the timer
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius:
        //     BorderRadius.circular(DashboardFontSize.countDownBorderRadius),
        color: Utils.getColorFromHex(widget.countDownDate.backgroundColor!),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // margin: EdgeInsets.only(
      //     top: DashboardFontSize.marginTop,
      //     bottom: DashboardFontSize.marginBottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Expanded(
          //   flex: 2,
          //   child:
          Text(
            widget.countDownDate.heading!.toUpperCase(),
            textAlign: TextAlign.center,
            // "head",
            style: TextStyle(
              fontSize: 22,
              color: Utils.getColorFromHex(widget.countDownDate.textColor!),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          widget.countDownDate.bodyText != null
              ? Text(
                  widget.countDownDate.bodyText!,
                  textAlign: TextAlign.center,
                  // "head",
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        Utils.getColorFromHex(widget.countDownDate.textColor!),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          // ),
          // Expanded(
          //   flex: 3,
          //   child:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  difference.inDays.toString().contains("-")
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text("00",
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text(
                              days < 10
                                  ? "0" + days.toString()
                                  : days.toString(),
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        ),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      // color: Utils.getColorFromHex(
                      //     widget.countDownDate.cellColor.toString()),
                    ),
                    child: Text("Days",
                        style: TextStyle(
                            color: Utils.getColorFromHex(
                                widget.countDownDate.cellTextColor!),
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
                Container(
                  alignment: Alignment.center,
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    color: Utils.getColorFromHex(
                        widget.countDownDate.textColor.toString()),
                  ),
                ),
                Column(children: [
                  difference.inHours.toString().contains("-")
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text("00",
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text(
                              hours < 10
                                  ? "0" + hours.toString()
                                  : hours.toString(),
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        ),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      // color: Utils.getColorFromHex(
                      //     widget.countDownDate.cellColor.toString()),
                    ),
                    child: Text("Hours",
                        style: TextStyle(
                            color: Utils.getColorFromHex(
                                widget.countDownDate.cellTextColor!),
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
                Container(
                  alignment: Alignment.center,
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    color: Utils.getColorFromHex(
                        widget.countDownDate.textColor.toString()),
                  ),
                ),
                Column(children: [
                  difference.inMinutes.toString().contains("-")
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text("00",
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text(
                              minutes < 10
                                  ? "0" + minutes.toString()
                                  : minutes.toString(),
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        ),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      // color: Utils.getColorFromHex(
                      //     widget.countDownDate.cellColor.toString()),
                    ),
                    child: Text("Minutes",
                        style: TextStyle(
                            color: Utils.getColorFromHex(
                                widget.countDownDate.cellTextColor!),
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
                Container(
                  alignment: Alignment.center,
                  width: 1,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius),
                    color: Utils.getColorFromHex(
                        widget.countDownDate.textColor.toString()),
                  ),
                ),
                Column(children: [
                  difference.inDays.toString().contains("-")
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text("00",
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 29,
                                  fontWeight: FontWeight.normal)),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DashboardFontSize.customBorderRadius),
                            // color: Utils.getColorFromHex(
                            //     widget.countDownDate.cellColor.toString()),
                          ),
                          child: Text(
                              seconds < 10
                                  ? "0" + seconds.toString()
                                  : seconds.toString(),
                              style: TextStyle(
                                  color: Utils.getColorFromHex(
                                      widget.countDownDate.cellTextColor!),
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal)),
                        ),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                      // color: Utils.getColorFromHex(
                      //     widget.countDownDate.cellColor.toString()),
                    ),
                    child: Text("Seconds",
                        style: TextStyle(
                            color: Utils.getColorFromHex(
                                widget.countDownDate.cellTextColor!),
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
              ],
            ),
          ),
          //   ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    timer.cancel();
    super.dispose();
  }
}
