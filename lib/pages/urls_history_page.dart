import 'package:flutter/material.dart';

import 'package:flutter_qr_reader/widgets/scan_list.dart';

class UrlsHistoryPage extends StatelessWidget {
  const UrlsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanList(type: "http");
  }
}
