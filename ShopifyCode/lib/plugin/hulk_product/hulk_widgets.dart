import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shopify_code/form/helper/form_util.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/util/utils.dart';

class HulkWidgets {
  static double height = 60;
  // static Map<String,dynamic>? ans;

  // static Widget PhoneNumberWidget(
  //     {required BuildContext context,
  //     TextInputType? keyboardType,
  //     required String? hintText,
  //     required String? phoneCode,
  //     // String? Function(String?)? validator,
  //     String? initialValue,
  //     Function(String)? onChanged,
  //     Function()? onClickCountry,
  //     String? prefixIcon,
  //     bool obscureText = false,
  //     List<ValuesJson>? valueJson,
  //     int? uniqueId}) {
  //   TextEditingController controller = TextEditingController();
  //   return Column(
  //     children: [
  //       Container(
  //         height: height, //ThemeSize.themeTextFieldSize,
  //         alignment: Alignment.center,
  //         child: Focus(
  //           onFocusChange: (value) {
             
         
  //          if (controller.text.length > 9) {
  //               HulkProductWidget.globalJson['PhoneUniqueId'] = uniqueId;
  //               HulkProductWidget.globalJson['phoneData'] = controller.text;
             
  //               HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);
                
  //              // print("global data----> ${HulkProductWidget.globalJson}");
  //             }
        
  //           },
            
  //           child: TextFormField(
  //             style: CustomTextTheme.getTextStyle(
  //                 MyTextStyle.TextFormFieldInput, context),
  //             controller: controller,
  //             keyboardType: keyboardType,
  //             obscureText: obscureText,
  //             maxLength: 10,
  //             // validator: validator,
  //             initialValue: initialValue,
  //             onChanged: onChanged,
  //             cursorColor: AppTheme.editTextControllerTextColor,
        
  //             // keyboardType: (hintText.contains(AppLocalizations.of(context)!.mobil))
  //             //     ? TextInputType.number
  //             //     : TextInputType.emailAddress,
  //             //   style: Theme.of(context)
  //             // .textTheme
  //             // .bodyMedium!
  //             // .copyWith(color: AppTheme.black,),
  //             showCursor: true,
  //             decoration: InputDecoration(
  //               counterText: "",
  //               contentPadding: EdgeInsets.fromLTRB(
  //                         DashboardFontSize.paddingLeft,
  //                         DashboardFontSize.paddingTop,
  //                         DashboardFontSize.paddingRight,
  //                         DashboardFontSize.paddingBottom),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10)),
  //                 borderSide: BorderSide(
                   
  //                   style: BorderStyle.none,
  //                 ),
  //               ),
  //               // labelText: labelText,
  //               filled: true,
  //               prefixIcon: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   prefixIcon == ""
  //                       ? Container()
  //                       : InkResponse(
  //                           child: Container(
  //                             padding: EdgeInsets.fromLTRB(
  //                         DashboardFontSize.paddingLeft,
  //                         DashboardFontSize.paddingTop,
  //                         DashboardFontSize.paddingRight,
  //                         DashboardFontSize.paddingBottom),//const EdgeInsets.all(12.0),
  //                             child: Container(
  //                               // padding: EdgeInsets.all(10),
  //                               width: 25,
  //                               child: SvgPicture.asset(
  //                                 prefixIcon!,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                   InkResponse(
  //                     onTap: () {
  //                       onClickCountry!.call();
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       // margin: const EdgeInsets.only(right: 5),
  //                       // width: 60,
  //                       padding: EdgeInsets.fromLTRB(
  //                         DashboardFontSize.paddingLeft,
  //                         DashboardFontSize.paddingTop,
  //                         DashboardFontSize.paddingRight,
  //                         DashboardFontSize.paddingBottom),//const EdgeInsets.fromLTRB(10, 12, 10, 12),
  //                       child: Text(
  //                         phoneCode!,
  //                         style: TextStyle(fontWeight: FontWeight.bold),
  //                         // textAlign: TextAlign.center,
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               // fillColor: Color.fromARGB(255, 0, 2, 6),
  //               labelStyle: CustomTextTheme.getTextStyle(
  //                   MyTextStyle.TextFormFieldInput, context),
  //               labelText: hintText,
  //             ),
  //           ),
  //         ),
          
