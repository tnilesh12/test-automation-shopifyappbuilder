import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_bloc.dart';
import 'package:publicapp/common/bloc/boost_ai_search_screen_bloc/boost_ai_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme1/views/search/boost_ai_search/boost_ai_search_main_view.dart';
import '../../../views/widgets/search_view.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:shopify_code/util/setting_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BoostAISearchScreenFull extends StatefulWidget {
  @override
  State<BoostAISearchScreenFull> createState() =>
      _BoostAISearchScreenFullState();
}

class _BoostAISearchScreenFullState extends State<BoostAISearchScreenFull> {
// List<int> a=[];
  String searchTxt = "";
  FocusNode focusNode = FocusNode();

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
          title: Text(LanguageManager.translations()["Search"]
              // AppLocalizations.of(context)!.search,
              ),
        ),
        body: SafeArea(
          child: Container(
              child: globals.Settings.containsKey(
                      SettingsEnum.Product_Search_And_Sort.name)
                  ? BlocProvider(
                      create: (context) => BoostAISearchScreenBloc(),
                      child: BlocListener<BoostAISearchScreenBloc,
                              BoostAISearchScreenState>(
                          listener: (context, state) {},
                          child: BlocBuilder<BoostAISearchScreenBloc,
                                  BoostAISearchScreenState>(
                              builder: (context, state) {
                            return Column(children: [
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              SearchViewWidget(
                                  context,
                                  searchTxt,
                                  // context.read<BaseBloc>().SearchValue,
                                  (value) => {
                                        searchTxt = value,
                                        context
                                            .read<BoostAISearchScreenBloc>()
                                            .boostAISearchAPI(value.trim())
                                      },
                                  () {},
                                  focusNode,
                                  onTextChange: (_) {}),
                              Expanded(
                                  child:
                                      BoostAISearchMainView((searchedHistory) {
                                context
                                    .read<BoostAISearchScreenBloc>()
                                    .boostAISearchAPI(searchedHistory);
                              }, (suggestedSrch) {
                                searchTxt = suggestedSrch;
                                context
                                    .read<BoostAISearchScreenBloc>()
                                    .boostAISearchAPI(searchTxt);
                                print("call back $searchTxt");
                              }, () {
                                focusNode.requestFocus();
                              }))
                            ]);
                          })),
                    )
                  : Center(
                      child: Text("This Feature is Disabled from Admin Side"))),
        ));
  }
}
