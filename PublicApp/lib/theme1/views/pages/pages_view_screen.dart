import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:publicapp/common/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:publicapp/common/bloc/page_view_bloc/page_view_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import '/theme1/views/common_screens/api_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PageViewScreen extends StatelessWidget {
  bool showappbar;
  final String id;
  PageViewScreen(this.id, {this.showappbar = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (showappbar) {
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
          title: Text(
            LanguageManager.translations()["Pages"],
          ),
        ),
        body: PageViewScreenBody(id),
      );
    } else {
      return PageViewScreenBody(id);
    }
  }
}

class PageViewScreenBody extends StatelessWidget {
  String id = "";
  bool showAppBar;

  PageViewScreenBody(this.id, {this.showAppBar = true, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewScreenBloc(id),
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(children: [
            Expanded(
              child: BlocBuilder<PageViewScreenBloc, PageViewScreenState>(
                builder: (context, state) {
                  if (state is PageViewScreenAPIFailureState) {
                    return APIFailureScreens(
                        showButton: showAppBar, state.message);
                  } else if (state is PageViewScreenLoadedState) {
                    return SafeArea(
                      child: Container(
                          color: Theme.of(context).colorScheme.background,
                          //  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 20, bottom: 0),
                                child: Hero(
                                    tag: LanguageManager.translations()[
                                            "title"] +
                                        "${state.pagess.id}",
                                    child: Text(
                                      state.pagess.title.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Text(
                                  DateTimeUtils.getDateTime(
                                      state.pagess.createdAt.toString()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              state.pagess.body!.isNotEmpty
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 0),
                                      child: HtmlWidget('''
                                          <html>
                                          <head>
                                          <style>
                                          body{
                                          }
                                          </style>
                                          <script></script>
                                          </head>
                                          <body>
                                          ${state.pagess.body}
                                          </body>
                                          </html>
                                          '''
                                          // body{
                                          //   font-family: Cinzel;
                                          //   color:black ;
                                          // }
                                          // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
                                          ),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ))),
                    );
                  } else {
                    return Center(
                      child: Text("Loading..."),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
