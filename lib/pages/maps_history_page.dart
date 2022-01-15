import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/widgets/scan_list.dart';

class MapsHistoryPage extends StatelessWidget {
  const MapsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanList(type: "geo");
  }
}
