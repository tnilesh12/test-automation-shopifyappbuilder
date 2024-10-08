import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double defaultFontSize = 16;
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  // bool showloading = true;

  // final Color? backgroundColor;
  // final Color? textColor;

  CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: double.infinity,
        // child: ElevatedButton(
        padding: EdgeInsets.all(10.0),
        // onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white!,
              fontSize: defaultFontSize),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius:
                BorderRadius.all(Radius.circular(5)),
            color: backgroundColor ??
                Colors.black
            ),
      ),
    );
  }
}
