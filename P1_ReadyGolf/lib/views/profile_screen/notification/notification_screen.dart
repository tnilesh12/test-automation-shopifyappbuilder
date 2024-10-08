import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/utils/theme_size.dart';
import '/views/profile_screen/notification/bloc/notification_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/views/profile_screen/notification/bloc/notification_event.dart';
import '/views/profile_screen/notification/bloc/notification_state.dart';
import '/views/shimmer/notification_shimmer_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Container(
                width: 35, //MediaQuery.of(context).size.width * 0.09,
                height: 35, //MediaQuery.of(context).size.height * 0.09,
                padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                child: SvgPicture.asset("assets/images/arrow-back.svg",
                    colorFilter: ColorFilter.mode(
                        AppTheme.appBarTextColor!, BlendMode.srcIn)),
              ),
              onPressed: () {
                context.pop();
              }),
          title: Text(LanguageManager.translations()['Notification']!),
        ),
        body: NotificationScreenBody());
  }
}

getColor(Color svgColor) {
  if (svgColor.toString().length > 0) {
    try {
      // Color c = Color.fromARGB(
      //   svgColor.alpha,
      //   svgColor.red,
      //   svgColor.green,
      //   svgColor.blue,
      // );
      return svgColor.toString().substring(10, svgColor.toString().length - 1);
    } catch (e) {
      print("color code issue " + e.toString());

      return "";
    }
  } else {
    return "";
  }
}

class NotificationScreenBody extends StatelessWidget {
  bool IsLoading = false;
  int CurrentPage = 1;
  NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NotificationBloc(),
        child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
          if (state is NotificationLoadingState) {
            return NotificationShimmerView();
          } else if (state is NotificationLoadedState) {
            print("------------------${state.LoadMore}");
            // IsLoading = state.LoadMore;
            if (state.notificationdata.length == 0) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.string(
                        colorFilter: ColorFilter.mode(
                            AppTheme.appBarTextColor!.withAlpha(50),
                            BlendMode.srcIn),
                        AppAssets.bell,
                        height: 100,
                      ),
                      // ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            LanguageManager.translations()['noNotification'],
                            // LanguageManager.translations()[
                            //     title]!, // AppLocalizations.of(context)!.nodatafoundpleasetryagain,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .fontSize,
                              // color: AppTheme.lightBorder
                            )),
                      ),

                      // getColor(AppTheme
                      //             .bottomNavigationSelectedBackgroundColor!) ==
                      //         ""
                      //     ? SvgPicture.string(AppAssets.notificationSvg
                      //         .replaceAll("407BFF", "a5a795"))
                      //     : SvgPicture.string(AppAssets.notificationSvg.replaceAll(
                      //         "407BFF",
                      //         getColor(AppTheme
                      //             .bottomNavigationSelectedBackgroundColor!))),
                    ],
                  ));
            }
            IsLoading = false;
            return NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollEndNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    if (IsLoading == false) {
                      IsLoading = true;
                      CurrentPage++;
                      print("here............${CurrentPage}");
                      context
                          .read<NotificationBloc>()
                          .add(NotificationEventOnScrollEvent(
                            CurrentPage,
                            0,
                          ));
                    }
                    return true;
                  }
                  return false;
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      itemCount: state.notificationdata.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == state.notificationdata.length - 1 &&
                            state.LoadMore) {
                          return Center(
                              child: Container(
                            width: 200,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              AppAssets.loadingImg,
                            ),
                          ));
                        } else {
                          return Container(
                            margin: EdgeInsets.only(top: 0, bottom: 5),
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(
                            //         ThemeSize.themeBorderRadius),
                            //     border:
                            //         Border.all(color: AppTheme.borderColor!)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                state.notificationdata[index].image != null &&
                                        state.notificationdata[index].image !=
                                            ""
                                    ? Container(
                                        margin: EdgeInsets.only(
                                          bottom: 5,
                                          left: ThemeSize.marginLeft,
                                          right: ThemeSize.marginRight,
                                        ),
                                        child: WidgetImage(state
                                            .notificationdata[index].image
                                            .toString()),
                                      )
                                    : Container(),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: ThemeSize.marginLeft,
                                    right: ThemeSize.marginRight,
                                  ),
                                  child: Text(
                                    state.notificationdata[index].title
                                        .toString(),
                                    style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.NotificationCardTitle,
                                            context)
                                        .copyWith(color: AppTheme.black),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: ThemeSize.marginLeft,
                                    right: ThemeSize.marginRight,
                                  ),
                                  child: Text(
                                    state.notificationdata[index].message
                                        .toString(),
                                    overflow: TextOverflow.clip,
                                    style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.NotificationCardMessage,
                                            context)
                                        .copyWith(
                                            color:
                                                AppTheme.black.withAlpha(150)),
                                    softWrap: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: ThemeSize.marginLeft,
                                    right: ThemeSize.marginRight,
                                  ),
                                  child: Text(
                                    DateTimeUtils.getDateAndTime(state
                                            .notificationdata[index].createdAt
                                            .toString())
                                        .toString(),
                                    style: CustomTextTheme.getTextStyle(
                                            MyTextStyle.NotificationCardMessage,
                                            context)
                                        .copyWith(
                                            color:
                                                AppTheme.black.withAlpha(150)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: ThemeSize.marginLeft,
                                    bottom: ThemeSize.marginRight,
                                  ),
                                  height: 2,
                                  color: AppTheme.borderColor!.withAlpha(50),
                                )
                              ],
                            ),
                          );

                          // return Container(
                          //   child: ListView.builder(
                          //       itemCount: state.notificationdata.length,
                          //       itemBuilder: (context, index) {
                          //         return Column(
                          //           children: [
                          //             Container(
                          //               padding: EdgeInsets.all(8),
                          //               margin: EdgeInsets.only(
                          //                   left: 10, right: 10, top: 10, bottom: 10),
                          //               decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color:
                          //                           AppTheme.borderColor!.withAlpha(120))),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   WidgetImage(state.notificationdata[index].image
                          //                       .toString()),
                          //                   Text(
                          //                     state.notificationdata[index].title
                          //                         .toString(),
                          //                     style: CustomTextTheme.getTextStyle(
                          //                             MyTextStyle.NotificationCardTitle,
                          //                             context)
                          //                         .copyWith(color: AppTheme.black),
                          //                   ),
                          //                   Text(
                          //                     state.notificationdata[index].message
                          //                         .toString(),
                          //                     overflow: TextOverflow.clip,
                          //                     style: CustomTextTheme.getTextStyle(
                          //                             MyTextStyle.NotificationCardMessage,
                          //                             context)
                          //                         .copyWith(
                          //                             color: AppTheme.black.withAlpha(150)),
                          //                     softWrap: true,
                          //                   ),
                          //                   Text(
                          //                     DateFormate.getDateTime(state.notificationdata[index].createdAt.toString())
                          //                         .toString(),
                          //                     style:
                          //                          CustomTextTheme.getTextStyle(
                          //                             MyTextStyle.NotificationCardMessage,
                          //                             context)
                          //                         .copyWith(
                          //                             color: AppTheme.black.withAlpha(150)),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 10,
                          //             )
                          //           ],
                          //         );
                          //       }),
                          // );
                        }
                      }),
                ));
          } else {
            return Center(
              child: Text(LanguageManager.translations()["Nodata"]),
            );
          }
        }));
  }
}
