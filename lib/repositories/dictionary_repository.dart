import 'package:flutter_simple_dictionary_app/models/word.dart';
import 'package:sqflite/sqflite.dart';

class DictionaryRepository {
  final Database db;
  DictionaryRepository({required this.db});

  Future<List<Word>> words() async {
    final maps = await db.query('words');
    List<Word> words = [];
    for (var row in maps) {
      var kafinoonoo = row["kafinoonoo"];
      var amharic = row["amharic"];
      var english = row["english"];
      var type = row["type"];
      var id = row["id"];
      Word word = Word(
          id: int.parse(id.toString()),
          kafinoonoo: kafinoonoo.toString(),
          amharic: amharic.toString(),
          english: english.toString(),
          type: type.toString());
      words.add(word);
    }
    return words;
  }
}
