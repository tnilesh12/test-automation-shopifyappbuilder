import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import '/theme6/views/search/boost_ai_search/boost_ai_search_main_view.dart';
import '../../../views/widgets/search_view.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';

class BoostAISearchScreen extends StatelessWidget {
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
            create: (context) => BoostAISearchScreenBloc(),
            child:
                BlocListener<BoostAISearchScreenBloc, BoostAISearchScreenState>(
                    listener: (context, state) {},
                    child: BlocBuilder<BoostAISearchScreenBloc,
                        BoostAISearchScreenState>(builder: (context, state) {
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
                                .read<BoostAISearchScreenBloc>()
                                .boostAISearchAPI(value.trim())
                          },
                          () {}, focusNode, onTextChange: (_) {},
                        ),
                        Expanded(
                            child: BoostAISearchMainView(
                                //showAppBar: false,
                                (searchedHistory) {
                                  context
                                      .read<BoostAISearchScreenBloc>()
                                      .boostAISearchAPI(searchedHistory);
                                },
                                (p0) {},
                                () {
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
