import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = "http";
}
