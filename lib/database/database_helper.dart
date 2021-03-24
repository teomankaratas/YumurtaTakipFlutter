import 'package:sqflite/sqflite.dart';
import 'package:yumurtatakip2/models/muhabbet_models/muhabbet_cift_model.dart';
import 'package:yumurtatakip2/models/muhabbet_models/muhabbet_yumurta_model.dart';
import 'package:yumurtatakip2/database/database_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;
  DatabaseHelper._instance();

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = directory.path + '$muhabbetDB';
    final ciftListDb =
        await openDatabase(path, version: dbVersion, onCreate: _createDb);
    return ciftListDb;
  }

  void _createDb(Database db, int version) async {
    // CİFT TABLO
    await db.execute('''
    CREATE TABLE $ciftTable (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT , 
      $columnCiftNo INTEGER NOT NULL )
    ''');

    // YUMURTA TABLO
    await db.execute('''
    CREATE TABLE $yumurtaTable (
      $yColumnId INTEGER PRIMARY KEY AUTOINCREMENT , 
      $yColumnAitCiftNo INTEGER NOT NULL ,
      $yColumnYumurtaNo INTEGER NOT NULL , 
      $yColumnYumurtlanmaTarihi TEXT NOT NULL , 
      $yColumnYumurtaCatlamaTarihi TEXT NOT NULL ) 
      ''');
  }

  // CİFT TABLO CRUD İŞLEMLERİ =>

  Future<int> addCiftDb(MuhabbetCiftModel muhabbetCiftModel) async {
    var db = await instance.db;
    var result = await db.insert(ciftTable, muhabbetCiftModel.toMap());
    return result;
  }

  Future<int> deleteCiftDb(int id) async {
    var db = await instance.db;
    final result = await db.delete(
      ciftTable,
      where: '$columnId=?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> queryAllRowsCiftler() async {
    var db = await instance.db;
    var res = await db.query(ciftTable, orderBy: '$columnCiftNo');
    return res;
  }

  // <=  CİFT TABLO CRUD İŞLEMLERİ BURAYA KADAR .

  //YUMURTA TABLO CRUD İŞLEMLERİ . =>

  Future<int> addYumurtaDb(MuhabbetYumurtaModel muhabbetYumurtaModel) async {
    var db = await instance.db;
    var result = await db.insert(yumurtaTable, muhabbetYumurtaModel.toMap());
    return result;
  }

  Future<int> deleteYumurtaDb(int id) async {
    var db = await instance.db;
    final result = await db.delete(
      yumurtaTable,
      where: '$yColumnId=?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> querySecilenCiftYumurtalar(
      int aitCiftNo) async {
    var db = await instance.db;
    var res = await db.query(
      yumurtaTable,
      where: '$yColumnAitCiftNo=?',
      whereArgs: [aitCiftNo],
    );
    return res;
  }
}
