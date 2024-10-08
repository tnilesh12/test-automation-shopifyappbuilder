import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/form/form_bloc/form_bloc.dart';
import 'package:shopify_code/form/form_bloc/form_event.dart';
import 'package:shopify_code/form/form_bloc/form_state.dart';
import 'package:shopify_code/form/form_builder_shimmer_view.dart';
import 'package:shopify_code/form/myComponents/index.dart';
import 'package:shopify_code/theme/app_assets.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import 'package:shopify_code/util/utils.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class FormWidget extends StatefulWidget {
  String formId, backgroundColor, fontColor;

  FormWidget(this.formId, this.backgroundColor, this.fontColor, {super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final String formId = widget.formId!;
    Color textColor = Utils.getColorFromHex(widget.fontColor!);
    Color backgroundColor = Utils.getColorFromHex(widget.backgroundColor!);

    return BlocProvider(
        create: (context) => CustomFormBloc(formId, textColor, backgroundColor),
        child: BlocListener<CustomFormBloc, CustomFormState>(
          listener: (context, state) {
            if (state is CustomFormSubmittedSuccessfullyState) {
              Dialogs.SuccessAlertInOut(
                  context: context, message: state.message);
              context.read<CustomFormBloc>().add(CustomFormReloadEvent());
            }
            if (state is CustomFormAPIFailureState) {
              context.read<CustomFormBloc>().add(CustomFormReloadEvent());
            }
          },
          child: BlocBuilder<CustomFormBloc, CustomFormState>(
            builder: (context, state) {
              if (state is CustomFormLoadingState) {
                return FormBuilderShimmerView();
              } else if (state is CustomFormAPIFailureState) {
                return Container();
              } else {
                //(state is CustomFormDataLoadedState) {
                return Container(
                  padding: EdgeInsets.fromLTRB(
                      DashboardFontSize.paddingLeft,
                      DashboardFontSize.paddingTop,
                      DashboardFontSize.paddingRight,
                      DashboardFontSize.paddingBottom),
                  color: Utils.getColorFromHex(widget.backgroundColor),
                  // padding: EdgeInsets.all(10),
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  // child: SingleChildScrollView(
                  child: Form(
                    // autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: [
                        context.read<CustomFormBloc>().formModel!.name != ""
                            // state.formModel.name != ""
                            ? Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(top: 10, bottom: 3),
                                child: Text(
                                    context
                                        .read<CustomFormBloc>()
                                        .formModel!
                                        .name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                          fontSize:
                                              DashboardFontSize.headingFontSize,
                                        )),
                              )
                            : Container(),
                        context
                                    .read<CustomFormBloc>()
                                    .formModel!
                                    .formJson!
                                    .description !=
                                ""
                            ? Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(top: 5, bottom: 3),
                                child: Text(
                                  context
                                      .read<CustomFormBloc>()
                                      .formModel!
                                      .formJson!
                                      .description!,
                                  style: TextStyle(
                                      fontSize: DashboardFontSize.descFontSize,
                                      color: textColor),
                                ),
                              )
                            : Container(),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children:
                                context.read<CustomFormBloc>().formWidgetList!,
                          ),
                        ),
                        state is CustomFormSubmittingState
                            ? Container(
                                alignment: Alignment.center,
                                height: DashboardFontSize.dashboardButtonSize,
                                width: double.infinity,
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(bottom: 10, top: 10),
                                child: Image.asset(
                                  AppAssets.loadingImg,
                                  color: AppTheme.primaryButtonText,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(DashboardFontSize
                                            .customBorderRadius)),
                                    color: AppTheme.primaryButtonBackground),
                              )
                            : InkWell(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    bool value = false;
                                    bool valid = true;

                                    for (var field in context
                                        .read<CustomFormBloc>()
                                        .formWidgetList!) {
                                      if (field is SimpleText) {
                                        print(
                                            "-------------------value of SimpleRadios-----$value");
                                        if (!field.isValid) {
                                          valid = false;
                                          //break;
                                        }
                                      } else if (field is SimpleSelect) {
                                        print(
                                            "-------------------value of SimpleRadios-----$value");
                                        if (!field.isValid) {
                                          valid = false;
                                          // break;
                                        }
                                      } else if (field is SimpleRadios) {
                                        value = await field.s!.validate();
                                        print(
                                            "-------------------value of SimpleRadios-----$value");
                                        if (!value) {
                                          valid = false;
                                          //break;
                                        }
                                      } else if (field is SimpleListCheckbox) {
                                        value = await field.s!.validate();
                                        print(
                                            "-------------------value of SimpleListCheckbox-----$value");
                                        if (!value) {
                                          valid = false;
                                          //break;
                                        }
                                      } else if (field is SimpleSwitch) {
                                        value = await field.s!.validate();
                                        print(
                                            "-------------------value of SimpleSwitch-----$value");
                                        if (!value) {
                                          valid = false;
                                          // break;
                                        }
                                      }
                                    }
                                    if (valid) {
                                      context.read<CustomFormBloc>().add(
                                          CustomFormOnSubmitEvent(context
                                              .read<CustomFormBloc>()
                                              .formModel!));
                                    }
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: DashboardFontSize.dashboardButtonSize,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Text(
                                    context
                                        .read<CustomFormBloc>()
                                        .formModel!
                                        .formJson!
                                        .buttonText!,
                                    style: TextStyle(
                                        color: AppTheme.primaryButtonText,
                                        fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(DashboardFontSize
                                              .customBorderRadius)),
                                      color: AppTheme
                                          .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
                                      ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
                // } else  if (state is CustomFormLoadingState) {
                //   return Text("Loading State");
              }
            },
          ),
        ));
  }
}
