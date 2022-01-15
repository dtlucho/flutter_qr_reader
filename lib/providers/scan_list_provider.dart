import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = "http";

  void newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  void loadScans() async {
    final _scans = await DBProvider.db.getScans();
    scans = [..._scans];
    notifyListeners();
  }
}
