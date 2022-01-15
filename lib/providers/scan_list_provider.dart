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

  Future<void> loadScans() async {
    final _scans = await DBProvider.db.getScans();
    scans = [..._scans];
    notifyListeners();
  }

  Future<void> loadScansByType(String type) async {
    final _scans = await DBProvider.db.getScansByType(type);
    scans = [..._scans];
    selectedType = type;
    notifyListeners();
  }

  Future<void> deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
}
