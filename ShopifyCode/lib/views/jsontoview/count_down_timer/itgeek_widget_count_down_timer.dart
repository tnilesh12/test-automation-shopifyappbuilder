import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/views/jsontoview/count_down_timer/style_default_count_down_timer.dart';
import 'package:shopify_code/views/jsontoview/count_down_timer/style_one_count_down_timer.dart';

class ItgeekWidgetCountdownTimer extends StatelessWidget {
  CountDownDate countDownDate;
  ItgeekWidgetCountdownTimer(this.countDownDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return countDownDate.style == "Style_1"
        ? StyleOneCountDownTimer(countDownDate)
        : StyleDefaultCountDownTimer(countDownDate);
  }
}