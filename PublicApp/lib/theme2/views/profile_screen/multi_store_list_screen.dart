import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '/theme2/utils/theme_size.dart';

class MultiStoreScreen extends StatefulWidget {
  const MultiStoreScreen({super.key});

  @override
  State<MultiStoreScreen> createState() => _MultiStoreScreenState();
}

class _MultiStoreScreenState extends State<MultiStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Container(
              width: 35, //MediaQuery.of(context).size.width * 0.09,
              height: 35, //MediaQuery.of(context).size.height * 0.09,
              padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
              child: SvgPicture.asset("assets/images/arrow-back.svg",
                  colorFilter: ColorFilter.mode(
                      AppTheme.appBarTextColor!, BlendMode.srcIn)),
            ),
            onPressed: () {
              context.pop();
            }),
        centerTitle: true,
        title: Text(LanguageManager.translations()["Stores"]),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              ThemeSize.themeBorderRadius,
            )),
            // color: AppTheme.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // height: 70,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LanguageManager.translations()["StoreName"],
                            style: CustomTextTheme.getTextStyle(
                                MyTextStyle.MultiStoreListCardTitle, context)
                            // style: TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.bold),
                            ),
                        Icon(
                          Icons.store,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
