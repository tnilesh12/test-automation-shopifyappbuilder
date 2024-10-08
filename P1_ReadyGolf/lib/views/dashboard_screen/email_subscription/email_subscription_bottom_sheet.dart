import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_bloc.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_event.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailSubscriptionBottomSheet extends StatefulWidget {
  String pluginName;
  EmailSubscriptionBottomSheet(this.pluginName);
  @override
  State<EmailSubscriptionBottomSheet> createState() =>
      _EmailSubscriptionBottomSheetState();
}

class _EmailSubscriptionBottomSheetState
    extends State<EmailSubscriptionBottomSheet> {
  // int selectedOption = 1;
  // String? dropdownvalue;

  // SellingPlanListNodes? selectedValue;

  @override
  void initState() {
    super.initState();
    try {} catch (e) {}
  }

  TextEditingController customerEmailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailSubscriptionBloc(),
      child: BlocListener<EmailSubscriptionBloc, EmailSubscriptionState>(
        listener: (context, state) async {
          if (state is EmailEmptyState) {
            Dialogs.ErrorAlertInOut(
                context: context, message: "Email cannot be empty.");
          } else if (state is EmailInvalidState) {
            Dialogs.ErrorAlertInOut(
                context: context, message: "Invalid email format.");
          } else if (state is EmailSubscriptionSuccessState) {
            Dialogs.SuccessAlertInOut(
                context: context, message: state.successMessage);
            // Set the email submitted flag in session
            Session session = Session();
            await session.setEmailSubmitted(true);
            context.pop(true);
          }
        },
        child: BlocBuilder<EmailSubscriptionBloc, EmailSubscriptionState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    'Join Us For Email Only',
                    style: TextStyle(
                        fontSize: DashboardFontSize.headingFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.baseColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discounts!',
                    style: TextStyle(
                        fontSize: DashboardFontSize.headingFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.baseColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Join our mailing list to get exclusive discounts and promotions sent straight to your inbox.',
                    style: TextStyle(
                        fontSize: DashboardFontSize.descFontSize,
                        color: AppTheme.baseColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: customerEmailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppTheme.baseColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   padding: EdgeInsets.symmetric(vertical: 16.0),
                  //   decoration: BoxDecoration(
                  //     color: AppTheme.primaryButtonBackground,
                  //   ),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       BlocProvider.of<EmailSubscriptionBloc>(context).add(
                  //           OnButtonClickEvent(customerEmailController.text,
                  //               widget.pluginName));
                  //     },
                  //     child: Center(
                  //       child: Text(
                  //         'Subscribe',
                  //         style: TextStyle(
                  //           color: AppTheme.primaryButtonText,
                  //           fontSize: DashboardFontSize.descFontSize,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryButtonBackground,
                    ),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<EmailSubscriptionBloc>(context).add(
                          OnButtonClickEvent(
                              customerEmailController.text, widget.pluginName),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            color: AppTheme.primaryButtonText,
                            fontSize: DashboardFontSize.descFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                   GestureDetector(
                    onTap: () async {
                      await Session().setDisableEmailNotification(true);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No Thanks, I don't like discounts.",
                      style: TextStyle(
                          fontSize: DashboardFontSize.descFontSize,
                          color: AppTheme.baseColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Text(
                  //   "No Thanks, I don't like discounts.",
                  //   style: TextStyle(
                  //       fontSize: DashboardFontSize.descFontSize,
                  //       color: AppTheme.baseColor),
                  //   textAlign: TextAlign.center,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
