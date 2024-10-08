import 'package:flutter/material.dart';
import 'package:shopify_code/theme/app_theme.dart';

class StarWidget extends StatefulWidget {
  Function(String) onclickevent;
  bool enableClick;
  double size;
  int initialCount;
  StarWidget(this.onclickevent, this.enableClick, this.size,
      {this.initialCount = 0, super.key});
  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.enableClick
              ? () {
                  widget.initialCount = 1;
                  widget.onclickevent.call(widget.initialCount.toString());
                  setState(() {});
                }
              : () {},
          child: Icon(
            widget.initialCount < 1 ? Icons.star_border : Icons.star,
            size: widget.size,
            color: AppTheme.ratingColor,
          ),
        ),
        InkWell(
          onTap: widget.enableClick
              ? () {
                  widget.initialCount = 2;
                  widget.onclickevent.call(widget.initialCount.toString());
                  setState(() {});
                }
              : () {},
          child: Icon(
            widget.initialCount < 2 ? Icons.star_border : Icons.star,
            size: widget.size,
            color: AppTheme.ratingColor,
          ),
        ),
        // Padding(padding: EdgeInsets.only(right: 15)),
        InkWell(
          onTap: widget.enableClick
              ? () {
                  widget.initialCount = 3;
                  widget.onclickevent.call(widget.initialCount.toString());
                  setState(() {});
                }
              : () {},
          child: Icon(
            widget.initialCount < 3 ? Icons.star_border : Icons.star,
            size: widget.size,
            color: AppTheme.ratingColor,
          ),
        ),
        // Padding(padding: EdgeInsets.only(right: 15)),
        InkWell(
          onTap: widget.enableClick
              ? () {
                  widget.initialCount = 4;
                  widget.onclickevent.call(widget.initialCount.toString());
                  setState(() {});
                }
              : () {},
          child: Container(
            child: Icon(
              widget.initialCount < 4 ? Icons.star_border : Icons.star,
              size: widget.size,
              color: AppTheme.ratingColor,
            ),
          ),
        ),
        // Padding(padding: EdgeInsets.only(right: 15)),
        InkWell(
          onTap: widget.enableClick
              ? () {
                  widget.initialCount = 5;
                  widget.onclickevent.call(widget.initialCount.toString());
                  setState(() {});
                }
              : () {},
          child: Container(
            child: Icon(
              widget.initialCount < 5 ? Icons.star_border : Icons.star,
              size: widget.size,
              color: AppTheme.ratingColor,
            ),
          ),
        ),
      ],
    );
  }
}
