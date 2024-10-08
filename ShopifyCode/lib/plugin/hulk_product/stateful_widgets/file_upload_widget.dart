import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_model.dart';
import 'package:shopify_code/plugin/hulk_product/hulk_product_widget.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/theme/dashboard_font_size.dart';

class FileUploadWidget extends StatefulWidget {
  final String? optionName;
  final bool isRequired;
  final List<ValuesJson>? valueJson;
  final String? uniqueId;
  String? type;

  FileUploadWidget({
    required this.optionName,
    required this.isRequired,
    required this.valueJson,
    required this.uniqueId,
    this.type,
  });

  _FileUploadWidgetState? s;

  @override
  _FileUploadWidgetState createState() {
    s = _FileUploadWidgetState();
    return s!;
  }
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? _fileName;
  late String _filePath = "";
  bool _isValid = true, validate = true;

  dynamic getValue() {
    return _filePath;
  }

 String getUniqueId() {
    return widget.uniqueId!;
  }

  bool validatee() {
    if (_filePath!.isNotEmpty) {
      validate = true;
    } else {
      validate = false;
    }

    if(widget.isRequired == false){
validate = true;
    }

    setState(() {});
    return validate;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _fileName = result.files.first.name;
        _filePath = result.files.first.path!;
        // HulkProductWidget.globalJson['fileUploadsUniqueId'] = widget.uniqueId;
        // HulkProductWidget.globalJson['fileUploadsdata'] = _filePath;
        // _isValid = true;

        // if (_filePath!.isNotEmpty) {
        //   validate = true;
        // }

        // HulkProductWidget.allData.value!.add({
        //   "fileUploadsUniqueId": widget.uniqueId,
        //   "fileUploadsdata": _filePath.toString(),
        //   "fileUploadsdataValidate": validate,
        //   "fileUploadsdataType": widget.type
        // });
      });
    } else {
      setState(() {
        _fileName = "No file chosen...";
      });
    }
  }

  bool validateSelection() {
    setState(() {
      _isValid = _filePath != null && _filePath!.isNotEmpty;
    });
    return _isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.optionName!.isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(
                DashboardFontSize.paddingLeft,
                DashboardFontSize.paddingTop,
                DashboardFontSize.paddingRight,
                DashboardFontSize.paddingBottom,
              ),
              child: Text(
                widget.optionName!,
                style: TextStyle(
                    color: AppTheme.editTextControllerTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          Container(
            padding: EdgeInsets.fromLTRB(
              DashboardFontSize.paddingLeft,
              DashboardFontSize.paddingTop,
              DashboardFontSize.paddingRight,
              DashboardFontSize.paddingBottom,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.grey),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      _fileName ?? "No file chosen...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _pickFile,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      DashboardFontSize.paddingLeft,
                      DashboardFontSize.paddingTop,
                      DashboardFontSize.paddingRight,
                      DashboardFontSize.paddingBottom,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          DashboardFontSize.customBorderRadius),
                    ),
                    height: 40,
                    child: Text("Choose File"),
                  ),
                ),
              ],
            ),
          ),
          validate == false
              ? Padding(
                  padding: EdgeInsets.fromLTRB(
                    DashboardFontSize.paddingLeft,
                    DashboardFontSize.paddingTop,
                    DashboardFontSize.paddingRight,
                    DashboardFontSize.paddingBottom,
                  ),
                  child: Text(
                    '* Please select a file',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
