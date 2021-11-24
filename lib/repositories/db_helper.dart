import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'dictionary.db');
    final isExist = await databaseExists(path);
    if (isExist) {
      print("exists");
      return await openDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {}

      ByteData data = await rootBundle.load(join("assets", "db.sqlite3"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print("db connected");
      return await openDatabase(path);
    }
  }
}
