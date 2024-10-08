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
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        // minVerticalPadding: 0.0,
        // dense: ,
        // horizontalTitleGap: ,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
        shape: borderShape,
        leading: Container(
          width: 25,
          child: SvgPicture.asset(leadingIcon!,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn)),
        ),
        title: Text(
          text,
          style:
              CustomTextTheme.getTextStyle(MyTextStyle.ListTileTitle, context),
          // style: TextStyle(color: Colors.black),
        ),
        trailing: Container(
          width: 25, //MediaQuery.of(context).size.width * 0.058,
          child: SvgPicture.asset(trailingIcon!,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn)),
        ),
        onTap: onPressed,
      ),
    );
  }
}