  //       ),
  //       if (controller.text.isEmpty)
  //         Padding(
  //           padding: const EdgeInsets.only(top: 8.0),
  //           child: Text(
  //             '* This field is required',
  //             style: TextStyle(color: Colors.red, fontSize: 12),
  //           ),
  //         )
  //       else
  //         Container(),
        
  //     ],
  //   );
    
    
  // }

  // static Widget TextBoxWidget({
  //   required BuildContext context,
  //   TextEditingController? controller,
  //   TextCapitalization? textCapitalization,
  //   required String? hintText,
  //   String? initialValue,
  //   TextInputType? keyboardType,
  //   Function(String)? onChanged,
  //   bool obscureText = false,
  //   int? uniqueId,
  // }) {
  //   TextEditingController textController = TextEditingController();
  //   return Container(
  //     height: height, //ThemeSize.themeTextFieldSize,
  //     alignment: Alignment.center,
  //     child: Focus(
  //       onFocusChange: (value) {
  //         if (textController.text.length > 0) {
            

  //           HulkProductWidget.globalJson['TextWidgetsUniqueId'] = uniqueId;
  //           HulkProductWidget.globalJson['TextWidgetsdata'] = textController.text;
          
  //           HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);
          
  //          // print("global data----> ${HulkProductWidget.globalJson}");

