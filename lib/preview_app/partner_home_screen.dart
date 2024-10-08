import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_code/app_config/app_config.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopifyappbuilder/preview_app/dashbaord/partner_dashboard.dart';
import 'package:shopifyappbuilder/preview_app/login/partner_login_screen.dart';
// import '/main.dart';
// import 'package:theme2/main.dart';
// import 'package:theme3/main.dart';
// import 'package:theme4/main.dart';

class PartnerHomeScreen extends StatefulWidget {
  // const PartnerHomeScreen({super.key});

  @override
  State<PartnerHomeScreen> createState() => _PartnerHomeScreenState();
}

class _PartnerHomeScreenState extends State<PartnerHomeScreen> {
  // String? scanResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: double.infinity,
        // color: Colors.grey.shade300,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 224, 246, 123),
            Color.fromARGB(255, 246, 247, 241),
          ],
          // end: const FractionalOffset(1.0, 1.0),
          // begin: const FractionalOffset(-1.0, -1.0),
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  // width: 200,
                  height: 200,
                  child: Image.asset("assets/app_logo/ic_app_icon.png")
                  // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                  ),
            ),
            Text(
              "Welcome To ItGeeks Mobilify Admin App",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40),

            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black),
                    child: Text(
                      "Continue",
                    ),
                    onPressed: () async {
                      bool isPartnerLogin = await Session().IsPartnerLogin();
                      if (isPartnerLogin) {
                        String str = await Session().getShopName();
                        if (str.isNotEmpty) {
                          AppConfig.APP_DOMAIN = str;
                        }
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return PartnerDashboard();
                          },
                        ));
                      } else {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return PartnerLoginScreen();
                          },
                        ));
                      }
                    })),
            SizedBox(height: 30),

            // Text(
            //   "For QR-Code Code open your mobilify app in shopify panel and at the top right you will see your store QR-Code for preview your app.",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 10),
            // ),
            // Text(
            //   scanResult == null
            //       ? "Scan a code!"
            //       : "Scan Result : $scanResult",
            //   style: TextStyle(fontSize: 15),
            // ),
          ],
        ),
      ),
    );
  }
}
