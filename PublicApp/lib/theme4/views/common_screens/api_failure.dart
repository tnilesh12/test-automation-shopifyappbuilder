import 'package:flutter/material.dart';
import '/theme4/views/common_screens/error_screen.dart';
import '/theme4/views/common_screens/network_error_screen.dart';
import '/theme4/views/common_screens/under_maintenance_screen.dart';

class APIFailureScreens extends StatelessWidget {
  String message;
  bool showButton;
  APIFailureScreens(this.message, {required this.showButton, super.key});

  @override
  Widget build(BuildContext context) {
    print("Error .........code ......." + message);
    // if (message == "503" || message == "Server Down") {
    //   return UnderMaintenanceScreen();
    // } else
    if (message == "144" || message == "No Internet Connection") {
      return NetworkErrorScreen(
          onRetry: () => debugPrint("----------------------------------retry"));
    } else {
      return ErrorScreen(
          showButton: showButton,
          onBack: () {
            debugPrint("----------------------------------onback pressed");
            //    Navigator.pop(context);
          });
    }
  }
}
