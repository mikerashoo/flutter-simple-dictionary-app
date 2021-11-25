import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'words.db');
    final isExist = await databaseExists(path);
    if (isExist) {
      return await openDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        // ignore: empty_catches
      } catch (e) {}

      ByteData data = await rootBundle.load(join("assets", "words.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      return await openDatabase(path);
    }
  }
}
