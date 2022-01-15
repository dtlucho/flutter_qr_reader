import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_qr_reader/models/scan_model.dart';
export 'package:flutter_qr_reader/models/scan_model.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
        ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final Database db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans(id, type, value)
      VALUES($id, $type, $value)
    ''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final Database db = await database;
    final res = await db.insert("Scans", newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final Database db = await database;
    final res = await db.query("Scans", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScans() async {
    final Database db = await database;
    final res = await db.query("Scans");
    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final Database db = await database;
    final res = await db.rawQuery('''
      SELECT *
      FROM Scans
      WHERE type = "$type"
    ''');
    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel updatedScan) async {
    final Database db = await database;
    final res = await db.update(
      "Scans",
      updatedScan.toJson(),
      where: "id = ?",
      whereArgs: [updatedScan.id],
    );
    return res;
  }

  Future<int> deleteScan(String id) async {
    final Database db = await database;
    final res = await db.delete("Scans", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final Database db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }
}
