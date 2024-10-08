import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import '/views/Address_list/address_list_bloc.dart';
import '/views/Address_list/address_list_event.dart';
import '/views/Address_list/address_list_state.dart';
import '/views/shimmer/address_list_shimmer_view.dart';
import '/views/widgets/common/gap_widget.dart';
import 'package:shopify_code/util/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import '/views/widgets/no_data_view.dart';
import '/views/widgets/no_data_view12.dart';
import 'package:shopify_code/firebase/firebase_event.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class AddressListScreen extends StatefulWidget {
  bool isReturn;

  AddressListScreen(this.isReturn);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  bool refresh = false;

  @override
  Widget build(BuildContext context) {
    // context.read<AddressListScreenBloc>().AddressListApi();
    // BlocProvider.of<AddressListScreenBloc>(context).AddressListApi();
    return BlocProvider(
      create: (context) => AddressListScreenBloc(),
      child: BlocListener<AddressListScreenBloc, AddressListScreenState>(
        listener: (context, state) {
          // refresh ? context.read<AddressListScreenBloc>().loadData() : "";
          if (state is AddressListSuccessState) {
            Dialogs.SuccessAlertInOut(context: context, message: state.message);
          }
          // else {
          //   LoadingDialog.hide(context);
          // }
        },
        child: BlocBuilder<AddressListScreenBloc, AddressListScreenState>(
          builder: (context, state) {
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
                    LanguageManager.translations()['AddressList']!,
                  ),
                  actions: [
                    IconButton(
                      icon: Container(
                        width: 25,
                        height: 25,
                        // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                        child: SvgPicture.asset(
                          "assets/images/add.svg",
                        ),
                      ),
                      onPressed: () async {
                        refresh = await (context.pushNamed(
                            "${Routes.addressScreen}",
                            pathParameters: {"type": "add"},
                            extra: null)) as bool;

                        if (refresh) {
                          context.read<AddressListScreenBloc>().loadData();
                        }

                        //// FIREBASE EVENT /////////
                        globals.analytics
                            .logEvent(name: FireBaseEvent.ADD_ADDRESS.name);
                        ////////////////////////////
                      },
                    ),
                  ],
                ),
                body: GetView(state, context));
          },
        ),
      ),
    );
  }

  Widget GetView(AddressListScreenState state, BuildContext context2) {
    // context.read<AddressListScreenBloc>().AddressListApi();
    if (state is AddressListScreenNoInternet) {
      return Text(
        LanguageManager.translations()['NoInternet']!,
        style: TextStyle(color: Colors.black),
      );
    } else if (state is AddressListScreenLoading) {
      return AddressListShimmerView();
    } else if (state is AddressListScreenLoaded) {
      return Container(
        // margin: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: ListView.builder(
          itemCount: state.addressList!.length,
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.addressList![index].firstName.toString(),
                                style: CustomTextTheme.getTextStyle(
                                        MyTextStyle.AddressListCardTitle,
                                        context)
                                    .copyWith(fontWeight: FontWeight.w400)
                                // style:
                                //     TextStyle(fontSize: 20),
                                ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Container(
                                      width: 25,
                                      height: 25,
                                      // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                      child: SvgPicture.asset(
                                        "assets/images/edit.svg",
                                      ),
                                    ),
                                    onPressed: () async {
                                      Address addressNode =
                                          state.addressList![index];
                                      refresh = await (context.pushNamed(
                                          "${Routes.addressScreen}",
                                          pathParameters: {"type": "edit"},
                                          extra: addressNode.toJson())) as bool;
                                      if (refresh) {
                                        context
                                            .read<AddressListScreenBloc>()
                                            .loadData();
                                      }
                                    }),
                                GapWidget(
                                  size: -12,
                                ),
                                IconButton(
                                    icon: Container(
                                        width: 25,
                                        height: 25,
                                        // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                        child: SvgPicture.asset(
                                          "assets/images/delete.svg",
                                        )),
                                    onPressed: () async {
                                      DialogAction da =
                                          await Dialogs.customAbortDialog(
                                              context,
                                              LanguageManager.translations()[
                                                  'DeleteAddress']!,
                                              LanguageManager.translations()[
                                                  'Doyouwanttodeleteaddress']!);

                                      if (da == DialogAction.YES) {
                                        context
                                            .read<AddressListScreenBloc>()
                                            .add(AddressDelete(
                                                state.addressList![index].id));
                                      }
                                    }),
                              ],
                            )
                          ],
                        ),
                        GapWidget(
                          size: -10,
                        ),
                        Text(
                            state.addressList![index].address1 == null
                                ? ""
                                : state.addressList![index].address1.toString(),
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.AddressListCardSubTitle, context)),
                        GapWidget(
                          size: -10,
                        ),
                        Text(
                            state.addressList![index].city == null
                                ? ""
                                : state.addressList![index].city.toString(),
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.AddressListCardSubTitle, context)),
                        GapWidget(
                          size: -10,
                        ),
                        Text(
                            state.addressList![index].zip == null
                                ? ""
                                : state.addressList![index].zip.toString(),
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.AddressListCardSubTitle, context)),
                        GapWidget(
                          size: -5,
                        ),
                        state.addressList![index].phone == null ||
                                state.addressList![index].phone == "null"
                            ? Container()
                            : Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    // padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                                    child: SvgPicture.asset(
                                      "assets/images/contact-us.svg",
                                    ),
                                  ),
                                  GapWidget(
                                    size: -5,
                                  ),
                                  Text(
                                      state.addressList![index].phone
                                          .toString(),
                                      style: CustomTextTheme.getTextStyle(
                                          MyTextStyle.AddressListCardSubTitle,
                                          context))
                                ],
                              ),
                        GapWidget(
                          size: -5,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: AppTheme.borderColor!.withAlpha(50),
                  ),
                ],
              ),
              onTap: () async {
                if (widget.isReturn) {
                  context
                      .pop(context.read<AddressListScreenBloc>().list[index]);
                }
              },
            );
          },
        ),
      );
    } else {
      return NoDataView(
        AppAssets.location,
        LanguageManager.translations()['noAddressFound'],
        buttonTitle: LanguageManager.translations()['addAddress'],
        onTap: () async {
          refresh = await (context2.pushNamed("${Routes.addressScreen}",
              pathParameters: {"type": "add"}, extra: null)) as bool;

          if (refresh) {
            context2.read<AddressListScreenBloc>().loadData();
          }

          //// FIREBASE EVENT /////////
          globals.analytics.logEvent(name: FireBaseEvent.ADD_ADDRESS.name);
          ////////////////////////////
        },
      );
    }
  }
}
