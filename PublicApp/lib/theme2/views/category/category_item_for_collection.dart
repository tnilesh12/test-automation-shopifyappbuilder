import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '/theme2/utils/theme_size.dart';

class CategoryItemForCollection extends StatelessWidget {
  String imageUrl, title;
  void Function()? onTap;

  CategoryItemForCollection(this.imageUrl, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // height: 130,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
            // border: Border.all(
            //     width: 1, color: AppTheme.borderColor!.withAlpha(120))
          ),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                      width: 80,
                      height: 80,
                      child: WidgetImage(
                        imageUrl,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: Theme.of(context).textTheme!.bodySmall!,
                  softWrap: true,
                ),
              ]),
        ));
  }
}
