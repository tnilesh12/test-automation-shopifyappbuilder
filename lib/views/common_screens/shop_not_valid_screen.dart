import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/views/widgets/custom_button.dart';

class ShopNotValidScreen extends StatelessWidget {
  bool showappbar;
  ShopNotValidScreen({this.showappbar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showappbar) {
      return Scaffold(
          body: ShopNotValidScreenBody(context));
    } else {
      return SafeArea(child: ShopNotValidScreenBody(context));
    }
  }

  Widget ShopNotValidScreenBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 100,
            child: SvgPicture.asset(
              "assets/images/store.svg",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              "Shop Not Valid!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              text: "Exit App",
              backgroundColor: Colors.black,
              textColor: Colors.white,
              // onPressed: widget.onExitApp,
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
