import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:tag_view/tag_view.dart';
import '/utils/theme_size.dart';
import '/views/search/boost_ai_search/bloc/boost_ai_bloc.dart';
import '/views/search/boost_ai_search/bloc/boost_ai_state.dart';

class SuggestedSearchView extends StatefulWidget {
  SuggestedSearchView(this.suggestCallBack, {super.key});

  Function(String) suggestCallBack;

  @override
  State<SuggestedSearchView> createState() => _SuggestedSearchViewState();
}

class _SuggestedSearchViewState extends State<SuggestedSearchView> {
  @override
  void initState() {
    super.initState();
    // context.read<SearchScreenBloc>().LoadDataCollection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoostAISearchScreenBloc, BoostAISearchScreenState>(
      builder: (context, state) {
        if (state is BoostAISearchScreenLoading) {
          return Center(
            child: Text(LanguageManager.translations()["LoadingText"]),
          );
        } else if (state is BoostAISearchScreenSuccessState) {
          return SingleChildScrollView(
            child: Column(children: [
              // searchList.isNotEmpty ?
              state.boostAISearch.suggestions!.isNotEmpty
                  ? Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(
                          ThemeSize.paddingLeft, 10, ThemeSize.paddingRight, 2),
                      child: Text(
                        LanguageManager.translations()["suggestions"],
                        // LanguageManager.translations()["SuggestedSearch"],
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  : SizedBox(),
              // TagView(context.read<SearchScreenBloc>().collectionTitle,

              //     isEnableDelete: false,

              //     tagBackgroundColor: Colors.grey, onClick: (clickPos) {

              //   Navigator.pushNamed(context, RouteGenerate.productListScreen,
              //       arguments: {
              //         context.read<SearchScreenBloc>().COLLECTION[clickPos].id,
              //         context.read<SearchScreenBloc>().COLLECTION[clickPos].title
              //       });
              // })

              state.boostAISearch.suggestions!.isNotEmpty
                  ? Container(
                      padding: EdgeInsets.fromLTRB(
                          ThemeSize.paddingLeft, 1, ThemeSize.marginRight, 5),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TagView(
                            state.boostAISearch.suggestions!,
                            isEnableDelete: false,
                            tagBackgroundColor: Colors.grey.shade500,
                            onClick: (clickPos) {
                              widget.suggestCallBack.call(
                                  state.boostAISearch.suggestions![clickPos]);
                            },
                          ),
                        ],
                      ),
                    )
                  : SizedBox()
            ]),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
