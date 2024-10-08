import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '/theme2/views/widgets/common/custom_button.dart';

class ShopNotValidScreen extends StatelessWidget {
  // final VoidCallback onExitApp;
  bool showappbar;
  // ShopNotValidScreen({required this.onExitApp, this.showappbar = false, super.key});
  ShopNotValidScreen({this.showappbar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showappbar) {
      return Scaffold(
          // appBar: AppBar(
          //   leading: IconButton(
          //       icon: Container(
          //         width: MediaQuery.of(context).size.width * 0.09,
          //         // height: MediaQuery.of(context).size.height * 0.09,
          //         padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
          //         child: SvgPicture.asset("assets/images/arrow-back.svg",
          //             colorFilter:
          //                 ColorFilter.mode(Colors.black!, BlendMode.srcIn)),
          //       ),
          //       onPressed: () {
          //         context.pop();
          //       }),
          //   title: Text(""),
          // ),
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
            // width: MediaQuery.of(context).size.width * 0.55,
            // height: MediaQuery.of(context).size.width * 0.55,
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
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.1,
          //   child: Text(
          //     "Please check your internet connection and try again. ",
          //     overflow: TextOverflow.ellipsis,
          //     maxLines: 2,
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: 15,
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              text: "Exit App",
              backgroundColor: Colors.black,
              textColor: Colors.white,
              // onPressed: widget.onExitApp,
              onPressed: () {
                if (Platform.isAndroid) {
                  print("exit1");
                  SystemNavigator.pop();
                } else {
                  print("exit");
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