  //         }
  //       },
  //       child: TextFormField(
  //         textCapitalization: textCapitalization ?? TextCapitalization.none,
  //         style: CustomTextTheme.getTextStyle(
  //             MyTextStyle.TextFormFieldInput, context),
  //         // style: AppTextTheme,
  //         controller: textController,
  //         obscureText: obscureText,
  //         // validator: validator,
  //         initialValue: initialValue,
  //         onChanged: onChanged,
  //         cursorColor: AppTheme.editTextControllerTextColor,
  //         keyboardType: keyboardType,
  //         //   style: Theme.of(context)
  //         // .textTheme
  //         // .bodyMedium!
  //         // .copyWith(color: AppTheme.black,),
  //         showCursor: true,
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.fromLTRB(
  //                     DashboardFontSize.paddingLeft,
  //                     DashboardFontSize.paddingTop,
  //                     DashboardFontSize.paddingRight,
  //                     DashboardFontSize.paddingBottom),//EdgeInsets.fromLTRB(5, 10, 5, 10),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             borderSide: BorderSide(
  //              // width: 0,
  //               style: BorderStyle.none,
  //             ),
  //           ),
  //           // labelText: labelText,
  //           filled: true,
  //           // fillColor: Color(0xFFF2F3F5),
  //           labelStyle: CustomTextTheme.getTextStyle(
  //               MyTextStyle.TextFormFieldInput, context),
  //           labelText: hintText,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static Widget TextAreaWidget(
  //     {required BuildContext context,
  //     TextCapitalization? textCapitalization,
  //     required String? hintText,
  //     // String? Function(String?)? validator,
  //     String? initialValue,
  //     TextInputType? keyboardType,
  //     Function(String)? onChanged,
  //     // Color? backgroundColor,
  //     // Color? textColor,
  //     bool obscureText = false,
  //     int? uniqueId}) {
  //        TextEditingController textAreacontroller = TextEditingController();
  //   return Container(
  //     height: 100, //ThemeSize.themeTextFieldSize,
  //     alignment: Alignment.center,
  //     child: Focus(
  //       onFocusChange: (value) {
  //         if (textAreacontroller!.text.length > 0) {
  //           HulkProductWidget.globalJson['textAreasUniqueId'] = uniqueId;
  //           HulkProductWidget.globalJson['textAreasdata'] = textAreacontroller.text;
               
  //           HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

  //          // print("global data----> ${HulkProductWidget.globalJson}");
  //         }
  //       },
  //       child: TextFormField(
  //         textCapitalization: textCapitalization ?? TextCapitalization.none,
  //         style: CustomTextTheme.getTextStyle(
  //             MyTextStyle.TextFormFieldInput, context),
  //         maxLines: 5,
  //         // style: AppTextTheme,
  //         controller: textAreacontroller,
  //         obscureText: obscureText,
  //         // validator: validator,
  //         initialValue: initialValue,
  //         onChanged: onChanged,
  //         cursorColor: AppTheme.editTextControllerTextColor,
  //         keyboardType: keyboardType,
  //         //   style: Theme.of(context)
  //         // .textTheme
  //         // .bodyMedium!
  //         // .copyWith(color: AppTheme.black,),
  //         showCursor: true,
  //         decoration: InputDecoration(
  //           contentPadding:  EdgeInsets.fromLTRB(
  //                     DashboardFontSize.paddingLeft,
  //                     DashboardFontSize.paddingTop,
  //                     DashboardFontSize.paddingRight,
  //                     DashboardFontSize.paddingBottom),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(DashboardFontSize.customBorderRadius)),
  //             borderSide: BorderSide(
               
  //               style: BorderStyle.none,
  //             ),
  //           ),
  //           // labelText: labelText,
  //           filled: true,
  //           // fillColor: Color(0xFFF2F3F5),
  //           labelStyle: CustomTextTheme.getTextStyle(
  //               MyTextStyle.TextFormFieldInput, context),
  //           labelText: hintText,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static Widget EmailWidget(
  //     {required BuildContext context,
  //     TextCapitalization? textCapitalization,
  //     required String? hintText,
  //     // String? Function(String?)? validator,
  //     String? initialValue,
  //     Function(String)? onChanged,
  //     // Color? backgroundColor,
  //     // Color? textColor,
  //     bool obscureText = false,
  //      int? uniqueId}) {
  //          TextEditingController emailcontroller = TextEditingController();
  //   return Container(
  //     height: height, //ThemeSize.themeTextFieldSize,
  //     alignment: Alignment.center,
  //     child: Focus(
  //       onFocusChange: (value) {
  //         if (emailcontroller!.text.length > 0) {
  //           HulkProductWidget.globalJson['emailsUniqueId'] = uniqueId;
  //           HulkProductWidget.globalJson['emailsdata'] = emailcontroller.text;
               
  //           HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

  //           print("global data----> ${HulkProductWidget.globalJson}");
  //         }
  //       },
  //       child: TextFormField(
  //         textCapitalization: textCapitalization ?? TextCapitalization.none,
  //         style: CustomTextTheme.getTextStyle(
  //             MyTextStyle.TextFormFieldInput, context),
  //         // style: AppTextTheme,
  //         controller: emailcontroller,
  //         obscureText: obscureText,
  //         // validator: validator,
  //         initialValue: initialValue,
  //         onChanged: onChanged,
  //         cursorColor: AppTheme.editTextControllerTextColor,
  //         keyboardType: TextInputType.emailAddress,
  //         //   style: Theme.of(context)
  //         // .textTheme
  //         // .bodyMedium!
  //         // .copyWith(color: AppTheme.black,),
  //         showCursor: true,
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             borderSide: BorderSide(
  //               width: 0,
  //               style: BorderStyle.none,
  //             ),
  //           ),
  //           // labelText: labelText,
  //           filled: true,
  //           // fillColor: Color(0xFFF2F3F5),
  //           labelStyle: CustomTextTheme.getTextStyle(
  //               MyTextStyle.TextFormFieldInput, context),
  //           labelText: hintText,
  //         ),
  //       ),
  //     ),
  //   );
  // }

//  static Widget FileUploadWidget(){}

  // static Widget NumberFieldWidget(
  //     {required BuildContext context,
  //     TextCapitalization? textCapitalization,
  //     required String? hintText,
  //     // String? Function(String?)? validator,
  //     String? initialValue,
  //     Function(String)? onChanged,
  //     // Color? backgroundColor,
  //     // Color? textColor,
  //     bool obscureText = false,
  //      int? uniqueId}) {
  //         TextEditingController? numberFieldcontroller =TextEditingController();
  //   return Container(
  //     height: height, //ThemeSize.themeTextFieldSize,
  //     alignment: Alignment.center,
  //     child: Focus(
  //         onFocusChange: (value) {
  //         if (numberFieldcontroller!.text.length > 0) {
  //           HulkProductWidget.globalJson['numberFieldsUniqueId'] = uniqueId;
  //           HulkProductWidget.globalJson['numberFieldsdata'] = numberFieldcontroller.text;
               
  //           HulkProductWidget.globalJson.addAll(HulkProductWidget.globalJson);

  //          // print("global data----> ${HulkProductWidget.globalJson}");
  //         }
  //       },
  //       child: TextFormField(
  //         textCapitalization: textCapitalization ?? TextCapitalization.none,
  //         style: CustomTextTheme.getTextStyle(
  //             MyTextStyle.TextFormFieldInput, context),
  //         // style: AppTextTheme,
  //         controller: numberFieldcontroller,
  //         obscureText: obscureText,
  //         // validator: validator,
  //         initialValue: initialValue,
  //         onChanged: onChanged,
  //         cursorColor: AppTheme.editTextControllerTextColor,
  //         keyboardType: TextInputType.number,
  //         //   style: Theme.of(context)
  //         // .textTheme
  //         // .bodyMedium!
  //         // .copyWith(color: AppTheme.black,),
  //         showCursor: true,
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //             borderSide: BorderSide(
  //               width: 0,
  //               style: BorderStyle.none,
  //             ),
  //           ),
  //           // labelText: labelText,
  //           filled: true,
  //           // fillColor: Color(0xFFF2F3F5),
  //           labelStyle: CustomTextTheme.getTextStyle(
  //               MyTextStyle.TextFormFieldInput, context),
  //           labelText: hintText,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static Widget ButtonWidget(
  //     String? name, Function()? onPressed, List<ValuesJson>? valueJson) {
  //   final double defaultFontSize = 16;
  //   final String text;
  //   // final Function()? onPressed;
  //   // final Color? backgroundColor;
  //   // final Color? textColor;
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.all(4),
  //         child: Text(
  //           name!,
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //       InkWell(
  //         onTap: onPressed,
  //         child: Container(
  //           alignment: Alignment.center,
  //           height: height, //ThemeSize.themeButtonSize,
  //           width: double.infinity,
  //           // child: ElevatedButton(
  //           padding: EdgeInsets.all(10.0),
  //           // onPressed: () {},
  //           child: Text(
  //             valueJson!.first.optionVal.toString(),
  //             style: TextStyle(
  //                 color:
  //                     Colors.black, //textColor ?? AppTheme.primaryButtonText!,
  //                 fontSize: defaultFontSize),
  //             textAlign: TextAlign.center,
  //           ),
  //           decoration: BoxDecoration(
  //               // shape: BoxShape.circle,
  //               borderRadius: BorderRadius.all(
  //                   Radius.circular(10 //ThemeSize.themeBorderRadius
  //                       )),
  //               color: Colors.blue
  //               // backgroundColor ??
  //               //     AppTheme
  //               //         .primaryButtonBackground // ?? AppColors.accent, // Color(0xFFF2F3F7)
  //               ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // static Map<String, dynamic> cloneJson(Map<String, dynamic> jsonMap) {
  //   // Encode the map to a JSON string
  //   String jsonString = jsonEncode(jsonMap);

  //   // Decode the JSON string back to a map
  //   return jsonDecode(jsonString);
  // }

  // static Map<String, dynamic> addClonedMapToGlobal(
  //     Map<String, dynamic> globalMap, Map<String, dynamic> clonedMap) {
  //   // Create a new map by copying the global map
  //   Map<String, dynamic> newGlobalMap = Map<String, dynamic>.from(globalMap);

  //   // Add/modify the cloned map in the new global map
  //   newGlobalMap.addAll(clonedMap);

  //   return newGlobalMap;
  // }
}
