import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/zipcode/country_code_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import '../../../common/bloc/country_code_bloc/country_code_event.dart';
import '../../../common/bloc/country_code_bloc/country_code_state.dart';
import '/theme4/views/shimmer/country_code_shimmer_view.dart';
import '../widgets/search_view.dart';
import '../../../common/bloc/country_code_bloc/country_code_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StateCodeScreen extends StatelessWidget {
  Countries cCode;
  List<Provinces> provinces = [];

  StateCodeScreen(this.cCode, {super.key}) {
    provinces = this.cCode.provinces!;
  }

  TextEditingController searchController = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    print("-----State no----${provinces.length}");
    print("-----Name of country----${cCode.name}");
    print("-----State name----${provinces.first.name}");

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
          title: Text(LanguageManager.translations()["SelectProvinces"]
              // AppLocalizations.of(context)!.select_contry,
              ),
        ),
        body: BlocProvider(
          create: ((context) => CountryCodeBloc()),
          child: BlocListener<CountryCodeBloc, CountryCodeState>(
            listener: (context, state) {},
            child: BlocBuilder<CountryCodeBloc, CountryCodeState>(
                builder: (context, state) {
              if (state is CountryCodeLoading) {
                return CountryCodeShimmerEffect()
                    .statecodeshimmereffect(context);
              } else if (state is StateLoaded) {
                return Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      SearchViewWidget(
                          context,
                          "",
                          (p0) {
                            context
                                .read<CountryCodeBloc>()
                                .add(OnStateSelectEvent(p0, cCode.provinces!));

                            // String filteredState= filtersearchState(p0);
                            //             if(!filteredState.isEmpty)
                            //             {
                            //               searchController.text=filteredState;

                            //             setState(){}
                            //             }
                          },
                          () {},
                          focusNode,
                          onTextChange: (text) {
                            print("event ");

                            context.read<CountryCodeBloc>().add(
                                OnStateSelectEvent(text, cCode.provinces!));
                            //  String filteredState= filtersearchState(text);
                            //                 if(!filteredState.isEmpty)
                            //                 {
                            //                   searchController.text=filteredState;
                            //                 }
                            //                 setState(){}
                          }),

                      // SearchViewWidget(
                      //     context,
                      //     searchController.text,
                      //     (p0) =>
                      //         {context.read<CountryCodeBloc>().add(OnFillterEvent(p0))},
                      //     () {

                      //     }),
                      Expanded(
                          child: ListView.builder(
                              itemCount: state.selectedProvinces.length == 0
                                  ? provinces.length
                                  : state.selectedProvinces.length,
                              itemBuilder: (BuildContext, index) {
                                return InkResponse(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  state.selectedProvinces
                                                              .length ==
                                                          0
                                                      ? provinces[index]
                                                          .name
                                                          .toString()
                                                      : state
                                                          .selectedProvinces[
                                                              index]
                                                          .name
                                                          .toString(),
                                                  // style: TextStyle(
                                                  //     // color: AppTheme.black,
                                                  //     fontSize: 18,   fontFamily: 'Cinzel',)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  onTap: () {
                                    //  searchCon,troller.text=provinces[index].name.toString();
                                    context.pop(

                                        // Navigator.of(context)
                                        //     .pop(

                                        state.selectedProvinces.length == 0
                                            ? provinces[index]
                                            : state.selectedProvinces[index]);
                                  },
                                );
                              }))
                    ],
                  ),
                );
              } else {
                return Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      SearchViewWidget(
                          context,
                          "",
                          (p0) {
                            context
                                .read<CountryCodeBloc>()
                                .add(OnStateSelectEvent(p0, cCode.provinces!));

                            // String filteredState= filtersearchState(p0);
                            //             if(!filteredState.isEmpty)
                            //             {
                            //               searchController.text=filteredState;

                            //             setState(){}
                            //             }
                          },
                          () {},
                          focusNode,
                          onTextChange: (text) {
                            context.read<CountryCodeBloc>().add(
                                OnStateSelectEvent(text, cCode.provinces!));
                            //  String filteredState= filtersearchState(text);
                            //                 if(!filteredState.isEmpty)
                            //                 {
                            //                   searchController.text=filteredState;
                            //                 }
                            //                 setState(){}
                          }),

                      // SearchViewWidget(
                      //     context,
                      //     searchController.text,
                      //     (p0) =>
                      //         {context.read<CountryCodeBloc>().add(OnFillterEvent(p0))},
                      //     () {

                      //     }),
                      Expanded(
                          child: ListView.builder(
                              itemCount: provinces.length,
                              itemBuilder: (BuildContext, index) {
                                return InkResponse(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  provinces[index]
                                                      .name
                                                      .toString(),
                                                  // style: TextStyle(
                                                  //     // color: AppTheme.black,
                                                  //     fontSize: 18,   fontFamily: 'Cinzel',)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  onTap: () {
                                    //  searchCon,troller.text=provinces[index].name.toString();
                                    Navigator.of(context)
                                        .pop(cCode.provinces![index]);
                                  },
                                );
                              }))
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }
}
