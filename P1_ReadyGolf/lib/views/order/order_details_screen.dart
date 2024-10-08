import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/order/order.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order order;
  OrderDetailsScreen(this.order, {super.key});
  // final Order order;
  //  Order order1 = Order(
  //   id: order.id,
  //   email: 'email',
  //   currencyCode: 'currencyCode',
  //   customerUrl: 'customerUrl',
  //   // lineItems:'lineItems',
  //   name: 'name',
  //   // orderNumber:'orderNumber',
  //   phone: 'phone',
  //   processedAt: 'processedAt',
  //   financialStatus: 'financialStatus',
  //   fulfillmentStatus: 'fulfillmentStatus',
  //   //  shippingAddress:'shippingAddress',
  //   // billingAddress:'billingAddress',
  //   statusUrl: 'statusUrl',
  //   // subtotalPriceV2:,
  //   //  totalPriceV2:'totalPriceV2',
  //   //   totalRefundedV2:'totalRefundedV2',
  //   //    totalShippingPriceV2:'totalShippingPriceV2',
  //   //      totalTaxV2:'totalTaxV2',
  //   cursor: 'cursor',
  //   //  successfulFulfillments:_getSuccessfulFulfilments("successfulFulfillments"]??[]);
  // );
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
          title: Text(LanguageManager.translations()["OrderDetails"]
              // AppLocalizations.of(context)!.orderdetails,
              ),
        ),
        body: Stack(children: [
          Container(
              color: Theme.of(context).colorScheme.background,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child:
                  // BlocBuilder<OderListScreenBloc, OderListScreenState>(
                  //     builder: (context, state) {
                  //   if (state is OderListScreenLoading) {
                  //     return Text(AppLocalizations.of(context)!.data);
                  //   } else if (state is OderListScreenLoaded) {
                  //     return
                  SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //     LanguageManager.translations()[
                                //         "OrderDetails"],
                                //     style: TextStyle(
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.blue,
                                //     )),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Text(
                                    LanguageManager.translations()[
                                            "TrackingId"] +
                                        "${order.name}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),

                                Text(
                                  LanguageManager.translations()["OrderDate"] +
                                      // AppLocalizations.of(context)!
                                      //         .orderdate +

                                      "${DateTimeUtils.getDateTime(order.processedAt.toString())}",
                                  // style: TextStyle(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w500,
                                  //   color: AppTheme.black.withAlpha(120),
                                  // )),
                                ),

                                Text(
                                    LanguageManager.translations()[
                                            "PaymentStatus"] +
                                        // AppLocalizations.of(context)!
                                        //         .paymentstatus +
                                        "${order.financialStatus}",
                                    style: TextStyle(
                                        // fontSize: 14,
                                        // fontWeight: FontWeight.w500,
                                        // color: AppTheme.primaryColor,
                                        )),

                                Text(
                                  LanguageManager.translations()["AmountPaid"]
                                      // AppLocalizations.of(context)!
                                      //         .amountpaid
                                      +
                                      "${order.subtotalPriceV2!.amount}",
                                  // style: TextStyle(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w500,
                                  //   color: AppTheme.primaryColor,
                                  // )
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 2,
                          color: AppTheme.borderColor!.withAlpha(50),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    LanguageManager.translations()[
                                        "CustomerInformation"],
                                    // AppLocalizations.of(context)!
                                    //     .customerinformation,
                                    // style: TextStyle(
                                    //     fontSize: 20,
                                    //     color: AppTheme.black,
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  LanguageManager.translations()["Name"] +
                                      // AppLocalizations.of(context)!.name +
                                      "${order.billingAddress!.firstName.toString() + order.billingAddress!.lastName.toString()}",
                                  // style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontWeight: FontWeight.w500,
                                  //     color:
                                  //         AppTheme.black.withAlpha(120))
                                ),
                                Text(order.email.toString(),
                                    style: TextStyle(fontSize: 15)),
                                Text(
                                  order.phone == null
                                      ? LanguageManager.translations()[
                                          "NoPhoneNumber"]
                                      // AppLocalizations.of(context)!
                                      //     .nophoneunmber
                                      : order.phone.toString(),
                                  // style: TextStyle(
                                  //     fontSize: 15,
                                  //     color: AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 2,
                          color: AppTheme.borderColor!.withAlpha(50),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageManager.translations()[
                                      "Shipping Address"],
                                  // AppLocalizations.of(context)!
                                  //     .shippingaddress,
                                  // style: TextStyle(
                                  //     fontSize: 20,
                                  //     color: AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${order.shippingAddress!.firstName.toString() + order.shippingAddress!.lastName.toString()}",
                                  // style: TextStyle(
                                  //     fontSize: 15,
                                  //     color:
                                  //         AppTheme.black.withAlpha(120),
                                  //     fontWeight: FontWeight.w700)
                                ),
                                Container(
                                  child: Container(
                                    child: Text(
                                      "${order.shippingAddress!.GetFormattedAddress()}",
                                      // style: TextStyle(
                                      //     fontSize: Theme.of(context)
                                      //         .textTheme
                                      //         .bodyMedium!
                                      //         .fontSize,
                                      //     color: AppTheme.black
                                      //         .withAlpha(120)),
                                    ),
                                  ),
                                ),
                                Text(
                                  LanguageManager.translations()["Contact"]
                                      // AppLocalizations.of(context)!
                                      //         .contact
                                      +
                                      "${order.shippingAddress!.phone}",
                                  // style: TextStyle(
                                  //     fontSize: 15,
                                  //     color:
                                  //         AppTheme.black.withAlpha(120),
                                  //     fontWeight: FontWeight.w700)
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 2,
                          color: AppTheme.borderColor!.withAlpha(50),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageManager.translations()[
                                      "BillingAddress"],
                                  // style: TextStyle(
                                  //     fontSize: 20,
                                  //     color: AppTheme.black,
                                  //     fontWeight: FontWeight.bold)
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${order.billingAddress!.firstName.toString() + order.billingAddress!.lastName.toString()}",
                                  // style: TextStyle(
                                  //     fontSize: 15,
                                  //     color:
                                  //         AppTheme.black.withAlpha(120),
                                  //     fontWeight: FontWeight.w700)
                                ),
                                Container(
                                  child: Text(
                                    "${order.billingAddress!.GetFormattedAddress()}",
                                    // style: TextStyle(
                                    //     fontSize: Theme.of(context)
                                    //         .textTheme
                                    //         .bodyMedium!
                                    //         .fontSize,
                                    //     color:
                                    //         AppTheme.black.withAlpha(120)),
                                  ),
                                ),
                                Text(
                                  LanguageManager.translations()["Contact"]
                                      // AppLocalizations.of(context)!
                                      //         .contact
                                      +
                                      "${order.billingAddress!.phone}",
                                  // style: TextStyle(
                                  //     fontSize: 15,
                                  //     color:
                                  //         AppTheme.black.withAlpha(120),
                                  //     fontWeight: FontWeight.w700)
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 2,
                          color: AppTheme.borderColor!.withAlpha(50),
                        ),
                        Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    order.lineItems!.lineItemOrderList!.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 3,
                                                color: AppTheme.lightBorder))),
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 100,
                                          child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  AppAssets.placeholder,
                                              image: order
                                                  .lineItems!
                                                  .lineItemOrderList![index]
                                                  .variant!
                                                  .image!
                                                  .originalSrc
                                                  .toString()),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                order
                                                    .lineItems!
                                                    .lineItemOrderList![index]
                                                    .title
                                                    .toString(),
                                                // style: TextStyle(
                                                //     color: AppTheme.black,
                                                //     fontSize: 14),
                                                maxLines: 2,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                order
                                                    .lineItems!
                                                    .lineItemOrderList![index]
                                                    .variant!
                                                    .title
                                                    .toString(),
                                                // style: TextStyle(
                                                //     color: AppTheme.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                LanguageManager.translations()[
                                                    "X"],
                                                // style: TextStyle(
                                                //     color: AppTheme.black),
                                              ),
                                              Text(
                                                order
                                                    .lineItems!
                                                    .lineItemOrderList![index]
                                                    .quantity
                                                    .toString(),
                                                // style: TextStyle(
                                                //     color: AppTheme.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Container(
                                          child: Text(
                                            order
                                                .lineItems!
                                                .lineItemOrderList![index]
                                                .originalTotalPrice!
                                                .formattedPrice,
                                            style: TextStyle(
                                              color: AppTheme.priceTagColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    order.financialStatus.toString(),
                                    // style: TextStyle(
                                    //     color:
                                    //         AppTheme.black.withAlpha(120),
                                    //     fontSize: 20.0),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: AppTheme.borderColor!.withAlpha(50),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              LanguageManager.translations()[
                                                  "SubTotal"],
                                              // AppLocalizations.of(
                                              //         context)!
                                              //     .subTotal,
                                              // style: TextStyle(
                                              //     color: AppTheme.black
                                              //         .withAlpha(120)),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              order.subtotalPriceV2!
                                                  .formattedPrice,
                                              // style: TextStyle(
                                              //     color: AppTheme.black
                                              //         .withAlpha(120)),
                                            ),
                                          ),
                                        ],
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                LanguageManager.translations()[
                                                    "tax"],
                                                // AppLocalizations.of(
                                                //         context)!
                                                //     .tax,
                                                // style: TextStyle(
                                                //     color: AppTheme.black
                                                //         .withAlpha(120)),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                order
                                                    .totalTaxV2!.formattedPrice,
                                                // style: TextStyle(
                                                //     color: AppTheme.black
                                                //         .withAlpha(120)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                // AppLocalizations.of(
                                                //         context)!.total
                                                LanguageManager.translations()[
                                                    "total"],
                                                // style: TextStyle(
                                                //     color: AppTheme.black
                                                //         .withAlpha(120)),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                order.totalPriceV2!
                                                    .formattedPrice,
                                                // style: TextStyle(
                                                //     color: AppTheme.black
                                                //         .withAlpha(120)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Divider(
                                        thickness: 3,
                                        color:
                                            AppTheme.borderColor!.withAlpha(50),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                order.financialStatus
                                                        .toString() +
                                                    LanguageManager
                                                            .translations()[
                                                        "bycustomer"],
                                                // AppLocalizations.of(
                                                //         context)!
                                                //     .bycustomer,
                                                // style: TextStyle(
                                                //     color: AppTheme.black),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                order.totalPriceV2!
                                                    .formattedPrice,
                                                // style: TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              )
              // } else {
              //   return NoDataView();
              // }
              // })
              ),
        ]));
  }
}
