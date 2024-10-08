import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

enum DialogAction { YES, ABORT }

class Dialogs {
  static Future<DialogAction> customAbortDialog(
      BuildContext context, String title, String body,
      {String primarybuttonText = "No",
      String secondarybuttonText = "Yes"}) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          buttonPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          actionsPadding: EdgeInsets.fromLTRB(5, 0, 5, 10),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(DashboardFontSize.customBorderRadius),
          ),
          // title: Text(
          //   title,
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyLarge!,
          // ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                title != ""
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: title != "" ? 8 : 1,
                ),
                body != ""
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          body,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontSize: 14,
                              ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => 
              // context.pop(DialogAction.YES), 
              Navigator.of(context).pop(DialogAction.YES),
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                padding: EdgeInsets.fromLTRB(22, 5, 22, 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.secondaryButtonBackground!,
                        AppTheme.secondaryButtonBackground!,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius)),
                child: Text(secondarybuttonText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppTheme.secondaryButtonText!)),
              ),
            ),
            TextButton(
              onPressed: () => 
              // context.pop(DialogAction.ABORT),
               Navigator.of(context).pop(DialogAction.ABORT),
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                padding: EdgeInsets.fromLTRB(22, 5, 22, 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryButtonBackground!,
                        AppTheme.primaryButtonBackground!,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        DashboardFontSize.customBorderRadius)),
                child: Text(primarybuttonText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppTheme.primaryButtonText!)),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.ABORT;
  }

  // static fullScreenDialog(
  //     BuildContext context, String title, Function() onPressed) async {
  //   await showGeneralDialog(
  //     context: context,
  //     barrierColor: Colors.cyan,
  //     // Background color
  //     barrierDismissible: false,
  //     barrierLabel: ' Full Screen Dialog',
  //     transitionDuration: const Duration(milliseconds: 400),
  //     pageBuilder: (_, __, ___) {
  //       return Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const FlutterLogo(
  //             size: 100,
  //           ),
  //           Text(
  //             title,
  //             style: TextStyle(fontSize: 18, color: Colors.white),
  //           ),
  //           ElevatedButton(onPressed: onPressed, child: const Text("Okay"))
  //         ],
  //       );
  //     },
  //   );
  // }

  static bool showing = false;

  static ErrorAlertInOut({
    required BuildContext context,
    String? message,
  }) {
    showing = true;
    Fluttertoast.showToast(
        msg: message!.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    // showGeneralDialog(
    //     barrierColor: Colors.black.withOpacity(0.2),
    //     transitionBuilder: (context, a1, a2, widget) {
    //       final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
    //       return Transform(
    //         transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
    //         child: Opacity(opacity: a1.value, child: widget),
    //       );
    //     },
    //     transitionDuration: const Duration(milliseconds: 200),
    //     barrierDismissible: false,
    //     barrierLabel: '',
    //     context: context,
    //     pageBuilder: (c, animation1, animation2) {
    //       Timer timer = Timer(const Duration(milliseconds: 3000), () {
    //         if (showing) {
    //           context.pop(); // Navigator.pop(context);
    //         }
    //       });
    //
    //       return Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             const SizedBox(
    //               height: 40,
    //             ),
    //             AlertDialog(
    //               backgroundColor: Colors.red, //ErrorColor,
    //               elevation: 0,
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(
    //                       DashboardFontSize.customBorderRadius))),
    //               contentPadding: EdgeInsets.all(20),
    //               content: SizedBox(
    //                 // height: MediaQuery.of(context).size.height * 0.03,
    //                 width: MediaQuery.of(context).size.width - 10,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     const Icon(
    //                       Icons.error,
    //                       color: Colors.white,
    //                     ),
    //                     // Container(
    //                     //   decoration: BoxDecoration(
    //                     //     borderRadius: BorderRadius.circular(100),
    //                     //     // color: Colors.white,
    //                     //   ),
    //                     //   width: MediaQuery.of(context).size.width * 0.07,
    //                     //   height: MediaQuery.of(context).size.height * 0.03,
    //                     //   // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
    //                     //   child: SvgPicture.asset(
    //                     //       // height: 25,
    //                     //       "assets/images/alertDialogicon.svg",
    //                     //       colorFilter: ColorFilter.mode(
    //                     //           Colors.white!, BlendMode.srcIn)),
    //                     // ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     Flexible(
    //                         child: Text(message ?? "Error!",
    //                             maxLines: 4, //2,
    //                             overflow: TextOverflow.ellipsis,
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .bodyMedium
    //                                 ?.copyWith(color: Colors.white))),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ]);
    //     });
  }

  static SuccessAlertInOut({
    required BuildContext context,
    String? message,
  }) {
    Fluttertoast.showToast(
        msg: message!.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);

    // showGeneralDialog(
    //     barrierColor: Colors.black.withOpacity(0.2),
    //     transitionBuilder: (context, a1, a2, widget) {
    //       final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
    //       return Transform(
    //         transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
    //         child: Opacity(opacity: a1.value, child: widget),
    //       );
    //     },
    //     transitionDuration: const Duration(milliseconds: 200),
    //     barrierDismissible: true,
    //     barrierLabel: '',
    //     context: context,
    //     pageBuilder: (context, animation1, animation2) {
    //       Timer timer = Timer(const Duration(milliseconds: 3000), () {
    //         try {
    //           context.pop();
    //         } catch (e) {
    //           print(e);
    //         }
    //       });
    //       return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    //         const SizedBox(
    //           height: 40,
    //         ),
    //         AlertDialog(
    //           backgroundColor: Colors.green, //SuccessColor,
    //           elevation: 0,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.all(
    //                   Radius.circular(DashboardFontSize.customBorderRadius))),
    //           contentPadding: EdgeInsets.all(20),
    //           content: SizedBox(
    //             width: MediaQuery.of(context).size.width - 10,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 const Icon(
    //                   Icons.error,
    //                   color: Colors.white,
    //                 ),
    //                 const SizedBox(
    //                   width: 10,
    //                 ),
    //                 Flexible(
    //                     child: Text(message ?? "Error!",
    //                         maxLines: 4,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .bodyMedium
    //                             ?.copyWith(color: Colors.white))),
    //               ],
    //             ),
    //           ),
    //         )
    //       ]);
    //     });
  }

  // static SuccessAlertInOutWithCallBack({
  //   required BuildContext context,
  //   String? message,
  //   required Function() onFinish,
  // }) {
  //
  //
  //   showGeneralDialog(
  //       barrierColor: Colors.black.withOpacity(0.2),
  //       transitionBuilder: (context, a1, a2, widget) {
  //         final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
  //         return Transform(
  //           transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
  //           child: Opacity(opacity: a1.value, child: widget),
  //         );
  //       },
  //       transitionDuration: const Duration(milliseconds: 200),
  //       barrierDismissible: true,
  //       barrierLabel: '',
  //       context: context,
  //       pageBuilder: (context, animation1, animation2) {
  //         Timer timer = Timer(const Duration(milliseconds: 3000), () {
  //           try {
  //             context.pop(); //Navigator.pop(context);
  //             onFinish.call();
  //           } catch (e) {
  //             print(e);
  //           }
  //         });
  //         return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
  //           const SizedBox(
  //             height: 40,
  //           ),
  //           AlertDialog(
  //             backgroundColor: Colors.green, //SuccessColor,
  //             elevation: 0,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(
  //                     Radius.circular(DashboardFontSize.customBorderRadius))),
  //             contentPadding: EdgeInsets.all(20),
  //             content: SizedBox(
  //               width: MediaQuery.of(context).size.width - 10,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   const Icon(
  //                     Icons.error,
  //                     color: Colors.white,
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Flexible(
  //                       child: Text(message ?? "Error!",
  //                           maxLines: 4,
  //                           overflow: TextOverflow.ellipsis,
  //                           style: Theme.of(context)
  //                               .textTheme
  //                               .bodyMedium
  //                               ?.copyWith(color: Colors.white))),
  //                 ],
  //               ),
  //             ),
  //           )
  //         ]);
  //       });
  // }

  static Future<String> showPartnerShopListDialog(
    BuildContext context,
    List<dynamic> list,
    String title,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          buttonPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          actionsPadding: EdgeInsets.fromLTRB(5, 0, 5, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DashboardFontSize
                .customBorderRadius), // Adjust border radius as needed
          ),
          content: Container(
            // height: 250,
            width: MediaQuery.of(context).size.width * .7,
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensure the Column only takes the minimum required space
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                if (list.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          list[index]["shop"],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 16.0, // Adjust font size as needed
                              ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(
                            list[index]["shop"],
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
    return action ?? DialogAction.ABORT; // Ensure a default action is returned
  }
}
