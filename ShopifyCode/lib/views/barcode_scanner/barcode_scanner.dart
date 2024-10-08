import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner extends StatelessWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  Future<String> scanBarcode(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      return barcodeScanRes == '-1' ? '' : barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to scan.';
      return barcodeScanRes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.barcode_reader),
      onPressed: () async {
        String barcode = await scanBarcode(context);
        // Handle scanned barcode here or pass it to the parent widget
      },
    );
  }
}
