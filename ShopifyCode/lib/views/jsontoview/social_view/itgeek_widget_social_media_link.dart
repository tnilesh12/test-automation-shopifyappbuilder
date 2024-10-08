import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify_code/modelClass/data_model.dart';
import 'package:shopify_code/util/utils.dart';

class ItgeekWidgetSocialMediaLink extends StatelessWidget {
  SocialMediaLinksData socialMediaLinkData;
  Function(SocialMediaIconList) onClick;

  ItgeekWidgetSocialMediaLink(this.socialMediaLinkData, this.onClick);

  @override
  Widget build(BuildContext context) {
    List<SocialMediaIconList> listItems = [];
    socialMediaLinkData.iconList!.map((item) => {listItems.add(item)}).toList();

    return Container(
      color: Utils.getColorFromHex(socialMediaLinkData.backgroundColor!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listItems.map((item) {
          return IconButton(
            icon: item.color == true
                ? SvgPicture.string(
                    item.svg!,
                    colorFilter: ColorFilter.mode(
                        Utils.getColorFromHex(socialMediaLinkData.iconsColor!),
                        BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.string(
                    item.svg!,
                    width: 24,
                    height: 24,
                  ),
            onPressed: () => onClick.call(item),
          );
        }).toList(),
      ),
    );
  }
}

 // @override
  // Widget build(BuildContext context) {
  //   List<SocialMediaIconList> listItems = [];
  //   socialMediaLinkData.socialMediaIconList!
  //       .map((item) => {listItems.add(item)})
  //       .toList();

  //   return Container(
  //     alignment: Alignment.center,

  //       // padding: EdgeInsets.all(socialMediaLinkData.styleProperties!.backgroundPadding!),
  //       // margin: EdgeInsets.all(socialMediaLinkData.styleProperties!.backgroundMargin!),
  //       width: MediaQuery.of(context).size.width,
  //       color: Colors.black,

  //     //  height: socialMediaLinkData.styleProperties!.aspectRatio,
  //       child: ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: listItems.length,
  //         scrollDirection: Axis.horizontal,
  //         itemBuilder: (context, index) {
  //           return
  //               Container(
  //               //  width: socialMediaLinkData.styleProperties!.aspectRatio,
  //                 child: InkWell(
  //                   onTap: () {
  //                     print("clicked${listItems[index].link}");
  //                   },
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       listItems[index].iconVisibility! ? SvgPicture.asset(
  //                         listItems[index].icon! == "Instagram" ? 'assets/svg/insta.svg' :
  //                         listItems[index].ic! == "Facebook" ?  'assets/svg/facebook.svg' :
  //                         listItems[index].type! == "Twitter" ?  'assets/svg/twitter.svg' :
  //                         listItems[index].type! == "Mail" ?  'assets/svg/mail.svg' :
  //                         listItems[index].type! == "TikTok" ?  'assets/svg/tiktok.svg' :  'assets/svg/globe_icon.svg',
  //                         height: socialMediaLinkData.styleProperties!.aspectRatio!/2,
  //                         // width: 20,
  //                       ) : Container(),
  //                       listItems[index].iconVisibility! ? Text(listItems[index].text!,
  //                           style: TextStyle(
  //                             fontFamily: 'Cinzel',color: Util.getColorFromHex(socialMediaLinkData.styleProperties!.titleTextColor!),
  //                            fontSize: socialMediaLinkData.styleProperties!.titleTextFontSize)): Container(),
  //                     ],
  //                   ),
  //                             ),
  //               );
  //         },
  //       ));
  // }