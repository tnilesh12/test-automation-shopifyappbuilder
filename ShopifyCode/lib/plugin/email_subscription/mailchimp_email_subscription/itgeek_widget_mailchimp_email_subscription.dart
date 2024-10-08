import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_bloc.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_event.dart';
import 'package:shopify_code/plugin/email_subscription/bloc/email_subscription_state.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';

class ItgeekWidgetMailchimpEmailSubscription extends StatelessWidget {
  final MailChimpAddSectionData mailChimpAddSectionData;
  ItgeekWidgetMailchimpEmailSubscription(this.mailChimpAddSectionData);

  @override
  Widget build(BuildContext context) {
    TextEditingController customerEmailController = new TextEditingController();
    return BlocProvider(
      create: (context) => EmailSubscriptionBloc(),
      child: BlocListener<EmailSubscriptionBloc, EmailSubscriptionState>(
        listener: (context, state) {
          if (state is EmailEmptyState) {
            Dialogs.ErrorAlertInOut(
                context: context, message: "Email cannot be empty.");
          } else if (state is EmailInvalidState) {
            Dialogs.ErrorAlertInOut(
                context: context, message: "Invalid email format.");
          } else if (state is EmailSubscriptionSuccessState) {
            Dialogs.SuccessAlertInOut(
                context: context, message: state.successMessage);
          }
        },
        child: BlocBuilder<EmailSubscriptionBloc, EmailSubscriptionState>(
          builder: (context, state) {
            return Container(
              color: mailChimpAddSectionData.backgroundColor == null
                  ? AppTheme.primaryLightBackgroundColor
                  : Utils.getColorFromHex(
                      mailChimpAddSectionData.backgroundColor!),
              child: mailChimpAddSectionData.imageInBackground!
                  ? Stack(
                      children: [
                        Positioned.fill(
                          child: WidgetImage(mailChimpAddSectionData.imageSrc!,
                              fit: BoxFit.cover),
                        ),
                        Column(
                          children: [
                            if (mailChimpAddSectionData.text != null)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 24),
                                child: Text(
                                  mailChimpAddSectionData.text!,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color:
                                          mailChimpAddSectionData.textColor ==
                                                  null
                                              ? AppTheme.primaryDarkTextColor
                                              : Utils.getColorFromHex(
                                                  mailChimpAddSectionData
                                                      .textColor!),
                                      fontSize: DashboardFontSize.descFontSize),
                                ),
                              ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  DashboardFontSize.marginLeft,
                                  DashboardFontSize.marginTop,
                                  DashboardFontSize.marginRight,
                                  DashboardFontSize.marginBottom),
                              child: TextField(
                                controller: customerEmailController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hintText:
                                        mailChimpAddSectionData.placeholder),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppTheme.white!.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(
                                      DashboardFontSize.customBorderRadius),
                                  border: Border.all(
                                    color: AppTheme.borderColor!,
                                  )
                                  // border: Border.all(width: 0.1),
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<EmailSubscriptionBloc>(context)
                                    .add(OnButtonClickEvent(
                                        customerEmailController.text,
                                        "mailchimp"));
                              },
                              child: Container(
                                // margin: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.only(
                                    bottom: DashboardFontSize.marginBottom),
                                // padding: EdgeInsets.all(10.0),
                                padding: EdgeInsets.fromLTRB(
                                    DashboardFontSize.paddingLeft,
                                    DashboardFontSize.paddingTop,
                                    DashboardFontSize.paddingRight,
                                    DashboardFontSize.paddingBottom),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryButtonBackground,
                                  borderRadius: BorderRadius.circular(
                                      DashboardFontSize.customBorderRadius),
                                ),
                                child: Center(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    mailChimpAddSectionData.button ?? '',
                                    style: TextStyle(
                                      color: AppTheme.primaryButtonText,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        if (mailChimpAddSectionData.imageSrc != null)
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            child:
                                WidgetImage(mailChimpAddSectionData.imageSrc!),
                          ),
                        if (mailChimpAddSectionData.text != null)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 24),
                            child: Text(
                              mailChimpAddSectionData.text!,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: mailChimpAddSectionData.textColor ==
                                          null
                                      ? AppTheme.primaryDarkTextColor
                                      : Utils.getColorFromHex(
                                          mailChimpAddSectionData.textColor!),
                                  fontSize: DashboardFontSize.descFontSize),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              DashboardFontSize.marginLeft,
                              DashboardFontSize.marginTop,
                              DashboardFontSize.marginRight,
                              DashboardFontSize.marginBottom),
                          child: TextField(
                            controller: customerEmailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: mailChimpAddSectionData.placeholder),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: AppTheme.white!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                  DashboardFontSize.customBorderRadius),
                              border: Border.all(
                                color: AppTheme.borderColor!,
                              )
                              // border: Border.all(width: 0.1),
                              ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<EmailSubscriptionBloc>(context).add(
                                OnButtonClickEvent(
                                    customerEmailController.text, "mailchimp"));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryButtonBackground,
                              borderRadius: BorderRadius.circular(
                                  DashboardFontSize.customBorderRadius),
                            ),
                            child: Center(
                              child: Text(
                                mailChimpAddSectionData.button ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppTheme.primaryButtonText,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
