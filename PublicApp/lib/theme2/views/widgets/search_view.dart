import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/custom_text_theme.dart';
import 'package:shopify_code/theme/my_text_style.dart';
import 'package:shopify_code/views/barcode_scanner/barcode_scanner.dart';
import '/theme2/utils/theme_size.dart';
import 'package:shopify_code/database/database_operation.dart';
import 'package:shopify_code/globels.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

class SearchViewWidget extends StatefulWidget {
  BuildContext context;
  String searchTxt;
  Function(String) onSubmit;
  Function() onTap;
  Function(String)? onTextChange;
  FocusNode focusNode;

  SearchViewWidget(
      this.context, this.searchTxt, this.onSubmit, this.onTap, this.focusNode,
      {this.onTextChange});

  @override
  State<SearchViewWidget> createState() => _SearchViewWidgetState();
}

class _SearchViewWidgetState extends State<SearchViewWidget> {
  TextEditingController txtController = TextEditingController();
  BarcodeScanner barcodeScanner = BarcodeScanner();

  @override
  void initState() {
    super.initState();
    txtController.text = widget.searchTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeSize.themeTextFieldSize,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(
          ThemeSize.marginLeft, 10, ThemeSize.marginRight, 5),
      child: TextField(
        style: CustomTextTheme.getTextStyle(
            MyTextStyle.TextFormFieldInput, context),
        controller: txtController,
        readOnly: false,
        focusNode: widget.focusNode,
        onChanged: (text) {
          widget.onTextChange?.call(text);
          setState(() {}); // Update the state when text changes
        },
        // searchTxt == AppLocalizations.of(context)!.tap ? true : false,
        onTap: widget.onTap,
        cursorColor: AppTheme.editTextControllerTextColor,
        onSubmitted: (value) {
          // if (value.trim() != "") {
          widget.onSubmit.call(value.trim());
          addSearchToHistory(value.trim());
          // }
        },

        decoration: InputDecoration(
          hintText: LanguageManager.translations()['Search']!,
          // AppLocalizations.of(context)!.search,
          hintStyle: CustomTextTheme.getTextStyle(
              MyTextStyle.TextFormFieldInput, context),
          contentPadding: EdgeInsets.fromLTRB(20, 0, 12, 0),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(ThemeSize.themeBorderRadius)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          // fillColor: Color(0xFFF2F3F5),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // IconButton(
              //   icon: Icon(Icons.barcode_reader),
              //   onPressed: () async {
              //     String barcode = await barcodeScanner.scanBarcode(context);
              //     if (barcode.isNotEmpty) {
              //       txtController.text = barcode;
              //       widget.onSubmit.call(barcode);
              //       addSearchToHistory(barcode);
              //     }
              //   },
              // ),
              txtController.text.isNotEmpty
              ? IconButton(
                  icon: Container(
                    width: 35, //MediaQuery.of(context).size.width * 0.09,
                    height: 35, //MediaQuery.of(context).size.height * 0.09,
                    padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                    child: SvgPicture.asset("assets/images/close-icon.svg",
                        colorFilter: ColorFilter.mode(
                            AppTheme.editTextControllerTextColor!,
                            BlendMode.srcIn)),
                  ),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    txtController.clear();
                    widget.onSubmit.call(txtController.text.trim());
                  },
                )
              : IconButton(
                  icon: Container(
                    width: 35, //MediaQuery.of(context).size.width * 0.09,
                    height: 35, //MediaQuery.of(context).size.height * 0.09,
                    padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                    child: SvgPicture.asset("assets/images/search.svg",
                        colorFilter: ColorFilter.mode(
                            AppTheme.editTextControllerTextColor!,
                            BlendMode.srcIn)),
                  ),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    widget.onSubmit.call(txtController.text.trim());
                    addSearchToHistory(txtController.text.trim());
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void addSearchToHistory(String searchedText) async {
    print("addSearchToHistory $searchedText");
    if (searchedText.trim().isNotEmpty) {
      await DataBaseOperation(globals.database!).insertSearchHistory(
          searchedText); //await DataBaseUtil.insertSearchHistory(searchedText);
    }
  }
}

// class SearchViewWidget1 {
//   Widget SearchView(BuildContext context, String searchTxt,
//       Function(String) onSubmit, Function() onTap) {
//     TextEditingController txtController = TextEditingController();
//     txtController.text = searchTxt;
// return Text("data");
//    }
// }

