import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopifyappbuilder/preview_app/dashbaord/bloc/partner_dashboard_bloc.dart';
import 'package:shopifyappbuilder/preview_app/login/partner_login_screen.dart';
import 'package:shopifyappbuilder/preview_app/theme_preview/theme_preview_screen.dart';
import 'package:shopifyappbuilder/preview_app/user_list_preview_app/user_list_preview_app_screen.dart';

class PartnerDashboard extends StatelessWidget {
  const PartnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PartnerDashboardBloc(),
        child: BlocListener<PartnerDashboardBloc, PartnerDashboardState>(
          listener: (context, state) {},
          child: BlocBuilder<PartnerDashboardBloc, PartnerDashboardState>(
            builder: (context, state) {
              if (state is PartnerDashboardLoadingState) {
                return Text("Loading");
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //     // width: 200,
                        //     height: 200,
                        //     child:
                        //         Image.asset("assets/app_logo/ic_app_icon.png")
                        //     // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                        //     ),
                        SizedBox(
                          height: 10,
                        ),
                        context
                                .read<PartnerDashboardBloc>()
                                .partnerInfo!
                                .containsKey('appSettings')
                            ? Container(
                                // width: 200,
                                height: 150,
                                child: Image.network(context
                                        .read<PartnerDashboardBloc>()
                                        .partnerInfo!["appSettings"]
                                    ["App_Icon_Src"])
                                // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                                )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            context
                                    .read<PartnerDashboardBloc>()
                                    .partnerInfo!
                                    .containsKey('appSettings')
                                ? context
                                    .read<PartnerDashboardBloc>()
                                    .partnerInfo!["appSettings"]["App_Name"]
                                    .toString()
                                : context
                                            .read<PartnerDashboardBloc>()
                                            .partnerInfo!["name"] !=
                                        null
                                    ? context
                                        .read<PartnerDashboardBloc>()
                                        .partnerInfo!["name"]
                                        .toString()
                                    : "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkResponse(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ThemePreviewScreen();
                              },
                            ));
                          },
                          child: Container(
                              margin: EdgeInsets.all(10),
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  // Red border with the width is equal to 5
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Text("Your Design",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                              // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                              ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkResponse(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return UserListPreviewAppScreen();
                              },
                            ));
                          },
                          child: Container(
                              margin: EdgeInsets.all(10),
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  // Red border with the width is equal to 5
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Text("Chat",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                              // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                              ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // InkResponse(
                        //   onTap: () {},
                        //   child: Container(
                        //       margin: EdgeInsets.all(10),
                        //       height: 80,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //           color: Colors.transparent,
                        //           // Red border with the width is equal to 5
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(10)),
                        //           border: Border.all(
                        //               width: 1, color: Colors.black)),
                        //       child: Text("Notifications",
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontSize: 25,
                        //               fontWeight: FontWeight.bold))
                        //       // Text("Welcome to \nMobilify", style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                        //       ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        InkResponse(
                          onTap: () async {
                            await Session().setPartnerIsLogin(false);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return PartnerLoginScreen();
                              },
                            ));
                          },
                          child: Container(
                              margin: EdgeInsets.all(10),
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  // Red border with the width is equal to 5
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Text("Logout",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
