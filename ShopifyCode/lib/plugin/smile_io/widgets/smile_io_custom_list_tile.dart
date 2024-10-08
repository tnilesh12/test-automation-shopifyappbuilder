import 'package:flutter/material.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmileIoCustomListTile extends StatelessWidget {
  final double defaultFontSize = 18;
  final String text;
  final Function()? onPressed;
  // final Color? backgroundColor;
  final String? leadingIcon;
  final String? trailingIcon;
  final ShapeBorder? borderShape;

  SmileIoCustomListTile(
      {super.key,
      required this.text,
      this.onPressed,
      this.leadingIcon,
      this.trailingIcon,
      this.borderShape});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      child: ListTile(
        shape: borderShape,
        leading: leadingIcon != "" ? Container(
          width: 25,
          child: SvgPicture.asset(
            leadingIcon!,
          ),
        ) : null,
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
  }
}
