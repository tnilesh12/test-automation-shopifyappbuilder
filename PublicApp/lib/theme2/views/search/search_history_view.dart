import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:tag_view/tag_view.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/globels.dart' as globals;
import '/theme2/utils/theme_size.dart';

class SearchHistoryView extends StatefulWidget {
  Function(String) OnClick;
  SearchHistoryView(this.OnClick, {super.key});

  @override
  State<SearchHistoryView> createState() => _SearchHistoryViewState();
}

class _SearchHistoryViewState extends State<SearchHistoryView> {
  Future<List<String>> searchHistory() async {
    List<String> searchList = await DataBaseOperation(globals.database!)
        .getSearchTextHistory(); //await DataBaseUtil.getSearchTextHistory();
    print("searchList: $searchList");
    return searchList;
  }

  Future<void> deleteHistory(String searchHistory) async {
    await DataBaseOperation(globals.database!).deleteSearchTextHistory(
        searchHistory); //await DataBaseUtil.deleteSearchTextHistory(searchHistory);
  }

  Future<void> deleteCompleteHistory() async {
    await DataBaseOperation(globals.database!)
        .deleteSearchCompleteHistory(); //await DataBaseUtil.deleteSearchCompleteHistory();
  }

  @override
  Widget build(BuildContext context) {
    var searchList = searchHistory();
    return FutureBuilder(
        future: searchList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            print("snapshot.data${snapshot.data}");
            return Column(children: [
              snapshot.data!.isNotEmpty
                  ? Padding(
                      // padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                      padding: EdgeInsets.fromLTRB(
                          ThemeSize.paddingLeft, 10, ThemeSize.paddingRight, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageManager.translations()["recentSearch"],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            // style: TextStyle(
                            //     color: Colors.black.withAlpha(150),
                            //     fontSize: 14,),
                          ),
                          InkWell(
                            onTap: () {
                              print("delete complete history");
                              deleteCompleteHistory();
                              setState(() {});
                            },
                            child: Text(
                              LanguageManager.translations()["clearAll"],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                              // style:
                              //     TextStyle(color: Colors.black, fontSize: 14,),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              // SizedBox(
              //   height: 2,
              // ),
              TagView(snapshot.data!.reversed.toList(),
                  isEnableDelete: true,
                  tagBackgroundColor: Colors
                      .grey.shade500, //AppTheme.secondaryButtonBackground!,
                  onDelete: (deletePos) {
                print("---------ondelete$deletePos");
                setState(() {
                  // searchList.removeAt(deletePos);
                });
                deleteHistory(snapshot.data!.reversed.toList()[deletePos]);
              }, onClick: (clickPos) {
                print("onClick");
                widget.OnClick(snapshot.data![clickPos]);
              })
            ]);
          }
        });
  }
}
