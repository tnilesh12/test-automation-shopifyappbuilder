import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/search_screen_bloc/search_screen_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import '/theme6/views/widgets/search_view.dart';
import 'search_main_view.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';

class SearchScreen extends StatelessWidget {
  String searchTxt = "";
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return globals.Settings.containsKey(
            SettingsEnum.Product_Search_And_Sort.name)
        ?
        // Scaffold(
        //   resizeToAvoidBottomInset: false,
        //     backgroundColor: Theme.of(context).colorScheme.primary,
        //     body: SafeArea(
        //       child:
        //   Container(
        // color: Theme.of(context).colorScheme.background,
        // child:
        BlocProvider(
            create: (context) => SearchScreenBloc(),
            child: BlocListener<SearchScreenBloc, SearchScreenState>(
                listener: (context, state) {},
                child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                    builder: (context, state) {
                  return Column(children: [
                    // HeaderWidget().header(context, false),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    SearchViewWidget(
                      context,
                      searchTxt, // context.read<BaseBloc>().SearchValue,
                      (value) => {
                        print(
                            "----------------------------------search screen searced value is $value "),
                        searchTxt = value,
                        context
                            .read<SearchScreenBloc>()
                            .predictiveSearchAPI(value.trim())
                      },
                      () {}, focusNode, onTextChange: (_) {},
                    ),
                    Expanded(
                        child: SearchMainView(showAppBar: false,
                            (searchedHistory) {
                      context
                          .read<SearchScreenBloc>()
                          .predictiveSearchAPI(searchedHistory);
                    }, () {
                      focusNode.requestFocus();
                    }))
                  ]);
                })),
          )
        // );
        // ));
        : Center(
            child: Text(LanguageManager.translations()[
                "thisPanelIsDisabledFromAdminSide"]));
  }
}
