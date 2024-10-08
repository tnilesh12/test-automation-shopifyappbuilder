import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/util/datetime_utils.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../utils/theme_size.dart';

class BlogScreenItemView extends StatelessWidget {
  int index;
  String imageUrl, title, publishedAt;
  void Function()? onTap;

  BlogScreenItemView(
      this.index, this.imageUrl, this.title, this.publishedAt, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(10),
                  borderRadius: BorderRadius.all(
                      Radius.circular(ThemeSize.themeBorderRadius))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: 100,
                    height: 100,
                    child: Hero(
                        tag:
                            "${LanguageManager.translations()['image']!}${index}",
                        child: WidgetImage(
                          imageUrl,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Hero(
                              tag: "title${index}",
                              child: Text(
                                title,
                                style: Theme.of(context).textTheme.bodyMedium!,
                                maxLines: 4,
                              )),
                          SizedBox(height: 5),
                          Text(
                            DateTimeUtils.getDateTime(publishedAt),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodySmall!,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
