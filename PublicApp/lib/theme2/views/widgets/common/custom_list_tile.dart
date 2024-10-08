import 'package:flutter/material.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  final double defaultFontSize = 18;
  final String text;
  final Function()? onPressed;
  // final Color? backgroundColor;
  final String? leadingIcon;
  final String? trailingIcon;
  final ShapeBorder? borderShape;

  CustomListTile(
      {super.key,
      required this.text,
      this.onPressed,
      this.leadingIcon,
      this.trailingIcon,
      this.borderShape});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        shape: borderShape,
        // leading: Icon(
        //   leadingIcon,
        //   // color: Colors.black,
        // ),
        leading: Container(
          width: 25,
          //MediaQuery.of(context).size.width * 0.058,
          child: SvgPicture.asset(
            leadingIcon!,
          ),
        ),
        title: Text(
          text,
          style:
              CustomTextTheme.getTextStyle(MyTextStyle.ListTileTitle, context),
          // style: TextStyle(color: Colors.black),
        ),
        trailing: Container(
          width: 25, //MediaQuery.of(context).size.width * 0.058,
          child: SvgPicture.asset(
            trailingIcon!,
          ),
        ),
        onTap: onPressed,
      ),
    );

    //  InkWell(
    //   onTap: onPressed,
    //   child: Container(
    //     width: double.infinity,
    //     // child: ElevatedButton(
    //     padding: EdgeInsets.all(15.0),
    //     // onPressed: () {},
    //     child: Text(
    //       text,
    //       style: TextStyle(
    //         color: AppTheme.primaryButtonText,
    //         fontSize: defaultFontSize,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //     decoration: BoxDecoration(
    //         // shape: BoxShape.circle,
    //         borderRadius: BorderRadius.circular(10),
    //         color: AppTheme.primaryButtonBackground// ?? AppColors.accent, // Color(0xFFF2F3F7)
    //         ),
    //   ),
    // );
  }
}
