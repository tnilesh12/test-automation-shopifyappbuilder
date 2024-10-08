import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publicapp/common/bloc/country_code_bloc/country_code_bloc.dart';
import 'package:publicapp/common/bloc/country_code_bloc/country_code_event.dart';
import 'package:publicapp/common/bloc/country_code_bloc/country_code_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '/theme2/views/shimmer/country_code_shimmer_view.dart';
import '/theme2/views/widgets/no_data_view.dart';
import '../widgets/no_data_view12.dart';
import '/theme2/views/widgets/search_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCodeScreen extends StatefulWidget {
  const CountryCodeScreen({super.key});

  @override
  State<CountryCodeScreen> createState() => _CountryCodeScreenState();
}

class _CountryCodeScreenState extends State<CountryCodeScreen> {
  TextEditingController searchController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CountryCodeBloc>().filtersearch("");
  }

  // static const countryPhoneCodes = {
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
        title: Text(
          LanguageManager.translations()["Selectcountry"],
        ),
      ),
      body: BlocBuilder<CountryCodeBloc, CountryCodeState>(
        builder: (context, state) {
          if (state is CountryCodeLoading) {
            return CountryCodeShimmerEffect().countrycodeshimmereffect(context);
          } else if (state is CountryCodeNoData) {
            return NoDataView(AppAssets.location,
                LanguageManager.translations()['countryCodeNotFound']);
          } else if (state is CountryCodeNoInternet) {
            return Text(
              LanguageManager.translations()["nointernet"],
              style: TextStyle(color: Colors.green),
            );
            //  NoInternetView();
          } else if (state is CountryCodeLoaded) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  SearchViewWidget(
                      context,
                      "",
                      (p0) {
                        context.read<CountryCodeBloc>().add(OnFillterEvent(p0));
                      },
                      () {},
                      focusNode,
                      onTextChange: (text) {
                        context
                            .read<CountryCodeBloc>()
                            .add(OnFillterEvent(text));
                      }),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.list!.length,
                        itemBuilder: (BuildContext, index) {
                          return InkResponse(
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          state.list![index].code
                                              .toString()
                                              .toUpperCase()
                                              .replaceAllMapped(
                                                  RegExp(r'[A-Z]'),
                                                  (match) =>
                                                      String.fromCharCode(match
                                                              .group(0)!
                                                              .codeUnitAt(0) +
                                                          127397)),
                                          style: TextStyle(
                                              // color: Colors.black,
                                              // fontFamily: 'Cinzel',
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Column(
                                      children: [
                                        Text(state.list![index].name.toString(),
                                            style: TextStyle(
                                              // color: Colors.black,
                                              fontSize: 18,
                                              // fontFamily: 'Cinzel',
                                            )),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                            [state.list![index].code.toString()]
                                                .toString(),
                                            style: TextStyle(
                                                // color:Colors.black.withAlpha(120),
                                                // fontFamily: 'Cinzel',
                                                ))
                                      ],
                                    ),
                                  ],
                                )),
                            onTap: () {
                              Navigator.of(context).pop(state.list![index]);
                              // setState(() {});
                            },
                          );
                        }),
                  ),
                ],
              ),
            );
            //  CountryCodeShimmerEffect()
            //     .countrycodeshimmereffect(context);
          } else {
            return NoDataView(AppAssets.location,
                LanguageManager.translations()['countryCodeNotFound']);
          }
        },
      ),
    );
  }
}
