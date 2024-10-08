import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/cart_count_bloc/cart_bloc.dart';
import 'package:publicapp/common/bloc/favorite_bloc/favorite_list_screen_bloc.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteView extends StatefulWidget {
  Function(String) OnClick;
  Function(String)? OnRemove;
  String productId;
  double iconSize;

  FavoriteView(this.productId, this.iconSize, this.OnClick,
      {this.OnRemove, super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  bool isFav = false;
  String logo =
      "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-heart\"><path d=\"M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z\"></path></svg>";
  String logo2 =
      "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"black\" stroke=\"currentColor\" stroke-width=\"1.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"feather feather-heart\"><path d=\"M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z\"></path></svg>";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(70),
          borderRadius: BorderRadius.circular(10)),
      // padding: EdgeInsets.all(2),
      child: BlocProvider(
          create: (context) => FavoriteListScreenBloc(),
          child: BlocListener<FavoriteListScreenBloc, FavoriteListScreenState>(
            listener: (context, state) async {
              // TODO: implement listener}
              if (state is FavoriteListScreenAPIFailureState) {
                Dialogs.ErrorAlertInOut(
                    context: context, message: state.message);
              }
              if (state is ItemAddedRemoveUpdate) {
                widget.OnRemove!.call("");
              }
              // if (state is ItemAddedRemoveUpdate) {
              //  await  context.read<CartBloc>().SetFavListUpdated(state.productListFav);
              // context.read<FavoriteListScreenBloc>().add(OnFavoriteRefresh(state.productListFav));
              // }
            },
            child: BlocBuilder<FavoriteListScreenBloc, FavoriteListScreenState>(
              builder: (context, state) {
                // print("favv state is ${state}");
                if (state is FavoriteListScreenLoading) {
                  return Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.heartImg,
                        color: Colors.red,
                      ));
                } else {
                  return InkWell(
                    child: FutureBuilder<bool>(
                      future: state is ItemAddedRemoveUpdate
                          ? context.read<CartBloc>().IsProductInFav(
                              widget.productId,
                              productListFav2: state.productListFav)
                          : context
                              .read<CartBloc>()
                              .IsProductInFav(widget.productId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                              padding: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              child: SvgPicture.string(logo,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn)));
                        } else if (snapshot.hasError) {
                          return Container(
                              padding: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              child: SvgPicture.string(logo,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn)));
                          // return Icon(
                          //   Icons.favorite_border,
                          //   color: Colors.black,
                          //   size: widget.iconSize,
                          // );
                        } else {
                          isFav = snapshot.data ?? false;
                          return isFav
                              ? Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.string(logo2,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.red, BlendMode.srcIn)))
                              : Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.string(logo,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.black, BlendMode.srcIn)));
                          // Icon(
                          //         Icons.favorite_border,
                          //         color: Colors.black,
                          //         size: widget.iconSize,
                          //       );
                        }
                      },
                    ),
                    onTap: () {
                      print("object");
                      if (isFav) {
                        print("object  remove ---- ${isFav}");
                        context
                            .read<FavoriteListScreenBloc>()
                            .add(OnFavoriteButtonRemoveClick(widget.productId));
                      } else {
                        print("object  Add ---- ${isFav}");
                        context
                            .read<FavoriteListScreenBloc>()
                            .add(OnFavoriteButtonAddClick(widget.productId));
                      }
                    },
                  );
                }
              },
            ),
          )),
    );
  }
}
