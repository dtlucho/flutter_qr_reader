import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
import 'package:flutter_qr_reader/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancel',
          false,
          ScanMode.QR,
        );

        // String barcodeScanRes = "https://google.com";
        // String barcodeScanRes = "geo:-34.5675921,-58.488046";

        if (barcodeScanRes == "-1") return;

        final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(
          context,
          listen: false,
        );

        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, newScan);
      },
    );
  }
}
