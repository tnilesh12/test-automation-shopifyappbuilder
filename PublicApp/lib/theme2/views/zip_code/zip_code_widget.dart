// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:shopify_code/theme/app_theme.dart';
// import 'package:shopify_code/theme/custom_text_theme.dart';
// import 'package:shopify_code/theme/my_text_style.dart';

// class ZipCodeWidget extends StatefulWidget {
//   BuildContext context;
//   TextEditingController? controller;
//   String? hintText;
//   // String? Function(String?)? validator,
//   String? initialValue;
//   Function(String)? onChanged;
  
//   Function(String)? onFieldSubmitted;
//   IconData? prefixIcon;
//   bool? obscureText;

//   ZipCodeWidget(
//       {required this.context,
//       this.controller,
//       required this.hintText,
//       // String? Function(String?)? validator,
//       this.initialValue,
//       this.onChanged,
//       this.onFieldSubmitted,
//       this.prefixIcon,
//       this.obscureText = false});
//   @override
//   State<ZipCodeWidget> createState() => _ZipCodeWidgetState();
// }

// class _ZipCodeWidgetState extends State<ZipCodeWidget> {
//   final double defaultIconSize = 17;

//   @override
//   Widget build(BuildContext context) {
//     return
//      TextFormField(
//       style:
//           CustomTextTheme.getTextStyle(MyTextStyle.TextFormFieldInput, context),
//       controller: widget.controller,
//       obscureText: widget.obscureText!,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       // validator: validator,
//       initialValue: widget.initialValue,
//       onChanged: widget.onChanged,
//       cursorColor: AppTheme.editTextControllerTextColor,
//       // keyboardType: (hintText.contains(AppLocalizations.of(context)!.mobil))
//       //     ? TextInputType.number
//       //     : TextInputType.emailAddress,
//       //   style: Theme.of(context)
//       // .textTheme
//       // .bodyMedium!
//       // .copyWith(color: AppTheme.black,fontFamily: 'Cinzel'),
//       showCursor: true,
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           borderSide: BorderSide(
//             width: 0,
//             style: BorderStyle.none,
//           ),
//         ),
//         // labelText: labelText,
//         filled: true,
//         prefixIcon: Icon(
//           widget.prefixIcon,
//           // color: Color(0xFF666666),
//           size: widget.prefixIcon != null ? defaultIconSize : 0,
//         ),
//         // fillColor: Color(0xFFF2F3F5),
//         hintStyle: CustomTextTheme.getTextStyle(
//             MyTextStyle.TextFormFieldInput, context),
//         hintText: widget.hintText,
//       ),
//     );
//   }
// }
